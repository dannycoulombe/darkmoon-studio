//! EOB2 event bytecode, following reference/script_eob.cpp and scene_eob.cpp.
//! Original instructions stay at their original addresses. Edited events are
//! compiled into an extension, followed by an updated copy of the string table
//! and binding directory. Local branches are relocated together.
use anyhow::{Context, Result, bail, ensure};
use serde::{Deserialize, Serialize};
use serde_json::Value;
use std::collections::{BTreeMap, BTreeSet};

use crate::cps::word;

#[derive(Clone, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub struct Step {
    pub id: u16,
    pub bytes: Vec<u8>,
    #[serde(default, skip_serializing_if = "BTreeMap::is_empty")]
    pub texts: BTreeMap<usize, String>,
}

#[derive(Clone, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub struct Event {
    pub entry: u16,
    pub steps: Vec<Step>,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub activation: Option<u16>,
}

#[derive(Clone, Copy, PartialEq, Eq)]
pub enum Kind {
    Number,
    Cell,
    Direction,
    Character,
    Flag,
    Target,
    Text,
    Filename,
    Operator,
    Dialogue,
}

#[derive(Clone)]
pub struct Field {
    pub name: String,
    pub offset: usize,
    pub width: usize,
    pub min: i32,
    pub max: i32,
    pub kind: Kind,
}
impl Field {
    pub fn read(&self, bytes: &[u8]) -> i32 {
        let n = if self.width == 2 {
            u16::from_le_bytes([bytes[self.offset], bytes[self.offset + 1]]) as i32
        } else {
            bytes[self.offset] as i32
        };
        if self.min < 0 {
            if self.width == 2 {
                n as i16 as i32
            } else {
                n as i8 as i32
            }
        } else {
            n
        }
    }
    pub fn write(&self, bytes: &mut [u8], n: i32) {
        if self.width == 2 {
            bytes[self.offset..self.offset + 2].copy_from_slice(&(n as u16).to_le_bytes());
        } else {
            bytes[self.offset] = n as u8;
        }
    }
}

pub struct Command {
    pub title: String,
    pub fields: Vec<Field>,
    pub len: usize,
    pub terminal: bool,
    pub condition: Option<String>,
}

