//! Rust interpretation of Westwood PC speaker sequences. Sequence semantics
//! follow ScummVM pcspeaker_v1.cpp; the WAV uses a simple square-wave oscillator.
use crate::{assets, cps::word, soundbank};
use anyhow::{Context, Result, ensure};
use std::{fs, io::Write, path::Path};

struct Player<'a> {
    data: &'a [u8],
    pos: Option<usize>,
    timer: i32,
    scale: u8,
    repeat: [u8; 2],
    frequency: f64,
    periods: Vec<u16>,
}
impl<'a> Player<'a> {
    fn new(data: &'a [u8], track: usize) -> Result<Self> {
        ensure!(
            track < 120 && data.len() >= 1120,
            "invalid speaker track or bank"
        );
        let program = data[track] & 127;
        let pos = word(&data[120..], program as usize * 2)? as usize;
        ensure!(
            pos >= 1000 && pos < data.len() - 120,
            "track {track} has no program"
        );
        Ok(Self {
            data: &data[120..],
            pos: Some(pos),
            timer: 0,
            scale: 1,
            repeat: [0; 2],
            frequency: 0.0,
            periods: serde_json::from_str(include_str!("../data/speaker-periods.json"))?,
        })
    }
    fn tick(&mut self) -> Result<bool> {
        let Some(mut p) = self.pos else {
            return Ok(false);
        };
        for _ in 0..4096 {
            self.timer -= 1;
            if self.timer >= 0 {
                self.pos = Some(p);
                return Ok(true);
            }
            self.timer = 0;
            let op = *self.data.get(p).context("truncated speaker opcode")?;
            p += 1;
            let next = |p: usize| {
                self.data
                    .get(p)
                    .copied()
                    .context("truncated speaker operand")
            };
            match op {
                0..=127 => {
                    let period = self.periods[if op <= 95 { op as usize } else { 0 }];
                    self.frequency = if period == 0 {
                        0.0
                    } else {
                        1193180.0 / period as f64
                    };
                    self.timer = self.scale as i32 * next(p)?.wrapping_add(1) as i32;
                    p += 1;
                }
                0xe9 => {
                    self.scale = self.scale.saturating_add(next(p)?);
                    p += 1;
                }
                0xe8 => {
                    self.scale = self.scale.saturating_sub(next(p)?).max(1);
                    p += 1;
                }
                0xe2 => {
                    self.scale = next(p)?.max(1);
                    p += 1;
                }
                0xe6 => {
                    let hz = word(self.data, p)?;
                    ensure!(hz > 0, "zero explicit speaker frequency");
                    self.frequency = hz as f64;
                    p += 2;
                    self.timer = self.scale as i32 * next(p)?.wrapping_add(1) as i32;
                    p += 1;
                }
                0xcd | 0xd1 => {
                    self.repeat[usize::from(op == 0xd1)] = next(p)?.max(1);
                    p += 1;
                }
                0xce | 0xd2 => {
                    let i = usize::from(op == 0xd2);
                    self.repeat[i] = self.repeat[i].wrapping_sub(1);
                    if self.repeat[i] != 0 {
                        let distance = next(p)? as usize;
                        ensure!(
                            distance > 0 && distance <= p,
                            "invalid speaker repeat branch"
                        );
                        p -= distance;
                    } else {
                        p += 2;
                    }
                }
                _ => {
                    self.frequency = 0.0;
                    self.pos = None;
                    return Ok(false);
                }
            }
        }
        anyhow::bail!("speaker program has a non-yielding instruction loop")
    }
}
fn samples(data: &[u8], track: usize, seconds: u32) -> Result<Vec<i16>> {
    let mut player = Player::new(data, track)?;
    let mut phase = 0.0f64;
    let mut tick = usize::MAX;
    let mut out = Vec::new();
    for frame in 0..seconds as usize * 44100 {
        let current = frame * 292 / 44100;
        if current != tick {
            tick = current;
            if !player.tick()? {
                break;
            }
        }
        let sample = if player.frequency == 0.0 {
            0
        } else {
            phase = (phase + player.frequency / 44100.0).fract();
            if phase < 0.5 { 8063 } else { -8064 }
        };
        out.push(sample);
    }
    Ok(out)
}
pub fn render(root: &Path, bank: &str, track: usize, seconds: u32, path: &Path) -> Result<()> {
    ensure!(
        (1..=600).contains(&seconds),
        "duration must be 1..600 seconds"
    );
    ensure!(
        bank.bytes().all(|c| c.is_ascii_alphanumeric() || c == b'_'),
        "bank name must not contain a path"
    );
    let v = assets::read_json(&root.join(format!("audio/{bank}.snd.json")))?;
    let data = soundbank::encode_speaker(&v)?;
    let pcm = samples(&data, track, seconds)?;
    write_wave(path, &pcm)?;
    println!(
        "Rendered {bank} PC speaker track {track}: {:.3}s to {}",
        pcm.len() as f64 / 44100.0,
        path.display()
    );
    Ok(())
}
fn write_wave(path: &Path, pcm: &[i16]) -> Result<()> {
    if let Some(parent) = path.parent() {
        fs::create_dir_all(parent)?;
    }
    let mut file = fs::File::create(path)?;
    let size = pcm.len() as u32 * 2;
    file.write_all(b"RIFF")?;
    file.write_all(&(36 + size).to_le_bytes())?;
    file.write_all(b"WAVEfmt ")?;
    file.write_all(&16u32.to_le_bytes())?;
    for n in [1u16, 1u16] {
        file.write_all(&n.to_le_bytes())?;
    }
    file.write_all(&44100u32.to_le_bytes())?;
    file.write_all(&88200u32.to_le_bytes())?;
    for n in [2u16, 16u16] {
        file.write_all(&n.to_le_bytes())?;
    }
    file.write_all(b"data")?;
    file.write_all(&size.to_le_bytes())?;
    for s in pcm {
        file.write_all(&s.to_le_bytes())?;
    }
    Ok(())
}

