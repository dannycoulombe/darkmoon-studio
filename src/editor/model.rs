use crate::assets;
use anyhow::{Context, Result, ensure};
use serde_json::{Value, json};
use std::{
    collections::{BTreeMap, BTreeSet},
    fs,
    io::Write,
    path::{Path, PathBuf},
};

pub const SIZE: usize = 32;
pub const HISTORY_LIMIT: usize = 100;
pub const DIRECTIONS: [&str; 4] = ["North", "East", "South", "West"];

pub struct MapDocument {
    pub json: Value,
    pub walls: Vec<[u8; 4]>,
    saved: Vec<[u8; 4]>,
    hash: String,
}
impl MapDocument {
    fn load(path: &Path) -> Result<Self> {
        let bytes = fs::read(path)?;
        let json: Value = serde_json::from_slice(&bytes)?;
        ensure!(
            json["width"] == 32 && json["height"] == 32,
            "{} must be 32×32",
            path.display()
        );
        let cells = json["cells"].as_array().context("map cells missing")?;
        ensure!(cells.len() == SIZE * SIZE, "invalid map cell count");
        let mut walls = vec![[0; 4]; SIZE * SIZE];
        let mut seen = BTreeSet::new();
        for c in cells {
            let x = assets::u(c, "x")?;
            let y = assets::u(c, "y")?;
            ensure!(
                x < SIZE && y < SIZE && seen.insert((x, y)),
                "invalid or duplicate cell"
            );
            let bytes = assets::numbers(&c["walls"])?;
            ensure!(bytes.len() == 4, "four wall IDs are required");
            walls[y * SIZE + x].copy_from_slice(&bytes);
        }
        Ok(Self {
            saved: walls.clone(),
            walls,
            json,
            hash: assets::hash(&bytes),
        })
    }
    pub fn dirty(&self) -> bool {
        self.walls != self.saved
    }
    fn value(&self) -> Value {
        let mut v = self.json.clone();
        for c in v["cells"].as_array_mut().unwrap() {
            let index =
                c["y"].as_u64().unwrap() as usize * SIZE + c["x"].as_u64().unwrap() as usize;
            c["walls"] = json!(self.walls[index]);
        }
        v
    }
}
pub struct ScriptDocument {
    pub value: Value,
    saved: Value,
    hash: String,
    pub dirty: bool,
}
pub struct Area {
    pub id: usize,
    pub script: String,
    pub sections: Vec<usize>,
}
#[derive(Clone)]
pub struct Location {
    pub area: usize,
    pub section: usize,
    pub map: String,
    pub graphics: String,
    pub script: String,
}
#[derive(Clone, Debug)]
pub struct Spawn {
    pub slot: usize,
    pub block: usize,
    pub kind: u8,
    pub direction: u8,
    pub block_field: usize,
}
#[derive(Clone)]
pub enum Change {
    Wall {
        map: String,
        cell: usize,
        dir: usize,
        before: u8,
        after: u8,
    },
    Field {
        script: String,
        index: usize,
        before: Value,
        after: Value,
    },
    Binding {
        script: String,
        index: usize,
        before: usize,
        after: usize,
    },
    Events {
        script: String,
        before: Option<Value>,
        after: Option<Value>,
    },
}
pub struct Edit {
    pub label: String,
    pub changes: Vec<Change>,
}
pub struct Project {
    pub revision: u64,
    pub root: PathBuf,
    pub maps: BTreeMap<String, MapDocument>,
    pub scripts: BTreeMap<String, ScriptDocument>,
    pub areas: Vec<Area>,
    undo: Vec<Edit>,
    redo: Vec<Edit>,
    pending: Option<Edit>,
}
impl Project {
    /// Freeze in-memory edits without saving or changing dirty/history state.
    pub fn snapshot(&self) -> crate::playtest::Snapshot {
        crate::playtest::Snapshot {
            root: self.root.clone(),
            documents: self
                .maps
                .iter()
                .map(|(name, map)| (PathBuf::from(format!("maps/{name}.json")), map.value()))
                .chain(self.scripts.iter().map(|(name, script)| {
                    (
                        PathBuf::from(format!("scripts/{name}.json")),
                        script.value.clone(),
                    )
                }))
                .collect(),
        }
    }