struct Reader<'a> {
    bytes: &'a [u8],
    p: usize,
    fields: Vec<Field>,
}
impl Reader<'_> {
    fn byte(&mut self) -> Result<u8> {
        let v = *self.bytes.get(self.p).context("truncated event command")?;
        self.p += 1;
        Ok(v)
    }
    fn field(&mut self, name: &str, width: usize, min: i32, max: i32, kind: Kind) -> Result<i32> {
        ensure!(self.p + width <= self.bytes.len(), "truncated {name}");
        let f = Field {
            name: name.into(),
            offset: self.p,
            width,
            min,
            max,
            kind,
        };
        let value = f.read(self.bytes);
        self.p += width;
        self.fields.push(f);
        Ok(value)
    }
    fn number(&mut self, name: &str, width: usize) -> Result<i32> {
        self.field(
            name,
            width,
            0,
            if width == 2 { 65535 } else { 255 },
            Kind::Number,
        )
    }
    fn signed(&mut self, name: &str, width: usize) -> Result<i32> {
        self.field(
            name,
            width,
            if width == 2 { -32768 } else { -128 },
            if width == 2 { 32767 } else { 127 },
            Kind::Number,
        )
    }
    fn cell(&mut self, name: &str) -> Result<i32> {
        // 0xFFFE/0xFFFF have command-specific meanings and are retained.
        self.field(name, 2, 0, 65535, Kind::Cell)
    }
    fn direction(&mut self) -> Result<i32> {
        self.field("Facing", 1, 0, 3, Kind::Direction)
    }
    fn text(&mut self, name: &str) -> Result<i32> {
        self.field(name, 2, 0, 65535, Kind::Text)
    }
    fn filename(&mut self) -> Result<()> {
        ensure!(self.p + 13 <= self.bytes.len(), "truncated image filename");
        self.fields.push(Field {
            name: "Image file".into(),
            offset: self.p,
            width: 13,
            min: 0,
            max: 0,
            kind: Kind::Filename,
        });
        self.p += 13;
        Ok(())
    }
    fn target(&mut self, name: &str) -> Result<i32> {
        self.field(name, 2, 0, 65535, Kind::Target)
    }
    fn character(&mut self) -> Result<i32> {
        self.field("Character", 1, -1, 5, Kind::Character)
    }
    fn flag(&mut self, name: &str) -> Result<i32> {
        self.field(name, 1, 0, 31, Kind::Flag)
    }
    fn expression(&mut self) -> Result<String> {
        let mut stack = Vec::<String>::new();
        loop {
            let token = self.byte()? as i8;
            let value = match token {
                -18 => break,
                -50 => format!(
                    "a character has a different portrait than {}",
                    self.number("Portrait", 1)?
                ),
                -46 => self.signed("Compare with", 2)?.to_string(),
                -41 | -25 => {
                    let subject = if token == -41 {
                        "last used item"
                    } else {
                        "held item"
                    };
                    let property = self.byte()? as i8;
                    match property {
                        -49 | -48 if token == -25 => {
                            let n = self.byte()? as usize;
                            ensure!(
                                self.p + n <= self.bytes.len(),
                                "truncated item-name condition"
                            );
                            let text = String::from_utf8_lossy(&self.bytes[self.p..self.p + n]);
                            self.p += n;
                            format!("{subject} name contains {:?}", text.trim_end_matches('\0'))
                        }
                        -36 if token == -41 => format!("{subject} special properties"),
                        -31 => format!("{subject} type"),
                        -11 => format!("{subject} ID"),
                        -10 => format!("{subject} value"),
                        _ => bail!("unsupported item condition {property}"),
                    }
                }
                -38 => "whole party is invisible".into(),
                -37 => format!(
                    "roll {}d{} + {}",
                    self.number("Dice count", 1)?,
                    self.number("Dice sides", 1)?,
                    self.signed("Dice bonus", 1)?
                ),
                -36 => format!("party has class flags {}", self.number("Class flags", 1)?),
                -35 => format!("party has race {}", self.number("Race", 1)?),
                -33 => "active spell".into(),
                -32 => "activation event".into(),
                -28 => "dialogue answer".into(),
                -24 => "number of living characters".into(),
                -23 => {
                    let dir = self.direction()?;
                    format!("wall at {} facing {dir}", self.cell("Wall cell")?)
                }
                -19 => "party facing".into(),
                -17 => format!("level flag {}", self.flag("Level flag")?),
                -16 => format!("global flag {}", self.flag("Global flag")?),
                -15 => {
                    if self.byte()? == 245 {
                        format!(
                            "characters carrying item {} with value {}",
                            self.signed("Item ID", 2)?,
                            self.signed("Item value", 2)?
                        )
                    } else {
                        format!("party is at cell {}", self.cell("Party cell")?)
                    }
                }
                -14 => format!(
                    "count item {} at cell {}",
                    self.signed("Item ID", 2)?,
                    self.cell("Item cell")?
                ),
                -13 => {
                    if self.byte()? == 255 {
                        format!("cell {} state flags", self.cell("Cell")?)
                    } else {
                        let mut types = Vec::new();
                        while self
                            .bytes
                            .get(self.p)
                            .copied()
                            .context("unterminated monster condition")?
                            != 255
                        {
                            ensure!(types.len() < 30, "too many monster types");
                            types.push(self.number("Monster type", 1)?.to_string());
                        }
                        self.byte()?;
                        format!("count monsters of types {}", types.join(", "))
                    }
                }
                -11 => {
                    let flying = self.number("Include flying items", 1)?;
                    let kind = self.signed("Item type", 1)?;
                    format!(
                        "count type {kind} at cell {} (flying: {flying})",
                        self.cell("Item cell")?
                    )
                }
                -9 => format!("north wall at cell {}", self.cell("Wall cell")?),
                -8..=-1 => {
                    let a = stack.pop().context("condition missing left operand")?;
                    let b = stack.pop().context("condition missing right operand")?;
                    let op = ["or", "and", "≤", "<", "≥", ">", "≠", "="][(token + 8) as usize];
                    self.fields.push(Field {
                        name: "Comparison".into(),
                        offset: self.p - 1,
                        width: 1,
                        min: 248,
                        max: 255,
                        kind: Kind::Operator,
                    });
                    format!("({a} {op} {b})")
                }
                _ => bail!("unsupported condition token {token}"),
            };
            stack.push(value);
            ensure!(stack.len() <= 64, "condition stack is too deep");
        }
        ensure!(stack.len() == 1, "condition must produce one result");
        Ok(stack.pop().unwrap())
    }
}

