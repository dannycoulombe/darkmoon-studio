//! Static analysis is deliberately labelled as assembly, not recovered original source.
use crate::{
    assets::{hash, save_json},
    cps::word,
};
use anyhow::{Context, Result, ensure};
use iced_x86::{Decoder, DecoderOptions, FlowControl, Formatter, IntelFormatter};
use serde_json::json;
use std::{
    collections::BTreeSet,
    fs,
    io::{BufWriter, Write},
    path::Path,
};

pub fn analyze(path: &Path, out: &Path) -> Result<()> {
    let b = fs::read(path)?;
    ensure!(b.starts_with(b"MZ"), "not an MZ executable");
    fs::create_dir_all(out)?;
    let header = word(&b, 8)? as usize * 16;
    let ip = word(&b, 20)? as usize;
    let cs = word(&b, 22)? as usize;
    let entry = cs * 16 + ip;
    let relocs = word(&b, 6)? as usize;
    let rtab = word(&b, 24)? as usize;
    let mut relocations = Vec::new();
    let mut segments = BTreeSet::from([cs]);
    for i in 0..relocs {
        let o = word(&b, rtab + i * 4)? as usize;
        let s = word(&b, rtab + i * 4 + 2)? as usize;
        let file = header + s * 16 + o;
        if file + 2 <= b.len() {
            let target = word(&b, file)? as usize;
            segments.insert(target);
            relocations.push(
                json!({"segment":s,"offset":o,"file_offset":file,"load_relative_segment":target}),
            );
        }
    }
    let image = b.get(header..).context("invalid MZ header size")?;
    let mut asm = BufWriter::new(fs::File::create(out.join("start.linear.asm"))?);
    writeln!(
        asm,
        "; EOB2 16-bit MZ linear sweep. Includes data decoded as instructions.\n; File SHA256 {}\n; Image file offset {header:#x}; entry {cs:04x}:{ip:04x} (image {entry:#x})",
        hash(&b)
    )?;
    let mut decoder = Decoder::with_ip(16, image, 0, DecoderOptions::NONE);
    let mut fmt = IntelFormatter::new();
    let mut text = String::new();
    let mut count = 0;
    while decoder.can_decode() {
        let ins = decoder.decode();
        text.clear();
        fmt.format(&ins, &mut text);
        writeln!(asm, "{:06x}  {}", ins.ip(), text)?;
        count += 1;
    }
    // DOS compilers commonly emit far calls across code segments. Each target is
    // a candidate; a relocation value alone is NOT proof of executable code.
    let mut candidates = BTreeSet::from([(cs, ip)]);
    for p in 0..image.len().saturating_sub(5) {
        if image[p] == 0x9a {
            let off = word(image, p + 1)? as usize;
            let seg = word(image, p + 3)? as usize;
            if seg * 16 + off < image.len() && segments.contains(&seg) {
                candidates.insert((seg, off));
            }
        }
    }
    let mut functions = BufWriter::new(fs::File::create(out.join("functions.asm"))?);
    let mut records = Vec::new();
    for (seg, off) in candidates {
        let start = seg * 16 + off;
        if start >= image.len() {
            continue;
        }
        let end = (start + 8192).min(image.len());
        let mut dec = Decoder::with_ip(16, &image[start..end], off as u64, DecoderOptions::NONE);
        writeln!(
            functions,
            "\n; Candidate {seg:04x}:{off:04x}, file offset {:#x}",
            header + start
        )?;
        let mut lines = 0;
        while dec.can_decode() && lines < 1024 {
            let ins = dec.decode();
            text.clear();
            fmt.format(&ins, &mut text);
            writeln!(functions, "{seg:04x}:{:04x}  {text}", ins.ip())?;
            lines += 1;
            if ins.flow_control() == FlowControl::Return {
                break;
            }
        }
        records.push(json!({"segment":seg,"offset":off,"file_offset":header+start,"linear_instructions_until_return":lines}));
    }
    // Preserve string offsets for cross-reference and future EXE text patching.
    let mut strings = Vec::new();
    let mut p = 0;
    while p < b.len() {
        if b[p].is_ascii_graphic() || b[p] == b' ' {
            let s = p;
            while p < b.len() && (b[p].is_ascii_graphic() || b[p] == b' ') {
                p += 1;
            }
            if p - s >= 5 {
                strings.push(json!({"file_offset":s,"text":String::from_utf8_lossy(&b[s..p])}));
            }
        } else {
            p += 1;
        }
    }
    save_json(
        &out.join("mz.json"),
        &json!({"sha256":hash(&b),"file_size":b.len(),"header_size":header,"entry":{"cs":cs,"ip":ip,"image_offset":entry},"relocations":relocations,"function_candidates":records,"limitations":"Static linear disassembly and function candidates, not high-level decompilation. Segmented code/data overlap and indirect calls need manual analysis."}),
    )?;
    save_json(&out.join("executable-strings.json"), &strings)?;
    println!(
        "Analyzed {} linear instructions, {} candidate functions, {} strings",
        count,
        records.len(),
        strings.len()
    );
    Ok(())
}
