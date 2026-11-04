//! Westwood CPS / LCW codec. See reference/screen.cpp (ScummVM, GPL-3.0+).
use anyhow::{Result, bail, ensure};

pub fn word(b: &[u8], p: usize) -> Result<u16> {
    let s = b
        .get(p..p + 2)
        .ok_or_else(|| anyhow::anyhow!("truncated word at {p:#x}"))?;
    Ok(u16::from_le_bytes([s[0], s[1]]))
}

pub fn lcw(src: &[u8], size: usize) -> Result<Vec<u8>> {
    ensure!(size <= 16 * 1024 * 1024, "unreasonable decompressed size");
    let mut out = Vec::with_capacity(size);
    let mut p = 0;
    while out.len() < size {
        let code = *src
            .get(p)
            .ok_or_else(|| anyhow::anyhow!("truncated LCW opcode"))?;
        p += 1;
        let (len, offset) = if code & 0x80 == 0 {
            let off = ((code as usize & 15) << 8)
                | *src
                    .get(p)
                    .ok_or_else(|| anyhow::anyhow!("truncated LCW reference"))?
                    as usize;
            p += 1;
            ensure!(
                off > 0 && off <= out.len(),
                "invalid LCW back reference {off}"
            );
            ((code as usize >> 4) + 3, Some(out.len() - off))
        } else if code >= 0xc0 {
            let len = if code >= 0xfe {
                let n = word(src, p)? as usize;
                p += 2;
                n
            } else {
                (code as usize & 63) + 3
            };
            if code == 0xfe {
                let value = *src
                    .get(p)
                    .ok_or_else(|| anyhow::anyhow!("truncated LCW run"))?;
                p += 1;
                ensure!(len <= size - out.len(), "LCW run exceeds output");
                out.resize(out.len() + len, value);
                continue;
            }
            let off = word(src, p)? as usize;
            p += 2;
            (len, Some(off))
        } else if code == 0x80 {
            break;
        } else {
            (code as usize & 63, None)
        };
        ensure!(len <= size - out.len(), "LCW copy exceeds output");
        if let Some(off) = offset {
            for i in 0..len {
                let v = *out
                    .get(off + i)
                    .ok_or_else(|| anyhow::anyhow!("invalid LCW absolute reference"))?;
                out.push(v);
            }
        } else {
            out.extend_from_slice(
                src.get(p..p + len)
                    .ok_or_else(|| anyhow::anyhow!("truncated LCW literal"))?,
            );
            p += len;
        }
    }
    ensure!(
        out.len() == size,
        "LCW produced {} bytes, expected {size}",
        out.len()
    );
    Ok(out)
}

pub struct Bitmap {
    pub data: Vec<u8>,
    pub palette: Vec<u8>,
}
pub fn rle3(src: &[u8], size: usize) -> Result<Vec<u8>> {
    let mut out = Vec::with_capacity(size);
    let mut p = 0;
    while out.len() < size {
        let code = *src
            .get(p)
            .ok_or_else(|| anyhow::anyhow!("truncated RLE3"))? as i8;
        p += 1;
        if code <= 0 {
            let n = if code == 0 {
                let s = src
                    .get(p..p + 2)
                    .ok_or_else(|| anyhow::anyhow!("RLE3 length"))?;
                p += 2;
                u16::from_be_bytes([s[0], s[1]]) as usize
            } else {
                -(code as i16) as usize
            };
            let v = *src
                .get(p)
                .ok_or_else(|| anyhow::anyhow!("RLE3 run value"))?;
            p += 1;
            ensure!(n > 0 && n <= size - out.len(), "invalid RLE3 run");
            out.resize(out.len() + n, v);
        } else {
            let n = code as usize;
            ensure!(n <= size - out.len(), "RLE3 literal overflow");
            out.extend_from_slice(
                src.get(p..p + n)
                    .ok_or_else(|| anyhow::anyhow!("RLE3 literal"))?,
            );
            p += n;
        }
    }
    Ok(out)
}
pub fn decode(b: &[u8]) -> Result<Bitmap> {
    ensure!(b.len() >= 10, "CPS header truncated");
    let n = u32::from_le_bytes(b[4..8].try_into()?) as usize;
    let ps = word(b, 8)? as usize;
    ensure!(
        n < 16 * 1024 * 1024 && 10 + ps <= b.len(),
        "invalid CPS header"
    );
    let src = &b[10 + ps..];
    let data = match word(b, 2)? {
        0 => src
            .get(..n)
            .ok_or_else(|| anyhow::anyhow!("truncated raw CPS"))?
            .to_vec(),
        3 => rle3(src, n)?,
        4 => lcw(src, n)?,
        c => bail!("unsupported CPS compression {c}"),
    };
    Ok(Bitmap {
        data,
        palette: b[10..10 + ps].to_vec(),
    })
}