pub fn render_all(root: &Path, output: &Path, seconds: u32) -> Result<()> {
    ensure!(
        (1..=600).contains(&seconds),
        "duration must be 1..600 seconds"
    );
    let manifest = assets::manifest(root)?;
    let mut index = Vec::new();
    for e in manifest.files.iter().filter(|e| e.kind == "snd") {
        let bank = Path::new(&e.name)
            .file_stem()
            .context("sound bank stem")?
            .to_string_lossy();
        let v = assets::read_json(&root.join(format!("audio/{bank}.snd.json")))?;
        let data = soundbank::encode_speaker(&v)?;
        let mut aliases = std::collections::BTreeMap::<usize, Vec<usize>>::new();
        for (track, &program) in data[..120].iter().enumerate() {
            if program == 255 {
                continue;
            }
            let offset = word(&data[120..], (program as usize & 127) * 2)? as usize;
            if offset >= 1000 && offset < data.len() - 120 {
                aliases.entry(offset).or_default().push(track);
            }
        }
        for (offset, tracks) in aliases {
            let track = tracks[0];
            let pcm =
                samples(&data, track, seconds).with_context(|| format!("{bank} track {track}"))?;
            let name = format!("{bank}/track-{track:03}.wav");
            write_wave(&output.join(&name), &pcm)?;
            index.push(serde_json::json!({"file":name,"bank":bank,"track_aliases":tracks,"program_offset":offset,"seconds":pcm.len() as f64/44100.0,"duration_capped":pcm.len()==seconds as usize*44100}));
        }
    }
    assets::save_json(&output.join("index.json"), &index)?;
    println!(
        "Rendered {} distinct PC speaker programs into {}",
        index.len(),
        output.display()
    );
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn notes_and_stop_render() {
        let mut bank = vec![0u8; 1120];
        bank[0] = 0;
        bank[120..122].copy_from_slice(&1000u16.to_le_bytes());
        bank.extend([0xe2, 2, 48, 3, 0, 1, 0xff]);
        let v = soundbank::decode_speaker(&bank).unwrap();
        assert_eq!(soundbank::encode_speaker(&v).unwrap(), bank);
        let samples = samples(&bank, 0, 1).unwrap();
        assert!(!samples.is_empty());
        assert!(samples.len() < 44100);
        assert!(samples.iter().any(|s| *s > 0) && samples.iter().any(|s| *s < 0));
        assert!(samples.ends_with(&[0, 0]));
    }
}