pub fn command(bytes: &[u8]) -> Result<Command> {
    let mut r = Reader {
        bytes,
        p: 0,
        fields: Vec::new(),
    };
    let op = r.byte()? as i8;
    let mut terminal = false;
    let mut condition = None;
    let title: &str = match op {
        -1 | -2 => {
            let mode = r.byte()? as i8;
            match mode {
                -23 => {
                    r.cell("Wall cell")?;
                    r.direction()?;
                    r.number("Wall type", 1)?;
                    if op == -2 {
                        r.number("Alternate wall type", 1)?;
                    }
                    if op == -1 {
                        "Change wall"
                    } else {
                        "Toggle wall"
                    }
                }
                -9 => {
                    r.cell("Cell")?;
                    r.number("Wall type", 1)?;
                    if op == -2 {
                        r.number("Alternate wall type", 1)?;
                    }
                    if op == -1 {
                        "Change all four walls"
                    } else {
                        "Toggle all four walls"
                    }
                }
                -19 if op == -1 => {
                    r.direction()?;
                    "Set party facing"
                }
                -22 if op == -2 => {
                    r.cell("Door cell")?;
                    "Toggle door"
                }
                _ => bail!("unsupported wall command {mode}"),
            }
        }
        -3 | -4 => {
            r.cell("Door cell")?;
            if op == -3 { "Open door" } else { "Close door" }
        }
        -5 => {
            r.byte()?; // Reserved selector, retained unchanged.
            r.number("Monster update group", 1)?;
            r.cell("Destination")?;
            r.number("Position", 1)?;
            r.direction()?;
            r.number("Monster type", 1)?;
            r.number("Shape slot", 1)?;
            r.number("Behavior mode", 1)?;
            r.number("Spell status", 1)?;
            r.number("Random item", 2)?;
            r.number("Fixed item", 2)?;
            "Place monster"
        }
        -6 => {
            let mode = r.byte()? as i8;
            if mode == -31 {
                r.number("Item type", 2)?;
            }
            if mode == -31 || mode == -11 {
                for name in ["Source level", "Destination level"] {
                    if r.byte()? != 235 {
                        r.number(name, 1)?;
                    }
                    r.cell(if name == "Source level" {
                        "Source cell"
                    } else {
                        "Destination"
                    })?;
                }
                "Move items"
            } else {
                ensure!(
                    mode == -13 || mode == -24,
                    "unsupported move command {mode}"
                );
                if mode == -24 {
                    r.byte()?;
                    r.byte()?;
                } else {
                    r.cell("Source cell")?;
                }
                r.cell("Destination")?;
                if mode == -24 {
                    "Teleport party"
                } else {
                    "Move monsters"
                }
            }
        }
        -7 => {
            r.character()?;
            r.cell("Drop cell")?;
            r.number("Position", 1)?;
            "Drop inventory item"
        }
        -8 => {
            r.text("Message")?;
            r.number("Text color", 1)?;
            r.byte()?;
            "Show message"
        }
        -9 | -11 => {
            let mode = r.byte()? as i8;
            match mode {
                -47 => {
                    if op == -9 {
                        "Allow resting"
                    } else {
                        "Prevent resting"
                    }
                }
                -28 => {
                    if op == -9 {
                        "Set dialogue result"
                    } else {
                        "Clear dialogue result"
                    }
                }
                -17 | -16 => {
                    r.flag("Flag")?;
                    match (op, mode) {
                        (-9, -17) => "Turn level flag on",
                        (-9, -16) => "Turn global flag on",
                        (-11, -17) => "Turn level flag off",
                        _ => "Turn global flag off",
                    }
                }
                -13 if op == -9 => {
                    r.number("Monster slot", 1)?;
                    r.flag("Monster flag")?;
                    "Set monster flag"
                }
                _ => bail!("unsupported flag command {mode}"),
            }
        }
        -10 => {
            r.number("Sound", 1)?;
            r.cell("Sound cell (0 = everywhere)")?;
            "Play sound"
        }
        -12 => {
            r.character()?;
            r.signed("Hit point change", 1)?;
            "Change hit points"
        }
        -13 => {
            r.character()?;
            for name in [
                "Dice count",
                "Dice sides / weapon",
                "Bonus / strength modifier",
                "Damage flags",
                "Saving throw type",
                "Saving throw effect",
            ] {
                r.signed(name, 1)?;
            }
            "Damage characters"
        }
        -14 | -17 => {
            r.target("Go to step")?;
            terminal = op == -14;
            if op == -14 {
                "Go to step"
            } else {
                "Call routine"
            }
        }
        -15 => {
            terminal = true;
            "End event"
        }
        -16 => {
            terminal = true;
            "Return from routine"
        }
        -18 => {
            condition = Some(r.expression()?);
            r.target("Otherwise go to")?;
            "If condition"
        }
        -19 => {
            if r.bytes.get(r.p) == Some(&255) {
                r.byte()?;
                "Remove held item"
            } else {
                r.signed("Item type (-2 = all)", 1)?;
                r.cell("Item cell")?;
                "Remove items"
            }
        }
        -20 => {
            let mode = r.byte()? as i8;
            r.number("Level / shape index", 1)?;
            if mode == -27 {
                r.number("Sublevel", 1)?;
                r.cell("Arrival cell")?;
                r.field(
                    "Arrival facing (255 = unchanged)",
                    1,
                    0,
                    255,
                    Kind::Direction,
                )?;
                terminal = true;
                "Change level"
            } else {
                r.number("Shape slot", 1)?;
                r.filename()?;
                "Load monster images"
            }
        }
        -21 => {
            ensure!(r.byte()? == 226, "unsupported experience command");
            r.signed("Experience", 2)?;
            "Award party experience"
        }
        -22 => {
            r.number("Item template", 2)?;
            r.cell("Destination (65535 = hand, 65534 = party)")?;
            r.number("Position", 1)?;
            let flags = r.byte()?;
            for (bit, name) in [(1, "Item value"), (2, "Item flags"), (4, "Item icon")] {
                if flags & bit != 0 {
                    r.number(name, 1)?;
                }
            }
            "Create item"
        }
        -23 => {
            let magic = r.byte()? == 223;
            r.number(if magic { "Spell" } else { "Item template" }, 2)?;
            r.cell("Launch cell")?;
            r.direction()?;
            r.field("Launch side", 1, 0, 1, Kind::Number)?;
            if magic { "Launch spell" } else { "Launch item" }
        }
        -24 => {
            let party = r.byte()? == 241;
            r.signed("Quarter turns", 1)?;
            if party {
                "Turn party"
            } else {
                "Turn flying objects"
            }
        }
        -25 => {
            r.cell("Item cell")?;
            "Identify items"
        }
        -26 => {
            let seq = r.signed("Sequence", 1)?;
            terminal = seq == -3;
            "Play story sequence"
        }
        -27 => {
            r.number("Wait ticks", 2)?;
            "Wait"
        }
        -28 => "Refresh view",
        -29 => match r.byte()? as i8 {
            -45 => {
                r.filename()?;
                r.number("Page", 1)?;
                r.number("X", 2)?;
                r.number("Y", 2)?;
                r.number("Flags", 2)?;
                "Show dialogue image"
            }
            -44 => "Finish dialogue scene",
            -43 => "Start dialogue scene",
            -42 => "Draw dialogue box",
            -40 => {
                r.field("Dialogue passage", 2, 0, 65535, Kind::Dialogue)?;
                r.text("Choice 1")?;
                r.text("Choice 2")?;
                r.text("Choice 3 (optional)")?;
                "Ask a question"
            }
            -8 => {
                r.field("Dialogue passage", 2, 0, 65535, Kind::Dialogue)?;
                r.text("Continue button")?;
                "Show dialogue text"
            }
            mode => bail!("unsupported dialogue command {mode}"),
        },
        -30 => {
            r.number("Special event", 2)?;
            "Run special game event"
        }
        _ => "No action",
    };
    Ok(Command {
        title: title.into(),
        fields: r.fields,
        len: r.p,
        terminal,
        condition,
    })
}