/// LCW encoding for the original DOS loader. Keep files compressed: the DOS
/// engine's allocation / decoder path cannot safely handle raw type-0 exports.
pub fn encode(data: &[u8], palette: &[u8]) -> Result<Vec<u8>> {
    use std::collections::HashMap;
    ensure!(data.len() <= 65535, "LCW output exceeds 16-bit addressing");
    let mut packed = Vec::new();
    let mut literals = Vec::new();
    let mut positions: HashMap<u32, Vec<usize>> = HashMap::new();
    let mut p = 0;
    let key = |p: usize| -> Option<u32> {
        if p + 2 < data.len() {
            Some((data[p] as u32) << 16 | (data[p + 1] as u32) << 8 | data[p + 2] as u32)
        } else {
            None
        }
    };
    let flush = |l: &mut Vec<u8>, out: &mut Vec<u8>| {
        for c in l.chunks(63) {
            out.push(0x80 | c.len() as u8);
            out.extend_from_slice(c);
        }
        l.clear();
    };
    while p < data.len() {
        let mut run = 1;
        while p + run < data.len() && data[p + run] == data[p] {
            run += 1;
        }
        let mut best = 0;
        let mut source = 0;
        if run < 16
            && let Some(candidates) = key(p).and_then(|k| positions.get(&k))
        {
            for &old in candidates.iter().rev().take(64) {
                let mut n = 3;
                while p + n < data.len() && data[old + n] == data[p + n] {
                    n += 1;
                }
                if n > best {
                    best = n;
                    source = old;
                }
                if n == data.len() - p {
                    break;
                }
            }
        }
        let consumed;
        if run >= 4 && run >= best {
            flush(&mut literals, &mut packed);
            packed.push(0xfe);
            packed.extend((run as u16).to_le_bytes());
            packed.push(data[p]);
            consumed = run;
        } else if best >= 3 {
            flush(&mut literals, &mut packed);
            let distance = p - source;
            if best <= 10 && distance <= 4095 {
                packed.push((((best - 3) << 4) | (distance >> 8)) as u8);
                packed.push(distance as u8);
            } else if best <= 64 {
                packed.push(0xc0 | ((best - 3) as u8));
                packed.extend((source as u16).to_le_bytes());
            } else {
                packed.push(0xff);
                packed.extend((best as u16).to_le_bytes());
                packed.extend((source as u16).to_le_bytes());
            }
            consumed = best;
        } else {
            literals.push(data[p]);
            consumed = 1;
        }
        for i in p..p + consumed {
            if let Some(k) = key(i) {
                positions.entry(k).or_default().push(i);
            }
        }
        p += consumed;
    }
    flush(&mut literals, &mut packed);
    packed.push(0x80);
    ensure!(
        packed.len() + palette.len() + 8 <= u16::MAX as usize,
        "CPS too large"
    );
    let mut out = Vec::new();
    out.extend_from_slice(&((packed.len() + palette.len() + 8) as u16).to_le_bytes());
    out.extend_from_slice(&4u16.to_le_bytes());
    out.extend_from_slice(&(data.len() as u32).to_le_bytes());
    out.extend_from_slice(&(palette.len() as u16).to_le_bytes());
    out.extend_from_slice(palette);
    out.extend_from_slice(&packed);
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn lcw_overlap_and_modes() {
        // literals ABC; relative copy ABCABC; fill xx; absolute copy ABC; end
        let s = [
            0x83, b'A', b'B', b'C', 0x30, 3, 0xfe, 2, 0, b'x', 0xc0, 0, 0, 0x80,
        ];
        assert_eq!(lcw(&s, 14).unwrap(), b"ABCABCABCxxABC");
        assert!(lcw(&[0, 1], 3).is_err());
        assert!(lcw(&[0x83, 1], 3).is_err());
    }
    #[test]
    fn cps_roundtrip() {
        let pixels: Vec<u8> = (0..64000).map(|i| (i % 256) as u8).collect();
        let b = encode(&pixels, &[1; 768]).unwrap();
        let d = decode(&b).unwrap();
        assert_eq!(d.data, pixels);
        assert_eq!(d.palette, vec![1; 768]);
    }
}
