//! EOB2 level initialization tables reconstructed from scene_eob.cpp,
//! darkmoon.cpp and sprites_eob.cpp. Bytecode is retained for later VM porting.
use crate::{
    assets::{numbers, u},
    cps::word,
};
use anyhow::{Context, Result, ensure};
use serde_json::{Value, json};
struct Reader<'a> {
    b: &'a [u8],
    p: usize,
    fields: Vec<Value>,
}
impl Reader<'_> {
    fn byte(&mut self) -> Result<u8> {
        let v = *self.b.get(self.p).context("truncated INF")?;
        self.p += 1;
        Ok(v)
    }
    fn skip(&mut self, n: usize) -> Result<()> {
        ensure!(self.p + n <= self.b.len(), "truncated INF table");
        self.p += n;
        Ok(())
    }
    fn field(&mut self, name: &str, kind: &str) -> Result<()> {
        let p = self.p;
        let value = match kind {
            "u8" => json!(self.byte()?),
            "i8" => json!(self.byte()? as i8),
            "u16" => {
                let n = word(self.b, self.p)?;
                self.p += 2;
                json!(n)
            }
            "string13" => {
                let s = self.b.get(p..p + 13).context("INF filename truncated")?;
                self.p += 13;
                json!(String::from_utf8_lossy(
                    &s[..s.iter().position(|c| *c == 0).unwrap_or(13)]
                ))
            }
            _ => unreachable!(),
        };
        self.fields
            .push(json!({"name":name,"offset":p,"encoding":kind,"value":value}));
        Ok(())
    }
    fn fields(&mut self, prefix: &str, kind: &str, names: &[&str]) -> Result<()> {
        for name in names {
            self.field(&format!("{prefix}.{name}"), kind)?;
        }
        Ok(())
    }
    fn section(&mut self, index: usize, base: usize) -> Result<()> {
        let prefix = format!("sublevel[{index}]");
        self.p = base + 2;
        if self.byte()? == 0xec {
            self.field(&format!("{prefix}.maze"), "string13")?;
            self.field(&format!("{prefix}.graphics"), "string13")?;
            if self.byte()? != 0xff {
                self.field(&format!("{prefix}.palette_override"), "string13")?;
            }
        }
        self.field(&format!("{prefix}.sound_bank"), "string13")?;
        for i in 0..2 {
            let marker = self.byte()?;
            if marker == 0xec || marker == 0xea {
                let pr = format!("{prefix}.door[{i}]");
                self.field(&format!("{pr}.sheet"), "string13")?;
                self.fields(&pr, "u8", &["index", "type", "no_switch"])?;
                self.skip(48)?;
            }
        }
        self.field(&format!("{prefix}.steps_until_script"), "u16")?;
        for i in 0..2 {
            if self.byte()? == 0xec {
                let pr = format!("{prefix}.monster_shapes[{i}]");
                self.fields(&pr, "u8", &["layout_group", "slot"])?;
                self.field(&format!("{pr}.sheet"), "string13")?;
                self.field(&format!("{pr}.decorations"), "u8")?;
            }
        }
        loop {
            let id = self.byte()?;
            if id == 0xff {
                break;
            }
            ensure!(id < 10, "invalid monster property id {id}");
            let pr = format!("{prefix}.monster_type[{id}]");
            self.fields(&pr, "i8", &["armor_class", "hit_chance", "level"])?;
            self.fields(
                &pr,
                "u8",
                &["hp_dice", "hp_sides", "hp_bonus", "attacks_per_round"],
            )?;
            for i in 0..3 {
                self.fields(&format!("{pr}.damage[{i}]"), "u8", &["dice", "sides"])?;
                self.field(&format!("{pr}.damage[{i}].bonus"), "i8")?;
            }
            self.fields(
                &pr,
                "u16",
                &[
                    "immunity_flags",
                    "capability_flags",
                    "type_flags",
                    "experience",
                ],
            )?;
            self.field(&format!("{pr}.unknown_30"), "u8")?;
            self.fields(&pr, "i8", &["sound_1", "sound_2"])?;
            self.field(&format!("{pr}.remote_attacks"), "u8")?;
            if self.byte()? != 0xff {
                self.field(&format!("{pr}.remote_weapon_change_mode"), "u8")?;
                let count = self.byte()? as usize;
                for i in 0..count {
                    self.field(&format!("{pr}.remote_weapon[{i}]"), "u16")?;
                }
            }
            self.field(&format!("{pr}.turn_undead_resistance"), "i8")?;
            self.field(&format!("{pr}.damage_evade_modifier"), "u8")?;
            for i in 0..3 {
                self.field(&format!("{pr}.decoration[{i}]"), "u8")?;
            }
        }
        if self.byte()? == 0xec {
            let n = word(self.b, self.p)? as usize;
            self.p += 2;
            for i in 0..n {
                let pr = format!("{prefix}.wall[{i}]");
                if self.byte()? == 0xec {
                    self.field(&format!("{pr}.sheet"), "string13")?;
                    self.field(&format!("{pr}.definitions"), "string13")?;
                } else {
                    self.fields(&pr, "u8", &["wall_id", "vmp_index"])?;
                    self.field(&format!("{pr}.decoration_index"), "i8")?;
                    self.fields(&pr, "u8", &["special_type", "flags"])?;
                }
            }
        }
        let mut i = 0;
        while word(self.b, self.p)? != 0xffff {
            self.fields(
                &format!("{prefix}.timer[{i}]"),
                "u16",
                &["function", "interval"],
            )?;
            i += 1;
            ensure!(i < 100, "too many level timers");
        }
        Ok(())
    }
}
pub fn decode(b: &[u8]) -> Value {
    let mut r = Reader {
        b,
        p: 0,
        fields: Vec::new(),
    };
    let mut errors = Vec::new();
    let mut bytecode_start = 0;
    let mut bindings = Vec::new();
    let result = (|| -> Result<()> {
        let active = word(b, 0)? as usize;
        let mut base = 2;
        let mut seen = std::collections::BTreeSet::new();
        let mut i = 0;
        while base < active && seen.insert(base) {
            r.section(i, base)?;
            let next = 2 + word(b, base)? as usize;
            if next <= base || next >= active {
                break;
            }
            base = next;
            i += 1;
        }
        r.p = active;
        let binding_offset = word(b, r.p)? as usize;
        r.p += 2;
        if r.byte()? == 0xec {
            while r.byte()? != 0xff {
                r.skip(1)?;
            }
            for i in 0..30 {
                if *b.get(r.p).context("spawn table truncated")? == 0xff {
                    r.skip(14)?;
                    continue;
                }
                let pr = format!("spawn[{i}]");
                r.fields(&pr, "u8", &["index", "unit"])?;
                r.field(&format!("{pr}.block"), "u16")?;
                r.fields(
                    &pr,
                    "u8",
                    &[
                        "position",
                        "direction",
                        "type",
                        "shape_slot",
                        "mode",
                        "spell_status",
                    ],
                )?;
                r.fields(&pr, "u16", &["random_item", "fixed_item"])?;
            }
        }
        bytecode_start = r.p;
        ensure!(
            binding_offset + 2 <= b.len(),
            "binding directory offset invalid"
        );
        let count = word(b, binding_offset)? as usize;
        ensure!(
            binding_offset + 2 + count * 6 <= b.len(),
            "bindings truncated"
        );
        for i in 0..count {
            let p = binding_offset + 2 + i * 6;
            bindings.push(
                json!({"block":word(b,p)?,"flags":word(b,p+2)?,"bytecode_offset":word(b,p+4)?}),
            );
        }
        Ok(())
    })();
    if let Err(e) = result {
        errors.push(e.to_string());
    }
    json!({"format":"EOB2 INF (lossless decompressed bytes and fixed-offset named field overrides)","notes":"Edit fields[].value for named level data. Only values differing from the original are overlaid onto bytes. Keep offsets, encodings, record counts and instruction sizes unchanged. Bytecode is not yet decompiled into an editable AST.","fields":r.fields,"bytecode_start":bytecode_start,"bindings":bindings,"parser_warnings":errors,"bytes":b.chunks(16).collect::<Vec<_>>()})
}
pub fn encode(v: &Value, original: &[u8]) -> Result<Vec<u8>> {
    let mut out = Vec::new();
    for row in v["bytes"].as_array().context("INF bytes")? {
        out.extend(numbers(row)?);
    }
    ensure!(
        out.len() == original.len(),
        "INF byte count changed; embedded pointers would move"
    );
    for f in v["fields"].as_array().context("INF fields")? {
        let p = u(f, "offset")?;
        let value = &f["value"];
        match f["encoding"].as_str().context("INF encoding")? {
            "u8" | "i8" => {
                let n = value.as_i64().context("INF byte value")?;
                ensure!((-128..=255).contains(&n) && p < out.len(), "INF byte range");
                if n as u8 != original[p] {
                    out[p] = n as u8;
                }
            }
            "u16" => {
                let n = value.as_u64().context("INF word")?;
                ensure!(n <= 65535 && p + 2 <= out.len(), "INF word range");
                if n as u16 != word(original, p)? {
                    out[p..p + 2].copy_from_slice(&(n as u16).to_le_bytes());
                }
            }
            "string13" => {
                let s = value.as_str().context("INF filename")?.as_bytes();
                ensure!(
                    s.len() <= 12 && s.is_ascii() && p + 13 <= out.len(),
                    "INF filename must fit 12 ASCII characters"
                );
                let before = &original[p..p + 13];
                let end = before.iter().position(|c| *c == 0).unwrap_or(13);
                if s != &before[..end] {
                    out[p..p + 13].fill(0);
                    out[p..p + s.len()].copy_from_slice(s);
                }
            }
            _ => anyhow::bail!("unknown INF field encoding"),
        }
    }
    if let Some(bindings) = v.get("bindings").and_then(Value::as_array) {
        let (directory, count) = binding_directory(original)?;
        ensure!(
            bindings.len() == count,
            "INF binding count changed; keep existing records"
        );
        ensure!(
            binding_directory(&out)? == (directory, count),
            "INF binding directory moved"
        );
        for (index, binding) in bindings.iter().enumerate() {
            for (field, name) in ["block", "flags", "bytecode_offset"]
                .into_iter()
                .enumerate()
            {
                let value = u(binding, name)?;
                ensure!(
                    value <= if field == 0 { 1023 } else { 65535 },
                    "INF binding {name} out of range"
                );
                let offset = directory + 2 + index * 6 + field * 2;
                if value as u16 != word(original, offset)? {
                    out[offset..offset + 2].copy_from_slice(&(value as u16).to_le_bytes());
                }
            }
        }
    }
    Ok(out)
}