pub fn bytes(document: &Value) -> Result<Vec<u8>> {
    let mut out = Vec::new();
    for row in document["bytes"].as_array().context("missing INF bytes")? {
        out.extend(crate::assets::numbers(row)?);
    }
    Ok(out)
}

fn layout(document: &Value, raw: &[u8]) -> Result<(usize, usize, usize)> {
    let base = document["bytecode_start"]
        .as_u64()
        .context("missing bytecode start")? as usize;
    let active = word(raw, 0)? as usize;
    let directory = word(raw, active)? as usize;
    let strings = base + word(raw, base)? as usize;
    ensure!(
        base + 2 <= strings && strings <= directory && directory <= raw.len(),
        "invalid script layout"
    );
    Ok((base, strings, directory))
}

pub fn read_text(document: &Value, index: u16) -> Result<String> {
    if index == 65535 {
        return Ok(String::new());
    }
    let raw = bytes(document)?;
    let (_, start, end) = layout(document, &raw)?;
    let text = raw[start..end]
        .split(|b| *b == 0)
        .nth(index as usize)
        .context("message index outside string table")?;
    // Keep DOS control bytes visible and editable as \xNN escapes.
    Ok(text
        .iter()
        .map(|b| match *b {
            b'\r' => "\n".into(),
            b'\\' => "\\\\".into(),
            32..=126 => (*b as char).to_string(),
            _ => format!("\\x{b:02X}"),
        })
        .collect())
}

fn encode_text(text: &str) -> Result<Vec<u8>> {
    let mut out = Vec::new();
    let mut chars = text.chars();
    while let Some(c) = chars.next() {
        match c {
            '\n' => out.push(13),
            '\\' => match chars.next() {
                Some('\\') => out.push(b'\\'),
                Some('x') => {
                    let a = chars.next().context("use two hex digits after \\x")?;
                    let b = chars.next().context("use two hex digits after \\x")?;
                    let n = u8::from_str_radix(&format!("{a}{b}"), 16)
                        .context("invalid \\xNN text escape")?;
                    ensure!(n != 0, "messages cannot contain a zero byte");
                    out.push(n);
                }
                _ => bail!("use \\\\ for a literal backslash or \\xNN for a DOS character"),
            },
            ' '..='~' => out.push(c as u8),
            _ => bail!("use ASCII text or \\xNN escapes for DOS characters"),
        }
    }
    Ok(out)
}

