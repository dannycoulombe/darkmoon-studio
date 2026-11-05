//! Event-step editor. Drafts are applied atomically through project history.
use super::*;
use crate::inf_script::{self as script, Event, Kind};

pub(super) struct EventEditor {
    script: String,
    binding: usize,
    event: Event,
    saved: Event,
    selected: u16,
    preset: usize,
    closing: bool,
    error: Option<String>,
    catalogues: Catalogues,
}
#[derive(Default)]
struct Catalogues {
    items: Vec<String>,
    dialogue: Vec<String>,
}
impl Catalogues {
    fn load(root: &std::path::Path) -> Self {
        let mut result = Self::default();
        if let Ok(value) = crate::assets::read_json(&root.join("items/items.json"))
            && let Some(items) = value["items"].as_array()
        {
            result.items = items
                .iter()
                .map(|item| {
                    let name = item["name_unidentified"].as_u64().unwrap_or(0) as usize;
                    value["names"][name].as_str().unwrap_or("Item").into()
                })
                .collect();
        }
        if let Ok(value) = crate::assets::read_json(&root.join("texts/dialogue.json"))
            && let Some(groups) = value["groups"].as_array()
        {
            result.dialogue = groups
                .iter()
                .map(|group| group.as_str().unwrap_or("").trim_matches('\0').into())
                .collect();
        }
        result
    }
}
impl EventEditor {
    pub(super) fn dirty(&self) -> bool {
        self.event != self.saved
    }
}

impl Editor {
    pub(super) fn open_event(&mut self, name: &str, binding: usize) {
        if let Err(e) = self.commit_event_draft() {
            self.fail(e);
            return;
        }
        match script::load(&self.project.scripts[name].value, binding) {
            Ok(event) => {
                self.script_editor = Some(EventEditor {
                    script: name.into(),
                    binding,
                    selected: event.entry,
                    saved: event.clone(),
                    event,
                    preset: 0,
                    closing: false,
                    error: None,
                    catalogues: Catalogues::load(&self.project.root),
                })
            }
            Err(e) => self.fail(format!("This event cannot be edited: {e:#}")),
        }
    }

    pub(super) fn commit_event_draft(&mut self) -> Result<()> {
        let Some(draft) = self.script_editor.as_ref().filter(|e| e.dirty()) else {
            return Ok(());
        };
        let current = script::load(&self.project.scripts[&draft.script].value, draft.binding)?;
        anyhow::ensure!(
            current == draft.saved,
            "the event changed while its draft was open; reload it in the event editor"
        );
        self.project.finish();
        self.project.begin("Edit tile event");
        let result = self
            .project
            .set_event(&draft.script, draft.binding, Some(&draft.event));
        self.project.finish();
        result?;
        let applied = draft.event.clone();
        self.script_editor.as_mut().unwrap().saved = applied;
        self.status = "Event changes applied. Save or Play from here to use them.".into();
        Ok(())
    }

