//! Lossless, fixed-offset decompilation of Westwood v2 AdLib sound programs.
//! Opcode definitions and instrument layout: ScummVM kyra/sound/drivers/adlib.cpp.
use crate::{
    assets::{numbers, u},
    cps::word,
};
use anyhow::{Context, Result, ensure};
use serde_json::{Value, json};
use std::collections::{BTreeMap, BTreeSet};

pub fn decode_speaker(b: &[u8]) -> Result<Value> {
    ensure!(b.len() >= 1120, "speaker bank truncated");
    let body = &b[120..];
    let offsets: Vec<usize> = (0..500)
        .map(|i| word(body, i * 2).map(|n| n as usize))
        .collect::<Result<_>>()?;
    let starts: Vec<usize> = offsets
        .iter()
        .copied()
        .filter(|n| *n >= 1000 && *n < body.len())
        .chain(std::iter::once(body.len()))
        .collect::<BTreeSet<_>>()
        .into_iter()
        .collect();
    let mut regions = Vec::new();
    for pair in starts.windows(2) {
        let (start, end) = (pair[0], pair[1]);
        let mut p = start;
        let mut instructions = Vec::new();
        while p < end {
            let offset = p;
            let op = body[p];
            p += 1;
            let (name, n) = match op {
                0..=127 => ("note", 1),
                0xe9 => ("increase_timer_scale", 1),
                0xe8 => ("decrease_timer_scale", 1),
                0xe6 => ("frequency_hz", 3),
                0xe2 => ("set_timer_scale", 1),
                0xd2 => ("repeat_2", 2),
                0xd1 => ("set_repeat_2", 1),
                0xce => ("repeat_1", 2),
                0xcd => ("set_repeat_1", 1),
                _ => ("stop", 0),
            };
            let n = n.min(end - p);
            instructions.push(
                json!({"offset":offset,"operation":name,"opcode":op,"arguments":&body[p..p+n]}),
            );
            p += n;
        }
        regions.push(json!({"offset":start,"length":end-start,"program_ids":(0..500).filter(|i|offsets[*i]==start).collect::<Vec<_>>(),"instructions":instructions}));
    }
    let first = starts.first().copied().unwrap_or(body.len());
    Ok(
        json!({"format":"Westwood PC speaker sequence bank","notes":"Fixed offsets and instruction lengths. Notes 1..95 index the hardware period table; note 0 is silence. Note arguments[0] encodes duration minus one, scaled by timer_scale at 292 ticks/second.","track_programs":&b[..120],"offset_table":offsets,"leading_padding":&body[1000..first],"regions":regions}),
    )
}
pub fn encode_speaker(v: &Value) -> Result<Vec<u8>> {
    let mut out = numbers(&v["track_programs"])?;
    ensure!(out.len() == 120, "speaker track table size");
    let offsets = v["offset_table"].as_array().context("speaker offsets")?;
    ensure!(offsets.len() == 500, "speaker offset table size");
    for n in offsets {
        let n = n.as_u64().context("speaker offset")?;
        ensure!(n <= 65535, "speaker offset range");
        out.extend((n as u16).to_le_bytes());
    }
    out.extend(numbers(&v["leading_padding"])?);
    for r in v["regions"].as_array().context("speaker regions")? {
        ensure!(
            out.len() - 120 == u(r, "offset")?,
            "speaker region offsets cannot move"
        );
        let start = out.len();
        for ins in r["instructions"]
            .as_array()
            .context("speaker instructions")?
        {
            let n = u(ins, "opcode")?;
            ensure!(n <= 255, "speaker opcode range");
            out.push(n as u8);
            out.extend(numbers(&ins["arguments"])?);
        }
        ensure!(
            out.len() - start == u(r, "length")?,
            "speaker instruction sizes cannot change"
        );
    }
    Ok(out)
}
const FIELDS: [&str; 11] = [
    "modulator_characteristics",
    "carrier_characteristics",
    "feedback_connection",
    "modulator_waveform",
    "carrier_waveform",
    "modulator_level",
    "carrier_level",
    "modulator_attack_decay",
    "carrier_attack_decay",
    "modulator_sustain_release",
    "carrier_sustain_release",
];