pub fn load(document: &Value, binding: usize) -> Result<Event> {
    if let Some(event) = document
        .get("events")
        .and_then(|v| v.get(binding.to_string()))
    {
        return Ok(serde_json::from_value(event.clone()).context("invalid edited event")?);
    }
    let raw = bytes(document)?;
    let (base, strings, _) = layout(document, &raw)?;
    let code = &raw[base..strings];
    let entry = document["bindings"][binding]["bytecode_offset"]
        .as_u64()
        .context("script trigger missing")?;
    ensure!(
        entry > 1 && entry < code.len() as u64,
        "trigger has no executable event"
    );
    let mut queue = vec![entry as usize];
    let mut steps = BTreeMap::new();
    let mut occupied = BTreeSet::new();
    while let Some(mut p) = queue.pop() {
        while !steps.contains_key(&p) {
            ensure!(
                p >= 2 && p < code.len(),
                "event points outside instruction data"
            );
            let cmd =
                command(&code[p..]).with_context(|| format!("cannot read command at {p:#06X}"))?;
            ensure!(p + cmd.len <= code.len(), "command crosses string table");
            for byte in p..p + cmd.len {
                ensure!(occupied.insert(byte), "branch points into another command");
            }
            let step = Step {
                id: p as u16,
                bytes: code[p..p + cmd.len].to_vec(),
                texts: BTreeMap::new(),
            };
            for field in &cmd.fields {
                if field.kind == Kind::Target {
                    queue.push(field.read(&step.bytes) as usize);
                }
            }
            steps.insert(p, step);
            p += cmd.len;
            if cmd.terminal {
                break;
            }
        }
    }
    Ok(Event {
        entry: entry as u16,
        steps: steps.into_values().collect(),
        activation: None,
    })
}

pub fn validate(event: &Event) -> Result<()> {
    ensure!(!event.steps.is_empty(), "an event needs at least one step");
    let ids: BTreeSet<_> = event.steps.iter().map(|s| s.id).collect();
    ensure!(
        ids.len() == event.steps.len() && ids.contains(&event.entry),
        "event start or step labels are invalid"
    );
    for step in &event.steps {
        let cmd = command(&step.bytes)?;
        ensure!(cmd.len == step.bytes.len(), "command size mismatch");
        for field in &cmd.fields {
            if field.kind == Kind::Filename {
                continue;
            }
            let value = field.read(&step.bytes);
            // Existing undocumented operand values are retained by the reader;
            // references, which affect compilation, must always be valid.
            if field.kind == Kind::Target {
                ensure!(
                    ids.contains(&(value as u16)),
                    "a branch refers to a deleted step"
                );
            }
        }
        for (&offset, text) in &step.texts {
            ensure!(
                cmd.fields
                    .iter()
                    .any(|f| f.offset == offset && f.kind == Kind::Text),
                "text override is not a message operand"
            );
            encode_text(text)?;
        }
    }
    Ok(())
}

/// Compile event overrides without moving original instructions or level data.
/// Both string and binding directory pointers are updated for the extension.
pub fn compile(document: &Value, mut raw: Vec<u8>) -> Result<Vec<u8>> {
    let Some(value) = document.get("events") else {
        return Ok(raw);
    };
    let overrides = value
        .as_object()
        .context("event overrides must be an object")?;
    if overrides.is_empty() {
        return Ok(raw);
    }
    let (base, strings, directory) = layout(document, &raw)?;
    ensure!(
        raw[directory - 1] == 0,
        "original string table is not terminated"
    );
    let count = word(&raw, directory)? as usize;
    ensure!(
        directory + 2 + count * 6 <= raw.len(),
        "binding directory truncated"
    );
    let mut events = Vec::new();
    for (key, value) in overrides {
        let binding: usize = key.parse().context("invalid event binding")?;
        ensure!(binding < count, "edited event binding does not exist");
        let event: Event = serde_json::from_value(value.clone())?;
        validate(&event)?;
        events.push((binding, event));
    }
    let suffix = raw.split_off(directory);
    let mut pool = raw[strings..].to_vec();
    let mut string_index = pool.iter().filter(|b| **b == 0).count();
    let mut text_refs = BTreeMap::new();
    for (binding, event) in &events {
        for step in &event.steps {
            for (&offset, text) in &step.texts {
                ensure!(string_index < 65535, "too many event messages");
                text_refs.insert((*binding, step.id, offset), string_index as u16);
                pool.extend(encode_text(text)?);
                pool.push(0);
                string_index += 1;
            }
        }
    }
    let mut entries = BTreeMap::new();
    for (binding, event) in events {
        let mut offsets = BTreeMap::new();
        let mut cursor = raw.len() - base;
        for step in &event.steps {
            ensure!(cursor <= 65535, "event storage is full");
            offsets.insert(step.id, cursor as u16);
            cursor += step.bytes.len();
        }
        entries.insert(binding, (offsets[&event.entry], event.activation));
        for step in &event.steps {
            let mut bytes = step.bytes.clone();
            for field in command(&bytes)?.fields {
                match field.kind {
                    Kind::Target => {
                        let id = field.read(&bytes) as u16;
                        field.write(&mut bytes, offsets[&id] as i32);
                    }
                    Kind::Text => {
                        if let Some(index) = text_refs.get(&(binding, step.id, field.offset)) {
                            field.write(&mut bytes, *index as i32);
                        }
                    }
                    _ => {}
                }
            }
            raw.extend(bytes);
        }
        raw.push(241); // Stop fall-through at the end of the edited event.
    }
    ensure!(
        raw.len() - base <= 65535,
        "event string table is too far from the code"
    );
    let new_strings = (raw.len() - base) as u16;
    raw[base..base + 2].copy_from_slice(&new_strings.to_le_bytes());
    raw.extend(pool);
    let new_directory = raw.len();
    let active = word(&raw, 0)? as usize;
    ensure!(
        new_directory + suffix.len() <= 64000,
        "level script storage is full (64,000 bytes)"
    );
    raw[active..active + 2].copy_from_slice(&(new_directory as u16).to_le_bytes());
    raw.extend(suffix);
    for (binding, (entry, activation)) in entries {
        let offset = new_directory + 2 + binding * 6 + 4;
        raw[offset..offset + 2].copy_from_slice(&entry.to_le_bytes());
        if let Some(flags) = activation {
            raw[offset - 2..offset].copy_from_slice(&flags.to_le_bytes());
        }
    }
    Ok(raw)
}