    pub(super) fn event_window(&mut self, ctx: &egui::Context) {
        let Some(mut editor) = self.script_editor.take() else {
            return;
        };
        let current = script::load(&self.project.scripts[&editor.script].value, editor.binding);
        let mut conflict = false;
        if let Ok(current) = &current {
            if *current != editor.saved {
                if editor.dirty() {
                    conflict = true;
                } else {
                    editor.saved = current.clone();
                    editor.event = current.clone();
                }
            }
        } else {
            conflict = true;
        }
        if !editor.event.steps.iter().any(|s| s.id == editor.selected) {
            editor.selected = editor.event.entry;
        }
        let mut open = true;
        let mut apply = false;
        let mut discard = false;
        let mut restore = false;
        let document = &self.project.scripts[&editor.script].value;
        let binding = &document["bindings"][editor.binding];
        let cell = binding["block"].as_u64().unwrap_or(0) as usize;
        egui::Window::new(format!("Tile event · {} · {}, {}", editor.script, cell % SIZE, cell / SIZE))
            .id(egui::Id::unique("event-editor"))
            .open(&mut open)
            .default_size([880.0, 620.0])
            .min_width(680.0)
            .show(ctx, |ui| {
                ui.horizontal(|ui| {
                    ui.heading("Event steps");
                    if editor.dirty() { badge(ui, "Unapplied changes", AMBER); }
                    else { badge(ui, "Applied", ACCENT); }
                });
                ui.label("Choose a step to edit its settings. Steps run in order; conditions and routines can jump to other steps.");
                small(ui, "Apply records one undoable edit. Save and Play from here also apply your draft.");
                if conflict {
                    ui.colored_label(AMBER, "The project event changed. Reload it before applying this draft.");
                    if ui.button("Reload project event").clicked() && let Ok(current) = &current {
                        editor.event = current.clone(); editor.saved = current.clone(); conflict = false;
                    }
                }
                ui.separator();
                ui.collapsing("Activation", |ui| {
                    let original = binding["flags"].as_u64().unwrap_or(0) as u16;
                    let mut flags = editor.event.activation.unwrap_or(original);
                    for (event, label) in [
                        (1u16, "Party enters tile"), (2, "Party leaves tile"),
                        (4, "Item placed on tile"), (8, "Item taken from tile"),
                        (16, "Projectile enters tile"), (256, "Item used toward tile"),
                        (512, "Monster enters tile"), (1024, "Monster leaves tile"),
                        (2048, "Spell cast on tile"),
                    ] {
                        let bit = event << 3;
                        let mut enabled = flags & bit != 0;
                        if ui.checkbox(&mut enabled, label).changed() {
                            if enabled { flags |= bit; } else { flags &= !bit; }
                            editor.event.activation = if flags == original { None } else { Some(flags) };
                        }
                    }
                    small(ui, "Wall interactions and level timers can also call events. Conditions may filter the activation further.");
                });
                let labels: Vec<_> = editor.event.steps.iter().enumerate().map(|(i, step)| {
                    let title = step_summary(step, document);
                    (step.id, format!("{}. {title}", i + 1))
                }).collect();
                ui.horizontal(|ui| {
                    ui.label("Start at");
                    egui::ComboBox::from_id_salt("event-entry")
                        .selected_text(step_label(&labels, editor.event.entry))
                        .show_ui(ui, |ui| {
                            for (id, label) in &labels { ui.selectable_value(&mut editor.event.entry, *id, label); }
                        });
                });
                ui.add_space(5.0);
                let height = (ui.available_height() - 116.0).max(260.0);
                ui.columns(2, |columns| {
                    egui::ScrollArea::vertical().id_salt("event-steps").max_height(height).show(&mut columns[0], |ui| {
                        ui.set_min_width(ui.available_width());
                        for (i, step) in editor.event.steps.iter().enumerate() {
                            let label = if step.id == editor.event.entry { format!("▶ {}", labels[i].1) } else { labels[i].1.clone() };
                            if ui.add_sized([ui.available_width(), CONTROL_HEIGHT], egui::Button::selectable(editor.selected == step.id, &label).truncate()).on_hover_text(&label).clicked() { editor.selected = step.id; }
                        }
                    });
                    egui::ScrollArea::vertical().id_salt("event-settings").max_height(height).show(&mut columns[1], |ui| {
                        ui.set_min_width(ui.available_width());
                        if let Some(step) = editor.event.steps.iter_mut().find(|s| s.id == editor.selected) {
                            match script::command(&step.bytes) {
                                Ok(command) => {
                                    ui.label(RichText::new(&command.title).strong().size(17.0));
                                    if let Some(condition) = &command.condition {
                                        ui.label(format!("If {condition}, continue to the next step. Otherwise, go to the chosen step."));
                                    } else if command.terminal { small(ui, "This step stops the sequence or transfers control."); }
                                    ui.add_space(8.0);
                                    for field in &command.fields {
                                        ui.push_id(field.offset, |ui| { edit_field(ui, field, step, &labels, document, &editor.catalogues); });
                                        ui.add_space(6.0);
                                    }
                                    if command.fields.is_empty() { small(ui, "This command has no settings."); }
                                    ui.collapsing("Technical details", |ui| {
                                        ui.monospace(format!("Step label {} · {} bytes", step.id, step.bytes.len()));
                                        ui.monospace(step.bytes.iter().map(|b| format!("{b:02X}")).collect::<Vec<_>>().join(" "));
                                    });
                                }
                                Err(e) => { ui.colored_label(AMBER, format!("Cannot read step: {e:#}")); }
                            }
                        }
                    });
                });
                ui.separator();
                ui.horizontal(|ui| {
                    let position = editor.event.steps.iter().position(|s| s.id == editor.selected).unwrap_or(0);
                    if ui.add_enabled(position > 0, egui::Button::new("Move up")).clicked() { editor.event.steps.swap(position, position - 1); }
                    if ui.add_enabled(position + 1 < editor.event.steps.len(), egui::Button::new("Move down")).clicked() { editor.event.steps.swap(position, position + 1); }
                    if ui.button("Remove step").clicked() {
                        if let Err(e) = editor.event.remove(editor.selected) { editor.error = Some(e.to_string()); }
                        else { editor.selected = editor.event.entry; }
                    }
                });
                ui.horizontal(|ui| {
                    egui::ComboBox::from_id_salt("event-new-command")
                        .selected_text(script::PRESETS[editor.preset].0)
                        .show_ui(ui, |ui| {
                            for (i, (name, _)) in script::PRESETS.iter().enumerate() { ui.selectable_value(&mut editor.preset, i, *name); }
                        });
                    if ui.button("Insert before selected").clicked() {
                        match editor.event.add(editor.preset, Some(editor.selected)) {
                            Ok(id) => {
                                let position = editor.event.steps.iter().position(|s| s.id == id).unwrap();
                                editor.event.steps.swap(position, position - 1);
                                if editor.event.entry == editor.selected { editor.event.entry = id; }
                                editor.selected = id;
                            }
                            Err(e) => editor.error = Some(e.to_string()),
                        }
                    }
                    if ui.button("Replace selected").clicked() {
                        let old_id = editor.selected;
                        match editor.event.add(editor.preset, Some(old_id)) {
                            Ok(id) => {
                                editor.event.steps.retain(|s| s.id != old_id);
                                editor.event.steps.iter_mut().find(|s| s.id == id).unwrap().id = old_id;
                            }
                            Err(e) => editor.error = Some(e.to_string()),
                        }
                    }
                });
                if let Some(error) = &editor.error { ui.colored_label(AMBER, error); }
                if editor.closing {
                    ui.colored_label(AMBER, "Apply this draft before closing, or discard its changes?");
                    ui.horizontal(|ui| {
                        if ui.button("Apply and close").clicked() { apply = true; }
                        if ui.button("Discard draft").clicked() { discard = true; }
                        if ui.button("Keep editing").clicked() { editor.closing = false; }
                    });
                } else {
                    ui.horizontal(|ui| {
                        if ui.add_enabled(editor.dirty() && !conflict, egui::Button::new("Apply changes")).clicked() { apply = true; }
                        if ui.add_enabled(editor.dirty(), egui::Button::new("Discard draft")).clicked() {
                            editor.event = editor.saved.clone(); editor.error = None;
                        }
                        if document.get("events").and_then(|e| e.get(editor.binding.to_string())).is_some()
                            && ui.button("Restore original event").clicked() { restore = true; }
                    });
                }
            });
        if !open && editor.dirty() {
            editor.closing = true;
        }
        let keep = !discard && (open || editor.dirty());
        let close_after_apply = editor.closing;
        self.script_editor = Some(editor);
        if apply {
            match self.commit_event_draft() {
                Ok(()) => {
                    self.script_editor.as_mut().unwrap().error = None;
                    if close_after_apply {
                        self.script_editor = None;
                    }
                }
                Err(e) => self.script_editor.as_mut().unwrap().error = Some(format!("{e:#}")),
            }
        } else if restore {
            let editor = self.script_editor.as_ref().unwrap();
            self.project.finish();
            self.project.begin("Restore original tile event");
            let result = self.project.set_event(&editor.script, editor.binding, None);
            self.project.finish();
            match result {
                Ok(()) => {
                    let editor = self.script_editor.as_mut().unwrap();
                    match script::load(&self.project.scripts[&editor.script].value, editor.binding)
                    {
                        Ok(event) => {
                            editor.saved = event.clone();
                            editor.event = event;
                            editor.error = None;
                        }
                        Err(e) => editor.error = Some(format!("{e:#}")),
                    }
                }
                Err(e) => self.script_editor.as_mut().unwrap().error = Some(format!("{e:#}")),
            }
        } else if !keep {
            self.script_editor = None;
        }
    }
}