fn binding_directory(bytes: &[u8]) -> Result<(usize, usize)> {
    let active = word(bytes, 0)? as usize;
    let directory = word(bytes, active)? as usize;
    let count = word(bytes, directory)? as usize;
    ensure!(
        directory + 2 + count * 6 <= bytes.len(),
        "INF binding directory truncated"
    );
    Ok((directory, count))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn binding_relocation_preserves_code_and_rejects_invalid_tables() {
        let mut raw = vec![0; 32];
        for (offset, value) in [
            (0, 4u16),
            (4, 8),
            (8, 2),
            (10, 33),
            (12, 8),
            (14, 100),
            (16, 34),
            (18, 168),
            (20, 200),
        ] {
            raw[offset..offset + 2].copy_from_slice(&value.to_le_bytes());
        }
        let mut value = json!({"fields":[],"bytes":[raw],"bindings":[{"block":33,"flags":8,"bytecode_offset":100},{"block":34,"flags":168,"bytecode_offset":200}]});
        assert_eq!(encode(&value, &raw).unwrap(), raw);
        value["bindings"][0]["block"] = json!(65);
        let moved = encode(&value, &raw).unwrap();
        assert_eq!(word(&moved, 10).unwrap(), 65);
        assert_eq!(&moved[12..], &raw[12..]);
        assert_eq!(&moved[..10], &raw[..10]);
        value["bindings"][0]["block"] = json!(1024);
        assert!(encode(&value, &raw).is_err());
        value["bindings"].as_array_mut().unwrap().pop();
        assert!(encode(&value, &raw).is_err());
    }

    #[test]
    #[ignore = "requires the owner's original EOB2 data in assets/"]
    fn supplied_binding_moves_preserve_all_other_inf_bytes() -> Result<()> {
        let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("assets/raw");
        for level in 1..=16 {
            let original =
                crate::cps::decode(&std::fs::read(root.join(format!("level{level}.inf")))?)?.data;
            let mut value = decode(&original);
            assert_eq!(
                encode(&value, &original)?,
                original,
                "area {level} roundtrip"
            );
            let old = value["bindings"][0]["block"].as_u64().unwrap();
            value["bindings"][0]["block"] = json!((old + 1) % 1024);
            let moved = encode(&value, &original)?;
            let (directory, _) = binding_directory(&original)?;
            let offset = directory + 2;
            assert_eq!(&moved[..offset], &original[..offset]);
            assert_eq!(&moved[offset + 2..], &original[offset + 2..]);
            assert_eq!(
                decode(&moved)["bindings"][0]["block"],
                json!((old + 1) % 1024)
            );
        }
        Ok(())
    }
}