    pub fn open(root: &Path) -> Result<Self> {
        let root = root
            .canonicalize()
            .context("asset directory does not exist; run extract first")?;
        assets::manifest(&root).context("open an extracted asset directory with manifest.json")?;
        let mut maps = BTreeMap::new();
        for f in fs::read_dir(root.join("maps"))? {
            let path = f?.path();
            if path.extension().is_some_and(|s| s == "json") {
                let key = path
                    .file_stem()
                    .context("map name")?
                    .to_string_lossy()
                    .into_owned();
                maps.insert(key, MapDocument::load(&path)?);
            }
        }
        let mut scripts = BTreeMap::new();
        let mut areas = Vec::new();
        for f in fs::read_dir(root.join("scripts"))? {
            let path = f?.path();
            if path.extension().is_none_or(|s| s != "json") {
                continue;
            }
            let key = path
                .file_stem()
                .context("script name")?
                .to_string_lossy()
                .into_owned();
            let Some(id) = key
                .strip_prefix("level")
                .and_then(|s| s.parse::<usize>().ok())
            else {
                continue;
            };
            let bytes = fs::read(&path)?;
            let value: Value = serde_json::from_slice(&bytes)?;
            let sections: BTreeSet<usize> = value["fields"]
                .as_array()
                .context("level fields missing")?
                .iter()
                .filter_map(|f| section_number(f["name"].as_str()?))
                .collect();
            ensure!(!sections.is_empty(), "{key}: no decoded sublevels");
            areas.push(Area {
                id,
                script: key.clone(),
                sections: sections.into_iter().collect(),
            });
            scripts.insert(
                key,
                ScriptDocument {
                    saved: value.clone(),
                    value,
                    hash: assets::hash(&bytes),
                    dirty: false,
                },
            );
        }
        areas.sort_by_key(|a| a.id);
        ensure!(!areas.is_empty() && !maps.is_empty(), "no levels found");
        let project = Self {
            revision: 0,
            root,
            maps,
            scripts,
            areas,
            undo: Vec::new(),
            redo: Vec::new(),
            pending: None,
        };
        for a in &project.areas {
            for &section in &a.sections {
                project.location(a.id, section)?;
            }
        }
        Ok(project)
    }
    pub fn location(&self, id: usize, section: usize) -> Result<Location> {
        let area = self
            .areas
            .iter()
            .find(|a| a.id == id)
            .context("area not found")?;
        ensure!(area.sections.contains(&section), "sublevel not found");
        let fields = self.fields(&area.script);
        let mut map = None;
        let mut graphics = None;
        for &s in area.sections.iter().filter(|s| **s <= section) {
            for field in fields {
                let name = field["name"].as_str().unwrap_or("");
                if name == format!("sublevel[{s}].maze") {
                    map = field["value"]
                        .as_str()
                        .map(|s| s.trim_end_matches(".maz").to_owned());
                }
                if name == format!("sublevel[{s}].graphics") {
                    graphics = field["value"].as_str().map(str::to_owned);
                }
            }
        }
        let map = map.context("level has no maze reference")?;
        ensure!(self.maps.contains_key(&map), "unknown map {map}");
        Ok(Location {
            area: id,
            section,
            map,
            graphics: graphics.unwrap_or_default(),
            script: area.script.clone(),
        })
    }
    pub fn fields(&self, script: &str) -> &[Value] {
        self.scripts[script].value["fields"].as_array().unwrap()
    }
    pub fn spawns(&self, script: &str) -> Vec<Spawn> {
        let fields = self.fields(script);
        let mut spawns = Vec::new();
        for (i, f) in fields.iter().enumerate() {
            let name = f["name"].as_str().unwrap_or("");
            if let Some(slot) = name
                .strip_prefix("spawn[")
                .and_then(|s| s.strip_suffix("].block"))
                .and_then(|s| s.parse().ok())
            {
                let value = |suffix: &str| {
                    let key = format!("spawn[{slot}].{suffix}");
                    fields
                        .iter()
                        .find(|f| f["name"] == key)
                        .and_then(|f| f["value"].as_u64())
                        .unwrap_or(0) as u8
                };
                spawns.push(Spawn {
                    slot,
                    block: f["value"].as_u64().unwrap_or(0) as usize,
                    kind: value("type"),
                    direction: value("direction"),
                    block_field: i,
                });
            }
        }
        spawns
    }
    pub fn wall_ids(&self, location: &Location) -> Vec<u8> {
        let mut ids: BTreeSet<u8> = self.maps[&location.map]
            .walls
            .iter()
            .flatten()
            .copied()
            .collect();
        ids.extend([0, 1, 2]);
        for f in self.fields(&location.script) {
            if f["name"].as_str().is_some_and(|n| {
                n.starts_with(&format!("sublevel[{}].wall[", location.section))
                    && n.ends_with(".wall_id")
            }) && let Some(n) = f["value"].as_u64()
            {
                ids.insert(n as u8);
            }
        }
        ids.into_iter().collect()
    }
    pub fn shared_areas(&self, map: &str) -> Vec<usize> {
        self.areas
            .iter()
            .filter(|a| {
                a.sections
                    .iter()
                    .any(|s| self.location(a.id, *s).is_ok_and(|l| l.map == map))
            })
            .map(|a| a.id)
            .collect()
    }
    pub fn begin(&mut self, label: &str) {
        if self.pending.is_none() {
            self.pending = Some(Edit {
                label: label.into(),
                changes: Vec::new(),
            });
        }
    }
    pub fn finish(&mut self) {
        if let Some(edit) = self.pending.take()
            && !edit.changes.is_empty()
        {
            self.redo.clear();
            self.undo.push(edit);
            if self.undo.len() > HISTORY_LIMIT {
                self.undo.remove(0);
            }
        }
    }
    fn apply(&mut self, change: &Change, forward: bool) {
        self.revision = self.revision.wrapping_add(1);
        match change {
            Change::Wall {
                map,
                cell,
                dir,
                before,
                after,
            } => {
                self.maps.get_mut(map).unwrap().walls[*cell][*dir] =
                    if forward { *after } else { *before }
            }
            Change::Field {
                script,
                index,
                before,
                after,
            } => {
                let d = self.scripts.get_mut(script).unwrap();
                d.value["fields"][*index]["value"] = if forward {
                    after.clone()
                } else {
                    before.clone()
                };
                d.dirty = d.value != d.saved;
            }
            Change::Binding {
                script,
                index,
                before,
                after,
            } => {
                let d = self.scripts.get_mut(script).unwrap();
                d.value["bindings"][*index]["block"] =
                    json!(if forward { *after } else { *before });
                d.dirty = d.value != d.saved;
            }
            Change::Events {
                script,
                before,
                after,
            } => {
                let d = self.scripts.get_mut(script).unwrap();
                let value = if forward { after } else { before };
                if let Some(value) = value {
                    d.value["events"] = value.clone();
                } else {
                    d.value.as_object_mut().unwrap().remove("events");
                }
                d.dirty = d.value != d.saved;
            }
        }
    }
    fn change(&mut self, change: Change) {
        self.apply(&change, true);
        self.pending
            .get_or_insert_with(|| Edit {
                label: "Edit".into(),
                changes: Vec::new(),
            })
            .changes
            .push(change);
    }
    pub fn paint(&mut self, map: &str, cell: usize, dir: usize, value: u8, linked: bool) {
        if cell >= SIZE * SIZE || dir >= 4 || !self.maps.contains_key(map) {
            return;
        }
        self.paint_one(map, cell, dir, value);
        if linked && let Some(neighbor) = neighbor(cell, dir) {
            self.paint_one(map, neighbor, (dir + 2) % 4, value);
        }
    }
    fn paint_one(&mut self, map: &str, cell: usize, dir: usize, after: u8) {
        let before = self.maps[map].walls[cell][dir];
        if before != after {
            self.change(Change::Wall {
                map: map.into(),
                cell,
                dir,
                before,
                after,
            });
        }
    }
    pub fn carve(&mut self, map: &str, cell: usize) {
        if cell >= SIZE * SIZE || !self.maps.contains_key(map) {
            return;
        }
        for dir in 0..4 {
            let Some(adjacent) = neighbor(cell, dir) else {
                continue;
            };
            // Solid cells keep their faces: those walls enclose the new tile.
            // Only join an existing floor cell, never excavate its neighbors.
            let join_floor = self.maps[map].walls[adjacent].contains(&0);
            self.paint(map, cell, dir, 0, join_floor);
        }
    }
    pub fn set_field(&mut self, script: &str, index: usize, after: Value) -> Result<()> {
        let field = self.fields(script).get(index).context("field missing")?;
        validate_field(field, &after)?;
        if field["name"].as_str().is_some_and(|n| n.ends_with(".maze")) {
            let key = after.as_str().unwrap().trim_end_matches(".maz");
            ensure!(self.maps.contains_key(key), "map {key} does not exist");
        }
        let before = field["value"].clone();
        if before != after {
            self.change(Change::Field {
                script: script.into(),
                index,
                before,
                after,
            });
        }
        Ok(())
    }
    pub fn move_spawns(&mut self, script: &str, slots: &[usize], destination: usize) -> Result<()> {
        ensure!(destination < SIZE * SIZE, "monster block must be 0–1023");
        let spawns = self.spawns(script);
        let fields = slots
            .iter()
            .map(|slot| {
                spawns
                    .iter()
                    .find(|s| s.slot == *slot)
                    .map(|s| s.block_field)
                    .context("monster spawn missing")
            })
            .collect::<Result<Vec<_>>>()?;
        for index in fields {
            self.set_field(script, index, json!(destination))?;
        }
        Ok(())
    }
    pub fn set_event(
        &mut self,
        script: &str,
        binding: usize,
        event: Option<&crate::inf_script::Event>,
    ) -> Result<()> {
        let document = &self
            .scripts
            .get(script)
            .context("level script missing")?
            .value;
        ensure!(
            document["bindings"].get(binding).is_some(),
            "script trigger missing"
        );
        let before = document.get("events").cloned();
        let mut events = before.clone().unwrap_or_else(|| json!({}));
        let key = binding.to_string();
        if let Some(event) = event {
            crate::inf_script::validate(event)?;
            events[&key] = serde_json::to_value(event)?;
        } else {
            events
                .as_object_mut()
                .context("invalid event overrides")?
                .remove(&key);
        }
        let after = if events
            .as_object()
            .context("invalid event overrides")?
            .is_empty()
        {
            None
        } else {
            Some(events)
        };
        let mut candidate = document.clone();
        if let Some(value) = &after {
            candidate["events"] = value.clone();
        } else {
            candidate.as_object_mut().unwrap().remove("events");
        }
        // Validate storage and references before recording any undoable change.
        crate::inf_script::compile(&candidate, crate::inf_script::bytes(&candidate)?)?;
        if before != after {
            self.change(Change::Events {
                script: script.into(),
                before,
                after,
            });
        }
        Ok(())
    }
    pub fn binding_destination_available(
        &self,
        script: &str,
        indices: &[usize],
        destination: usize,
    ) -> bool {
        destination < SIZE * SIZE
            && self
                .scripts
                .get(script)
                .and_then(|s| s.value["bindings"].as_array())
                .is_some_and(|bindings| {
                    indices.iter().all(|i| *i < bindings.len())
                        && !bindings.iter().enumerate().any(|(i, b)| {
                            !indices.contains(&i) && b["block"].as_u64() == Some(destination as u64)
                        })
                })
    }
    pub fn move_bindings(
        &mut self,
        script: &str,
        indices: &[usize],
        destination: usize,
    ) -> Result<()> {
        ensure!(
            self.binding_destination_available(script, indices, destination),
            "destination is outside the map or already has a script binding"
        );
        for &index in indices {
            let before = self.scripts[script].value["bindings"][index]["block"]
                .as_u64()
                .context("binding block missing")? as usize;
            if before != destination {
                self.change(Change::Binding {
                    script: script.into(),
                    index,
                    before,
                    after: destination,
                });
            }
        }
        Ok(())
    }
    pub fn undo(&mut self) {
        self.finish();
        if let Some(edit) = self.undo.pop() {
            for c in edit.changes.iter().rev() {
                self.apply(c, false);
            }
            self.redo.push(edit);
        }
    }
    pub fn redo(&mut self) {
        self.finish();
        if let Some(edit) = self.redo.pop() {
            for c in &edit.changes {
                self.apply(c, true);
            }
            self.undo.push(edit);
        }
    }
    pub fn undo_label(&self) -> Option<&str> {
        self.undo.last().map(|e| e.label.as_str())
    }
    pub fn redo_label(&self) -> Option<&str> {
        self.redo.last().map(|e| e.label.as_str())
    }
    pub fn history_len(&self) -> usize {
        self.undo.len() + self.redo.len()
    }
    pub fn history_position(&self) -> usize {
        self.undo.len()
    }
    /// Oldest retained action first, including the undone branch in order.
    pub fn history(&self) -> impl Iterator<Item = &Edit> {
        self.undo.iter().chain(self.redo.iter().rev())
    }
    pub fn seek_history(&mut self, position: usize) -> Result<()> {
        self.finish();
        ensure!(
            position <= self.history_len(),
            "history position is out of range"
        );
        while self.history_position() > position {
            self.undo();
        }
        while self.history_position() < position {
            self.redo();
        }
        Ok(())
    }
    pub fn dirty_count(&self) -> usize {
        self.maps.values().filter(|m| m.dirty()).count()
            + self.scripts.values().filter(|s| s.dirty).count()
    }
    pub fn area_dirty(&self, area: &Area) -> bool {
        self.scripts[&area.script].dirty
            || area.sections.iter().any(|s| {
                self.location(area.id, *s)
                    .is_ok_and(|l| self.maps[&l.map].dirty())
            })
    }
    pub fn save(&mut self) -> Result<usize> {
        self.finish();
        let mut writes = Vec::new();
        for (key, map) in &self.maps {
            if map.dirty() {
                writes.push((
                    self.root.join(format!("maps/{key}.json")),
                    map.value(),
                    map.hash.clone(),
                ));
            }
        }
        for (key, script) in &self.scripts {
            if script.dirty {
                for f in script.value["fields"].as_array().unwrap() {
                    validate_field(f, &f["value"])?;
                }
                let raw = fs::read(self.root.join(format!("raw/{key}.inf")))
                    .context("original INF missing")?;
                crate::inf::encode(&script.value, &crate::cps::decode(&raw)?.data)
                    .with_context(|| format!("invalid level data in {key}"))?;
                writes.push((
                    self.root.join(format!("scripts/{key}.json")),
                    script.value.clone(),
                    script.hash.clone(),
                ));
            }
        }
        // Detect external edits and validate every document before replacing any.
        for (p, _, hash) in &writes {
            ensure!(
                assets::hash(&fs::read(p)?) == *hash,
                "{} changed outside the editor. Reload the project before saving.",
                p.display()
            );
        }
        let mut prepared = Vec::new();
        for (path, value, _) in &writes {
            let tmp = path.with_extension(format!("editor-{}.tmp", std::process::id()));
            let text = serde_json::to_string_pretty(value)? + "\n";
            let mut file = fs::File::create(&tmp)?;
            file.write_all(text.as_bytes())?;
            file.sync_all()?;
            prepared.push((path, tmp, text));
        }
        for (path, tmp, _) in &prepared {
            fs::rename(tmp, path)?;
        }
        for (key, map) in &mut self.maps {
            if map.dirty() {
                map.json = map.value();
                map.saved = map.walls.clone();
                map.hash = assets::hash(&fs::read(self.root.join(format!("maps/{key}.json")))?);
            }
        }
        for (key, script) in &mut self.scripts {
            if script.dirty {
                script.saved = script.value.clone();
                script.dirty = false;
                script.hash =
                    assets::hash(&fs::read(self.root.join(format!("scripts/{key}.json")))?);
            }
        }
        Ok(writes.len())
    }
}
pub fn neighbor(cell: usize, dir: usize) -> Option<usize> {
    let x = cell % SIZE;
    let y = cell / SIZE;
    match dir {
        0 if y > 0 => Some(cell - SIZE),
        1 if x < SIZE - 1 => Some(cell + 1),
        2 if y < SIZE - 1 => Some(cell + SIZE),
        3 if x > 0 => Some(cell - 1),
        _ => None,
    }
}
pub fn section_number(name: &str) -> Option<usize> {
    name.strip_prefix("sublevel[")?
        .split(']')
        .next()?
        .parse()
        .ok()
}
pub fn field_range(field: &Value) -> (i64, i64) {
    match field["encoding"].as_str() {
        Some("i8") => (-128, 127),
        Some("u16") => (0, 65535),
        _ => (0, 255),
    }
}
pub fn validate_field(field: &Value, value: &Value) -> Result<()> {
    if field["encoding"] == "string13" {
        let s = value.as_str().context("filename must be text")?;
        ensure!(
            s.is_ascii() && s.len() <= 12 && !s.contains(['/', '\\']),
            "use a filename of up to 12 ASCII characters"
        );
    } else {
        let n = value.as_i64().context("numeric value required")?;
        let (min, max) = field_range(field);
        ensure!(
            (min..=max).contains(&n),
            "value must be between {min} and {max}"
        );
    }
    if field["name"]
        .as_str()
        .is_some_and(|n| n.starts_with("spawn[") && n.ends_with(".block"))
    {
        ensure!(
            value.as_u64().is_some_and(|n| n < 1024),
            "monster block must be 0–1023"
        );
    }
    Ok(())
}
pub fn title(graphics: &str) -> &str {
    match graphics {
        "forest" => "Forest",
        "dung" => "Temple",
        "mezz" => "Stone halls",
        "silver" => "Silver tower",
        "crimson" => "Crimson tower",
        _ => "Dungeon",
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    fn fixture() -> (Project, PathBuf) {
        let path = std::env::temp_dir().join(format!(
            "eye2-editor-{}-{}",
            std::process::id(),
            std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .unwrap()
                .as_nanos()
        ));
        fs::create_dir_all(path.join("maps")).unwrap();
        fs::create_dir_all(path.join("scripts")).unwrap();
        assets::save_json(
            &path.join("manifest.json"),
            &json!({"format":1,"source":"/unused","files":[]}),
        )
        .unwrap();
        let cells: Vec<_> = (0..1024)
            .map(|i| json!({"x":i%32,"y":i/32,"walls":[1,2,1,2],"preserved":"yes"}))
            .collect();
        assets::save_json(
            &path.join("maps/level4.json"),
            &json!({"width":32,"height":32,"cells":cells,"extra":42}),
        )
        .unwrap();
        for i in [4, 5] {
            assets::save_json(&path.join(format!("scripts/level{i}.json")),&json!({"fields":[{"name":"sublevel[0].maze","value":"level4.maz","encoding":"string13","offset":5},{"name":"sublevel[0].graphics","value":"forest","encoding":"string13","offset":18}],"bytes":[]})).unwrap();
        }
        (Project::open(&path).unwrap(), path)
    }
    #[test]
    fn linked_stroke_undo_redo_and_save() {
        let (mut p, path) = fixture();
        assert_eq!(p.shared_areas("level4"), vec![4, 5]);
        p.begin("Paint walls");
        p.paint("level4", 33, 1, 60, true);
        p.paint("level4", 33, 2, 0, true);
        p.finish();
        assert_eq!(p.maps["level4"].walls[34][3], 60);
        assert_eq!(p.maps["level4"].walls[65][0], 0);
        assert_eq!(p.dirty_count(), 1);
        p.undo();
        assert_eq!(p.maps["level4"].walls[33], [1, 2, 1, 2]);
        assert_eq!(p.dirty_count(), 0);
        p.redo();
        assert_eq!(p.save().unwrap(), 1);
        assert_eq!(p.dirty_count(), 0);
        let v = assets::read_json(&path.join("maps/level4.json")).unwrap();
        assert_eq!(v["extra"], 42);
        assert_eq!(v["cells"][33]["preserved"], "yes");
        assert_eq!(v["cells"][33]["walls"][1], 60);
        p.undo();
        assert_eq!(p.dirty_count(), 1);
        p.redo();
        assert_eq!(p.dirty_count(), 0);
        fs::remove_dir_all(path).unwrap();
    }

    #[test]
    fn event_edits_undo_redo_save_and_snapshot_without_changing_original_code() {
        let (mut project, path) = fixture();
        fs::create_dir_all(path.join("raw")).unwrap();
        let mut raw = vec![0u8; 96];
        raw[0..2].copy_from_slice(&2u16.to_le_bytes());
        raw[2..4].copy_from_slice(&74u16.to_le_bytes());
        raw[5..15].copy_from_slice(b"level4.maz");
        raw[18..24].copy_from_slice(b"forest");
        raw[64..70].copy_from_slice(&[6, 0, 253, 65, 0, 241]);
        raw[70..74].copy_from_slice(b"old\0");
        for (offset, value) in [(74, 1u16), (76, 33), (78, 8), (80, 2)] {
            raw[offset..offset + 2].copy_from_slice(&value.to_le_bytes());
        }
        fs::write(
            path.join("raw/level4.inf"),
            crate::cps::encode(&raw, &[]).unwrap(),
        )
        .unwrap();
        let mut value = project.scripts["level4"].value.clone();
        value["bytecode_start"] = json!(64);
        value["bytes"] = json!(raw.chunks(16).collect::<Vec<_>>());
        value["bindings"] = json!([{"block":33,"flags":8,"bytecode_offset":2}]);
        assets::save_json(&path.join("scripts/level4.json"), &value).unwrap();
        let document = project.scripts.get_mut("level4").unwrap();
        document.saved = value.clone();
        document.value = value.clone();
        document.hash = assets::hash(&fs::read(path.join("scripts/level4.json")).unwrap());
        let mut event = crate::inf_script::load(&value, 0).unwrap();
        event.steps[0].bytes[1] = 66;
        project.begin("Edit tile event");
        project.set_event("level4", 0, Some(&event)).unwrap();
        project.finish();
        assert_eq!(project.dirty_count(), 1);
        assert_eq!(project.history_len(), 1);
        project.undo();
        assert_eq!(project.scripts["level4"].value, value);
        assert_eq!(project.dirty_count(), 0);
        project.redo();
        let edited = project.scripts["level4"].value.clone();
        assert!(
            project
                .snapshot()
                .documents
                .iter()
                .any(|(p, v)| p == &PathBuf::from("scripts/level4.json") && *v == edited)
        );
        assert_eq!(project.save().unwrap(), 1);
        let reopened = Project::open(&path).unwrap();
        assert_eq!(
            crate::inf_script::load(&reopened.scripts["level4"].value, 0).unwrap(),
            event
        );
        let encoded = crate::inf::encode(&edited, &raw).unwrap();
        assert_eq!(&encoded[66..74], &raw[66..74]);
        let directory = crate::cps::word(&encoded, 2).unwrap() as usize;
        let entry = crate::cps::word(&encoded, directory + 6).unwrap() as usize;
        assert_eq!(encoded[64 + entry + 1], 66);
        let mut invalid = event.clone();
        invalid.steps[0].bytes = vec![242, 255, 255];
        assert!(project.set_event("level4", 0, Some(&invalid)).is_err());
        assert_eq!(project.scripts["level4"].value, edited);
        project.begin("Restore original tile event");
        project.set_event("level4", 0, None).unwrap();
        project.finish();
        assert_eq!(project.scripts["level4"].value, value);
        project.undo();
        assert_eq!(project.scripts["level4"].value, edited);
        fs::remove_dir_all(path).unwrap();
    }
    #[test]
    fn carve_removes_only_one_tile_and_preserves_solid_neighbors() {
        let (mut project, path) = fixture();
        for cell in [33, 0, 31, 992, 1023] {
            let before = project.maps["level4"].walls.clone();
            let mut expected = before.clone();
            for dir in 0..4 {
                if neighbor(cell, dir).is_some() {
                    expected[cell][dir] = 0;
                }
            }

            project.begin("Carve");
            project.carve("level4", cell);
            project.finish();
            assert_eq!(project.maps["level4"].walls, expected);
            project.carve("level4", cell);
            project.finish();
            assert_eq!(project.maps["level4"].walls, expected);
            assert_eq!(project.history_position(), 1);
            project.undo();
            assert_eq!(project.maps["level4"].walls, before);
            assert_eq!(project.history_position(), 0);
            project.redo();
            assert_eq!(project.maps["level4"].walls, expected);
            project.undo();
        }
        fs::remove_dir_all(path).unwrap();
    }
    #[test]
    fn carve_joins_existing_floor_without_widening_the_passage() {
        let (mut project, path) = fixture();
        project.maps.get_mut("level4").unwrap().walls[33] = [5, 6, 0, 8];
        let before = project.maps["level4"].walls.clone();
        let mut expected = before.clone();
        expected[33][1] = 0;
        expected[34] = [0; 4];
        expected[35] = [0; 4];
        project.begin("Carve passage");
        project.carve("level4", 34);
        project.carve("level4", 35);
        project.finish();
        assert_eq!(project.maps["level4"].walls, expected);
        assert_eq!(project.history_position(), 1);
        project.undo();
        assert_eq!(project.maps["level4"].walls, before);
        project.redo();
        assert_eq!(project.maps["level4"].walls, expected);
        project.save().unwrap();
        assert_eq!(Project::open(&path).unwrap().maps["level4"].walls, expected);
        fs::remove_dir_all(path).unwrap();
    }
    #[test]
    fn one_sided_edges_and_external_conflicts() {
        let (mut p, path) = fixture();
        p.begin("One side");
        p.paint("level4", 31, 1, 25, true);
        p.paint("level4", 0, 1, 46, false);
        p.finish();
        assert_eq!(p.maps["level4"].walls[32], [1, 2, 1, 2]);
        assert_eq!(p.maps["level4"].walls[1][3], 2);
        fs::write(path.join("maps/level4.json"), "external edit").unwrap();
        assert!(p.save().unwrap_err().to_string().contains("outside"));
        fs::remove_dir_all(path).unwrap();
    }
    #[test]
    fn invalid_field_values_are_rejected() {
        assert!(validate_field(&json!({"encoding":"u8"}), &json!(256)).is_err());
        assert!(validate_field(&json!({"encoding":"i8"}), &json!(-129)).is_err());
        assert!(validate_field(&json!({"encoding":"string13"}), &json!("../secret")).is_err());
    }
    #[test]
    fn history_keeps_exactly_100_actions_across_undo_redo_and_save() {
        let (mut project, path) = fixture();
        for step in 1..=105 {
            project.begin(&format!("Step {step}"));
            project.paint("level4", 33, 0, (step + 1) as u8, false);
            project.finish();
        }
        assert_eq!(project.history_len(), HISTORY_LIMIT);
        assert_eq!(project.history_position(), 100);
        assert_eq!(project.history().next().unwrap().label, "Step 6");
        assert_eq!(project.undo_label(), Some("Step 105"));
        assert_eq!(project.save().unwrap(), 1);
        assert_eq!(project.history_len(), 100, "saving retains session history");
        project.seek_history(0).unwrap();
        assert_eq!(
            project.maps["level4"].walls[33][0], 6,
            "evicted changes remain applied"
        );
        assert_eq!(project.history_position(), 0);
        assert_eq!(project.history_len(), 100);
        assert_eq!(project.redo_label(), Some("Step 6"));
        project.undo();
        assert_eq!(project.maps["level4"].walls[33][0], 6);
        project.seek_history(100).unwrap();
        assert_eq!(project.maps["level4"].walls[33][0], 106);
        assert_eq!(project.dirty_count(), 0);
        project.redo();
        assert_eq!(project.history_len(), 100);
        assert!(project.seek_history(101).is_err());
        project.seek_history(70).unwrap();
        assert_eq!(project.maps["level4"].walls[33][0], 76);
        project.begin("No change");
        project.paint("level4", 33, 0, 76, false);
        project.finish();
        assert_eq!(
            project.history_len(),
            100,
            "no-op edits preserve redo history"
        );
        project.begin("New branch");
        project.paint("level4", 33, 0, 200, false);
        project.finish();
        assert_eq!(project.history_len(), 71);
        assert_eq!(project.history_position(), 71);
        assert_eq!(project.redo_label(), None);
        project.undo();
        assert_eq!(project.maps["level4"].walls[33][0], 76);
        project.redo();
        assert_eq!(project.maps["level4"].walls[33][0], 200);
        assert_eq!(
            Project::open(&path).unwrap().history_len(),
            0,
            "reopening starts a fresh session"
        );
        fs::remove_dir_all(path).unwrap();
    }
    #[test]
    fn a_large_paint_stroke_is_one_history_action() {
        let (mut project, path) = fixture();
        project.begin("Paint passage");
        for cell in 0..300 {
            project.paint("level4", cell, 0, 0, false);
        }
        project.finish();
        assert_eq!(project.history_len(), 1);
        assert_eq!(project.history().next().unwrap().changes.len(), 300);
        project.undo();
        assert!(project.maps["level4"].walls.iter().all(|w| w[0] == 1));
        project.redo();
        assert!(
            project.maps["level4"].walls[..300]
                .iter()
                .all(|w| w[0] == 0)
        );
        assert_eq!(project.history_len(), 1);
        fs::remove_dir_all(path).unwrap();
    }
    #[test]
    fn entity_moves_undo_save_and_rebuild_without_changing_other_data() {
        let (mut project, path) = fixture();
        let mut raw = vec![0; 80];
        for (offset, value) in [
            (0, 2u16),
            (2, 8),
            (8, 2),
            (10, 33),
            (12, 8),
            (14, 4),
            (16, 66),
            (18, 168),
            (20, 10),
            (60, 33),
            (62, 33),
        ] {
            raw[offset..offset + 2].copy_from_slice(&value.to_le_bytes());
        }
        raw[32..42].copy_from_slice(b"level4.maz");
        raw[45..51].copy_from_slice(b"forest");
        fs::create_dir_all(path.join("raw")).unwrap();
        fs::write(
            path.join("raw/level4.inf"),
            crate::cps::encode(&raw, &[]).unwrap(),
        )
        .unwrap();
        let mut value = project.scripts["level4"].value.clone();
        value["bytes"] = json!(raw.chunks(16).collect::<Vec<_>>());
        value["fields"][0]["offset"] = json!(32);
        value["fields"][1]["offset"] = json!(45);
        value["fields"].as_array_mut().unwrap().extend([
            json!({"name":"spawn[0].block","encoding":"u16","offset":60,"value":33}),
            json!({"name":"spawn[1].block","encoding":"u16","offset":62,"value":33}),
        ]);
        value["bindings"] = json!([{"block":33,"flags":8,"bytecode_offset":4},{"block":66,"flags":168,"bytecode_offset":10}]);
        assets::save_json(&path.join("scripts/level4.json"), &value).unwrap();
        let document = project.scripts.get_mut("level4").unwrap();
        document.value = value.clone();
        document.saved = value.clone();
        document.hash = assets::hash(&fs::read(path.join("scripts/level4.json")).unwrap());
        assert_eq!(crate::inf::encode(&value, &raw).unwrap(), raw);
        assert!(project.move_spawns("level4", &[0, 999], 65).is_err());
        assert!(project.move_spawns("level4", &[0], 1024).is_err());
        assert!(project.move_bindings("level4", &[0], 66).is_err());
        assert!(project.move_bindings("level4", &[0], 1024).is_err());
        assert_eq!(project.scripts["level4"].value, value);
        project.begin("Move entities");
        project.move_spawns("level4", &[0, 1], 65).unwrap();
        project.move_bindings("level4", &[0], 65).unwrap();
        project.finish();
        assert_eq!(project.dirty_count(), 1);
        assert!(!project.maps["level4"].dirty());
        project.undo();
        assert_eq!(project.scripts["level4"].value, value);
        assert_eq!(project.dirty_count(), 0);
        project.redo();
        assert_eq!(project.save().unwrap(), 1);
        let reopened = Project::open(&path).unwrap();
        assert!(reopened.spawns("level4").iter().all(|s| s.block == 65));
        let saved = &reopened.scripts["level4"].value;
        assert_eq!(saved["bindings"][0]["block"], 65);
        assert_eq!(saved["bindings"][1], value["bindings"][1]);
        let encoded = crate::inf::encode(saved, &raw).unwrap();
        let mut expected = raw.clone();
        for offset in [10, 60, 62] {
            expected[offset..offset + 2].copy_from_slice(&65u16.to_le_bytes());
        }
        assert_eq!(encoded, expected);
        project.undo();
        assert_eq!(project.scripts["level4"].value, value);
        assert_eq!(project.dirty_count(), 1);
        fs::remove_dir_all(path).unwrap();
    }
    #[test]
    fn walking_uses_live_wall_edits_door_states_and_sublevel_flags() {
        use super::super::{
            navigation::{self, Action, Blocked},
            preview,
        };
        let (mut p, path) = fixture();
        let mut l = p.location(4, 0).unwrap();
        let flags = preview::wall_flags(&p, &l);
        assert_ne!(flags[0] & 1, 0);
        assert_eq!(flags[1] & 1, 0);
        assert_eq!(flags[2] & 1, 0);
        for base in [3, 8, 13, 18] {
            for state in 0..4 {
                assert_eq!(flags[base + state] & 1, 0, "door is not fully open");
            }
            assert_ne!(flags[base + 4] & 1, 0, "open door permits walking");
        }
        let step = |p: &Project, l: &Location| {
            navigation::advance(
                &p.maps[&l.map].walls,
                &preview::wall_flags(p, l),
                33,
                1,
                Action::Forward,
            )
        };
        assert_eq!(step(&p, &l), Err(Blocked::Wall(2)));
        p.begin("Open passage");
        p.paint(&l.map, 33, 1, 0, true);
        p.finish();
        let revision = p.revision;
        let dirty = p.dirty_count();
        assert_eq!(step(&p, &l), Ok((34, 1)));
        assert_eq!(p.revision, revision);
        assert_eq!(p.dirty_count(), dirty);
        p.undo();
        assert_eq!(step(&p, &l), Err(Blocked::Wall(2)));
        p.redo();
        assert_eq!(step(&p, &l), Ok((34, 1)));

        // INF flags are XORed with 4, and later sublevels inherit/override them.
        p.scripts.get_mut(&l.script).unwrap().value["fields"].as_array_mut().unwrap().extend([
            json!({"name":"sublevel[0].wall[0].wall_id","value":25,"encoding":"u8","offset":40}),
            json!({"name":"sublevel[0].wall[0].flags","value":5,"encoding":"u8","offset":41}),
            json!({"name":"sublevel[1].wall[0].wall_id","value":25,"encoding":"u8","offset":42}),
            json!({"name":"sublevel[1].wall[0].flags","value":4,"encoding":"u8","offset":43}),
        ]);
        p.begin("Special passage");
        p.paint(&l.map, 33, 1, 25, true);
        p.finish();
        assert_eq!(preview::wall_flags(&p, &l)[25], 1);
        assert_eq!(step(&p, &l), Ok((34, 1)));
        // A live flags edit immediately closes the same passage, and undo opens it.
        p.begin("Close special passage");
        p.set_field(&l.script, 3, json!(4)).unwrap();
        p.finish();
        assert_eq!(step(&p, &l), Err(Blocked::Wall(25)));
        p.undo();
        assert_eq!(step(&p, &l), Ok((34, 1)));
        l.section = 1;
        assert_eq!(preview::wall_flags(&p, &l)[25], 0);
        assert_eq!(step(&p, &l), Err(Blocked::Wall(25)));
        fs::remove_dir_all(path).unwrap();
    }
}