fn step_label(labels: &[(u16, String)], id: u16) -> String {
    labels
        .iter()
        .find(|(key, _)| *key == id)
        .map_or_else(|| "Choose a step".into(), |(_, label)| label.clone())
}

fn step_summary(step: &script::Step, document: &Value) -> String {
    let Ok(command) = script::command(&step.bytes) else {
        return "Unreadable command".into();
    };
    if let Some(condition) = &command.condition {
        return format!("If {condition}");
    }
    let mut title = command.title;
    if let Some(field) = command.fields.iter().find(|f| f.kind == Kind::Cell) {
        let cell = field.read(&step.bytes);
        if cell < 1024 {
            title.push_str(&format!(" · {}, {}", cell % 32, cell / 32));
        }
    } else if let Some(field) = command.fields.iter().find(|f| f.kind == Kind::Text) {
        let text = step.texts.get(&field.offset).cloned().unwrap_or_else(|| {
            script::read_text(document, field.read(&step.bytes) as u16).unwrap_or_default()
        });
        let preview: String = text
            .chars()
            .take(36)
            .map(|c| if c == '\n' { ' ' } else { c })
            .collect();
        if !preview.is_empty() {
            title.push_str(&format!(" · {preview}"));
        }
    } else if let Some(field) = command.fields.iter().find(|f| f.kind == Kind::Flag) {
        title.push_str(&format!(" · {}", field.read(&step.bytes)));
    }
    title
}