pub fn decode(b: &[u8]) -> Result<Value> {
    ensure!(b.len() >= 1120, "AdLib bank truncated");
    let body = &b[120..];
    let ops: Value = serde_json::from_str(include_str!("../data/adlib-opcodes.json"))?;
    let offsets: Vec<usize> = (0..500)
        .map(|i| word(body, i * 2).map(|n| n as usize))
        .collect::<Result<_>>()?;
    let positions: BTreeSet<usize> = offsets
        .iter()
        .copied()
        .filter(|o| *o >= 1000 && *o < body.len())
        .chain(std::iter::once(body.len()))
        .collect();
    let starts: Vec<usize> = positions.into_iter().collect();
    let mut regions = Vec::new();
    for pair in starts.windows(2) {
        let (start, end) = (pair[0], pair[1]);
        let programs: Vec<usize> = (0..250).filter(|i| offsets[*i] == start).collect();
        let instruments: Vec<usize> = (250..500)
            .filter(|i| offsets[*i] == start)
            .map(|i| i - 250)
            .collect();
        let mut region = json!({"offset":start,"length":end-start,"program_ids":programs,"instrument_ids":instruments});
        if !programs.is_empty() && end - start >= 2 {
            region["channel"] = json!(body[start]);
            region["priority"] = json!(body[start + 1]);
            let mut p = start + 2;
            let mut code = Vec::new();
            while p < end {
                let offset = p;
                let op = body[p];
                p += 1;
                let (name, n) = if op < 128 {
                    ("note", 1)
                } else {
                    let spec = &ops[(op as usize & 127).min(74)];
                    (
                        spec["name"].as_str().context("opcode name")?,
                        spec["arguments"].as_u64().context("opcode length")? as usize,
                    )
                };
                let n = n.min(end - p);
                code.push(
                    json!({"offset":offset,"operation":name,"opcode":op,"arguments":&body[p..p+n]}),
                );
                p += n;
            }
            region["instructions"] = json!(code);
        } else if !instruments.is_empty() && end - start >= 11 {
            let mut fields = BTreeMap::new();
            for (i, f) in FIELDS.iter().enumerate() {
                fields.insert(*f, body[start + i]);
            }
            region["instrument"] = json!(fields);
            region["tail"] = json!(&body[start + 11..end]);
        } else {
            region["data"] = json!(&body[start..end]);
        }
        regions.push(region);
    }
    let first = starts.first().copied().unwrap_or(body.len());
    Ok(
        json!({"format":"Westwood AdLib v2","notes":"Fixed offsets: edit opcodes, arguments, channels, priorities, instrument values. Preserve instruction and region byte lengths. operation/offset fields are annotations. Note opcode is octave*16 + semitone (C=0); arguments[0] is duration. Track 12 starts the DOS intro.","track_programs":&b[..120],"program_offsets":&offsets[..250],"instrument_offsets":&offsets[250..],"leading_padding":&body[1000..first],"regions":regions}),
    )
}
pub fn encode(v: &Value) -> Result<Vec<u8>> {
    let tracks = numbers(&v["track_programs"])?;
    ensure!(tracks.len() == 120, "AdLib needs 120 track entries");
    let mut out = tracks;
    for field in ["program_offsets", "instrument_offsets"] {
        let list = v[field].as_array().context("sound offset table")?;
        ensure!(list.len() == 250, "AdLib offset table needs 250 entries");
        for o in list {
            let n = o.as_u64().context("sound offset")?;
            ensure!(n <= 65535, "sound offset overflow");
            out.extend((n as u16).to_le_bytes());
        }
    }
    out.extend(numbers(&v["leading_padding"])?);
    for r in v["regions"].as_array().context("sound regions")? {
        ensure!(
            out.len() - 120 == u(r, "offset")?,
            "sound region offsets cannot move"
        );
        let start = out.len();
        if let Some(code) = r["instructions"].as_array() {
            for field in ["channel", "priority"] {
                let n = u(r, field)?;
                ensure!(n <= 255, "sound field overflow");
                out.push(n as u8);
            }
            for ins in code {
                let n = u(ins, "opcode")?;
                ensure!(n <= 255, "sound opcode overflow");
                out.push(n as u8);
                out.extend(numbers(&ins["arguments"])?);
            }
        } else if r["instrument"].is_object() {
            for f in FIELDS {
                let n = u(&r["instrument"], f)?;
                ensure!(n <= 255, "instrument field overflow");
                out.push(n as u8);
            }
            out.extend(numbers(&r["tail"])?);
        } else {
            out.extend(numbers(&r["data"])?);
        }
        ensure!(
            out.len() - start == u(r, "length")?,
            "sound region size changed; relative branches would break"
        );
    }
    Ok(out)
}