pub const PRESETS: &[(&str, &[u8])] = &[
    ("Open door", &[253, 0, 0]),
    ("Close door", &[252, 0, 0]),
    ("Toggle door", &[254, 234, 0, 0]),
    ("Change wall", &[255, 233, 0, 0, 0, 0]),
    ("Change all four walls", &[255, 247, 0, 0, 0]),
    ("Teleport party", &[250, 232, 0, 0, 0, 0]),
    ("Move monsters", &[250, 243, 0, 0, 0, 0]),
    (
        "Place monster",
        &[251, 243, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ),
    ("Change level", &[236, 229, 1, 0, 0, 0, 255]),
    ("Set party facing", &[255, 237, 0]),
    ("Turn party", &[232, 241, 1]),
    ("Show message", &[248, 255, 255, 15, 0]),
    ("Play sound", &[246, 0, 0, 0]),
    ("Turn level flag on", &[247, 239, 0]),
    ("Turn level flag off", &[245, 239, 0]),
    ("Turn global flag on", &[247, 240, 0]),
    ("Turn global flag off", &[245, 240, 0]),
    ("If level flag", &[238, 239, 0, 238, 0, 0]),
    ("If global flag", &[238, 240, 0, 238, 0, 0]),
    (
        "If level flag is off",
        &[238, 210, 0, 0, 239, 0, 255, 238, 0, 0],
    ),
    ("If party facing", &[238, 210, 0, 0, 237, 255, 238, 0, 0]),
    (
        "If held item type",
        &[238, 210, 0, 0, 231, 225, 255, 238, 0, 0],
    ),
    ("If dialogue answer", &[238, 210, 1, 0, 228, 255, 238, 0, 0]),
    ("If party at cell", &[238, 241, 0, 0, 0, 238, 0, 0]),
    ("Create item", &[234, 1, 0, 254, 255, 0, 0]),
    ("Remove held item", &[237, 255]),
    ("Change hit points", &[244, 255, 1]),
    ("Damage characters", &[243, 255, 1, 6, 0, 4, 5, 1]),
    ("Launch spell", &[233, 223, 1, 0, 0, 0, 0, 0]),
    ("Award party experience", &[235, 226, 100, 0]),
    ("Allow resting", &[247, 209]),
    ("Prevent resting", &[245, 209]),
    ("Wait", &[229, 18, 0]),
    ("Refresh view", &[228]),
    ("Start dialogue scene", &[227, 213]),
    ("Finish dialogue scene", &[227, 212]),
    ("Draw dialogue box", &[227, 214]),
    (
        "Ask a question",
        &[227, 216, 0, 0, 255, 255, 255, 255, 255, 255],
    ),
    ("Show dialogue text", &[227, 248, 0, 0, 255, 255]),
    ("Go to step", &[242, 0, 0]),
    ("Call routine", &[239, 0, 0]),
    ("Return from routine", &[240]),
    ("End event", &[241]),
];

impl Event {
    pub fn add(&mut self, preset: usize, after: Option<u16>) -> Result<u16> {
        let id = self
            .steps
            .iter()
            .map(|s| s.id)
            .max()
            .unwrap_or(0)
            .checked_add(1)
            .context("no more step labels")?;
        let mut bytes = PRESETS.get(preset).context("unknown command")?.1.to_vec();
        for f in command(&bytes)?.fields {
            if f.kind == Kind::Target {
                f.write(&mut bytes, self.entry as i32);
            }
        }
        let index = after
            .and_then(|id| self.steps.iter().position(|s| s.id == id))
            .map_or(self.steps.len(), |i| i + 1);
        self.steps.insert(
            index,
            Step {
                id,
                bytes,
                texts: BTreeMap::new(),
            },
        );
        Ok(id)
    }
    pub fn remove(&mut self, id: u16) -> Result<()> {
        ensure!(
            id != self.entry,
            "choose another start step before removing this step"
        );
        for step in &self.steps {
            if step.id != id {
                ensure!(
                    !command(&step.bytes)?
                        .fields
                        .iter()
                        .any(|f| f.kind == Kind::Target && f.read(&step.bytes) == id as i32),
                    "another step refers to this one; change its destination first"
                );
            }
        }
        self.steps.retain(|s| s.id != id);
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    fn fixture(instructions: &[u8]) -> (Value, Vec<u8>) {
        let base = 8;
        let mut raw = vec![0; base];
        raw[0..2].copy_from_slice(&4u16.to_le_bytes());
        raw.extend(((instructions.len() + 2) as u16).to_le_bytes());
        raw.extend(instructions);
        raw.extend(b"Original\0");
        let directory = raw.len();
        raw[4..6].copy_from_slice(&(directory as u16).to_le_bytes());
        raw.extend(2u16.to_le_bytes());
        for (block, flags) in [(33u16, 8u16), (34, 16)] {
            raw.extend(block.to_le_bytes());
            raw.extend(flags.to_le_bytes());
            raw.extend(2u16.to_le_bytes());
        }
        (
            json!({"bytecode_start":base,"fields":[],"bytes":raw.chunks(16).collect::<Vec<_>>(),"bindings":[
                {"block":33,"flags":8,"bytecode_offset":2},
                {"block":34,"flags":16,"bytecode_offset":2}
            ]}),
            raw,
        )
    }

    #[test]
    fn command_palette_has_complete_valid_instructions() {
        for (name, bytes) in PRESETS {
            assert_eq!(command(bytes).unwrap().len, bytes.len(), "{name}");
        }
    }

    #[test]
    fn conditions_respect_operand_boundaries_and_stack_order() {
        let c = command(&[238, 210, 238, 0, 237, 255, 238, 9, 0]).unwrap();
        assert_eq!(c.condition.as_deref(), Some("(party facing = 238)"));
        assert_eq!(c.len, 9); // Literal 0xEE is not an expression terminator.
        assert!(command(&[238, 255, 238, 9, 0]).is_err());
        assert!(command(&[238, 239, 1]).is_err());
    }

    #[test]
    fn reachable_branches_and_calls_are_relocated_without_changing_other_events() {
        let (mut document, raw) = fixture(&[
            238, 239, 3, 238, 14, 0, // If flag 3, continue; otherwise step 14.
            253, 65, 0, // Open door.
            242, 17, 0, // Go to end.
            239, 18, 0,   // Call routine.
            241, // End.
            252, 66, 0, 240, // Close door; return.
        ]);
        let mut event = load(&document, 0).unwrap();
        assert_eq!(
            event.steps.iter().map(|s| s.id).collect::<Vec<_>>(),
            vec![2, 8, 11, 14, 17, 18, 21]
        );
        event.activation = Some(24);
        document["events"] = json!({"0":event});
        let encoded = crate::inf::encode(&document, &raw).unwrap();
        let old_dir = word(&raw, 4).unwrap() as usize;
        let new_dir = word(&encoded, 4).unwrap() as usize;
        let entry = word(&encoded, new_dir + 6).unwrap();
        assert_eq!(entry as usize, old_dir - 8);
        assert_eq!(word(&encoded, new_dir + 4).unwrap(), 24);
        // The second trigger still calls its original shared routine.
        assert_eq!(&encoded[new_dir + 8..], &raw[old_dir + 8..]);
        assert_eq!(&encoded[10..old_dir], &raw[10..old_dir]);
        // Decode the packed event as a newly extracted file, without overrides.
        let mut extracted = document.clone();
        extracted.as_object_mut().unwrap().remove("events");
        extracted["bytes"] = json!(encoded.chunks(16).collect::<Vec<_>>());
        extracted["bindings"][0]["bytecode_offset"] = json!(entry);
        let packed = load(&extracted, 0).unwrap();
        let delta = entry - 2;
        for (old, new) in event.steps.iter().zip(&packed.steps) {
            assert_eq!(new.id, old.id + delta);
            let mut expected = old.bytes.clone();
            for f in command(&old.bytes).unwrap().fields {
                if f.kind == Kind::Target {
                    f.write(&mut expected, f.read(&old.bytes) + delta as i32);
                }
            }
            assert_eq!(new.bytes, expected);
        }
        assert_eq!(read_text(&extracted, 0).unwrap(), "Original");
        // Re-extracted edited files can themselves be edited again.
        extracted["events"] = json!({"0":packed});
        assert!(crate::inf::encode(&extracted, &encoded).is_ok());
    }

    #[test]
    fn message_edits_add_strings_without_changing_shared_original_messages() {
        let (mut document, raw) = fixture(&[248, 0, 0, 15, 0, 241]);
        let mut event = load(&document, 0).unwrap();
        event.steps[0]
            .texts
            .insert(1, "New text\n\\x06\\x0F".into());
        document["events"] = json!({"0":event});
        let encoded = crate::inf::encode(&document, &raw).unwrap();
        let dir = word(&encoded, 4).unwrap() as usize;
        let entry = word(&encoded, dir + 6).unwrap() as usize;
        assert_eq!(word(&encoded, 8 + entry + 1).unwrap(), 1);
        document["bytes"] = json!(encoded.chunks(16).collect::<Vec<_>>());
        assert_eq!(read_text(&document, 0).unwrap(), "Original");
        assert_eq!(read_text(&document, 1).unwrap(), "New text\n\\x06\\x0F");
    }

    #[test]
    fn removal_and_reordering_preserve_step_labels_and_protect_references() {
        let (document, _) = fixture(&[239, 6, 0, 241, 240]);
        let mut event = load(&document, 0).unwrap();
        assert!(event.remove(2).is_err());
        assert!(event.remove(6).is_err());
        let old = event.clone();
        let id = event.add(0, Some(2)).unwrap();
        assert_eq!(event.steps[1].id, id);
        event.remove(id).unwrap();
        assert_eq!(event, old);
        event.steps.swap(0, 1);
        assert_eq!(event.entry, 2);
        validate(&event).unwrap();
    }

    #[test]
    fn malformed_commands_text_and_targets_are_rejected_before_export() {
        let (mut document, raw) = fixture(&[253, 65, 0, 241]);
        let mut event = load(&document, 0).unwrap();
        event.steps[0].bytes = vec![242, 255, 255];
        assert!(validate(&event).is_err());
        event.steps[0].bytes = vec![248, 0, 0, 15, 0];
        event.steps[0].texts.insert(1, "\\x00".into());
        assert!(validate(&event).is_err());
        event.steps[0].texts.insert(1, "\\x".into());
        assert!(validate(&event).is_err());
        event.steps[0].texts.insert(1, "x".repeat(64000));
        document["events"] = json!({"0":event});
        assert!(crate::inf::encode(&document, &raw).is_err());
        let (document, _) = fixture(&[238, 239, 0, 238, 3, 0, 241]);
        assert!(load(&document, 0).is_err()); // Branch into an operand.
    }

    #[test]
    fn supplied_level_events_roundtrip_through_the_codec_when_assets_are_present() {
        let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("assets/scripts");
        if !root.is_dir() {
            return;
        }
        for file in std::fs::read_dir(root).unwrap() {
            let path = file.unwrap().path();
            if path.extension().is_none_or(|e| e != "json") {
                continue;
            }
            let document = crate::assets::read_json(&path).unwrap();
            let raw = bytes(&document).unwrap();
            let count = document["bindings"].as_array().unwrap().len();
            for index in 0..count {
                let event = load(&document, index)
                    .unwrap_or_else(|e| panic!("{} event {index}: {e:#}", path.display()));
                validate(&event).unwrap();
                let mut edited = document.clone();
                edited["events"] = json!({(index.to_string()): &event});
                let packed = crate::inf::encode(&edited, &raw).unwrap();
                let base = edited["bytecode_start"].as_u64().unwrap() as usize;
                let old_dir = word(&raw, word(&raw, 0).unwrap() as usize).unwrap() as usize;
                let new_dir = word(&packed, word(&packed, 0).unwrap() as usize).unwrap() as usize;
                assert_eq!(&raw[base + 2..old_dir], &packed[base + 2..old_dir]);
                assert_eq!(
                    &raw[old_dir + 2 + index * 6..old_dir + 6 + index * 6],
                    &packed[new_dir + 2 + index * 6..new_dir + 6 + index * 6]
                );
                edited.as_object_mut().unwrap().remove("events");
                edited["bytes"] = json!(packed.chunks(16).collect::<Vec<_>>());
                for i in 0..count {
                    edited["bindings"][i]["bytecode_offset"] =
                        json!(word(&packed, new_dir + 6 + i * 6).unwrap());
                }
                let again = load(&edited, index).unwrap();
                assert_eq!(again.steps.len(), event.steps.len());
            }
        }
    }
}