fn edit_field(
    ui: &mut egui::Ui,
    field: &script::Field,
    step: &mut script::Step,
    labels: &[(u16, String)],
    document: &Value,
    catalogues: &Catalogues,
) {
    ui.label(&field.name);
    if field.kind == Kind::Filename {
        let bytes = &step.bytes[field.offset..field.offset + 13];
        let end = bytes.iter().position(|b| *b == 0).unwrap_or(13);
        let mut text = String::from_utf8_lossy(&bytes[..end]).into_owned();
        if ui
            .add(egui::TextEdit::singleline(&mut text).char_limit(12))
            .changed()
            && text.is_ascii()
        {
            step.bytes[field.offset..field.offset + 13].fill(0);
            step.bytes[field.offset..field.offset + text.len()].copy_from_slice(text.as_bytes());
        }
        return;
    }
    let mut value = field.read(&step.bytes);
    if matches!(
        field.name.as_str(),
        "Item template" | "Random item" | "Fixed item" | "Item ID"
    ) && !catalogues.items.is_empty()
    {
        let label = catalogues
            .items
            .get(value as usize)
            .map_or_else(|| format!("Item {value}"), |s| format!("{value} · {s}"));
        egui::ComboBox::from_id_salt("item")
            .selected_text(label)
            .width(270.0)
            .show_ui(ui, |ui| {
                if field.min < 0 {
                    ui.selectable_value(&mut value, -1, "Any item");
                }
                for (i, name) in catalogues.items.iter().enumerate() {
                    ui.selectable_value(&mut value, i as i32, format!("{i} · {name}"));
                }
            });
        field.write(&mut step.bytes, value);
        return;
    }
    match field.kind {
        Kind::Text => {
            let mut text =
                step.texts.get(&field.offset).cloned().unwrap_or_else(|| {
                    script::read_text(document, value as u16).unwrap_or_default()
                });
            if ui
                .add(
                    egui::TextEdit::multiline(&mut text)
                        .desired_rows(3)
                        .desired_width(f32::INFINITY),
                )
                .changed()
            {
                step.texts.insert(field.offset, text);
            }
            small(
                ui,
                "ASCII text; line breaks are supported. Preserve \\xNN codes for DOS formatting.",
            );
            if field.name.contains("optional") && ui.button("Omit this choice").clicked() {
                step.texts.remove(&field.offset);
                value = 65535;
            }
        }
        Kind::Target => {
            let mut id = value as u16;
            egui::ComboBox::from_id_salt("target")
                .selected_text(step_label(labels, id))
                .show_ui(ui, |ui| {
                    for (key, text) in labels {
                        ui.selectable_value(&mut id, *key, text);
                    }
                });
            value = id as i32;
        }
        Kind::Operator => {
            let names = [
                "Or",
                "And",
                "Less than or equal",
                "Less than",
                "Greater than or equal",
                "Greater than",
                "Not equal",
                "Equal",
            ];
            egui::ComboBox::from_id_salt("operator")
                .selected_text(names[(value - 248).clamp(0, 7) as usize])
                .show_ui(ui, |ui| {
                    for (i, name) in names.iter().enumerate() {
                        ui.selectable_value(&mut value, 248 + i as i32, *name);
                    }
                });
        }
        Kind::Direction => {
            let label = model::DIRECTIONS
                .get(value as usize)
                .copied()
                .unwrap_or("Keep current facing");
            egui::ComboBox::from_id_salt("direction")
                .selected_text(label)
                .show_ui(ui, |ui| {
                    for (i, name) in model::DIRECTIONS.iter().enumerate() {
                        ui.selectable_value(&mut value, i as i32, *name);
                    }
                    if field.max == 255 {
                        ui.selectable_value(&mut value, 255, "Keep current facing");
                    }
                });
        }
        Kind::Character => {
            let all = if step.bytes[0] == 249 {
                "Random character"
            } else {
                "All characters"
            };
            egui::ComboBox::from_id_salt("character")
                .selected_text(if value == -1 {
                    all.into()
                } else {
                    format!("Party member {}", value + 1)
                })
                .show_ui(ui, |ui| {
                    ui.selectable_value(&mut value, -1, all);
                    for i in 0..6 {
                        ui.selectable_value(&mut value, i, format!("Party member {}", i + 1));
                    }
                });
        }
        Kind::Dialogue => {
            let label = if value == 65535 {
                "No passage".into()
            } else {
                format!("Passage {value}")
            };
            egui::ComboBox::from_id_salt("passage")
                .selected_text(label)
                .width(270.0)
                .show_ui(ui, |ui| {
                    ui.selectable_value(&mut value, 65535, "No passage");
                    for (i, passage) in catalogues.dialogue.iter().enumerate() {
                        let preview: String = passage
                            .chars()
                            .filter(|c| !c.is_control())
                            .take(60)
                            .collect();
                        ui.selectable_value(&mut value, i as i32, format!("{i} · {preview}"));
                    }
                });
            if let Some(passage) = catalogues.dialogue.get(value as usize) {
                ui.label(passage.replace('\r', "\n"));
            }
        }
        Kind::Cell => {
            let item_destination = step.bytes[0] == 234 && field.offset == 3;
            if item_destination {
                let label = match value {
                    65535 => "Give to hand",
                    65534 => "At party position",
                    _ => "At map cell",
                };
                egui::ComboBox::from_id_salt("destination-kind")
                    .selected_text(label)
                    .show_ui(ui, |ui| {
                        let cell = if value < 1024 { value } else { 0 };
                        ui.selectable_value(&mut value, cell, "At map cell");
                        ui.selectable_value(&mut value, 65534, "At party position");
                        ui.selectable_value(&mut value, 65535, "Give to hand");
                    });
            }
            if value < 1024 {
                let mut x = value % 32;
                let mut y = value / 32;
                ui.horizontal(|ui| {
                    ui.label("X");
                    ui.add(egui::DragValue::new(&mut x).range(0..=31));
                    ui.label("Y");
                    ui.add(egui::DragValue::new(&mut y).range(0..=31));
                });
                value = y * 32 + x;
            } else if !item_destination {
                ui.add(egui::DragValue::new(&mut value).range(0..=65535));
            }
        }
        _ => {
            ui.add(egui::DragValue::new(&mut value).range(field.min..=field.max));
        }
    }
    field.write(&mut step.bytes, value);
}
