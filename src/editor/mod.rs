mod canvas;
mod entities;
mod icons;
pub mod model;
mod navigation;
mod preview;
mod scripts;
mod window;

use anyhow::Result;
use eframe::egui::{
    self, Align, Color32, FontId, Frame, Key, Layout, Margin, RichText, Stroke, Vec2,
};
use model::{Location, Project, SIZE};
use serde_json::{Value, json};
use std::{collections::BTreeMap, path::PathBuf, sync::mpsc, time::Duration};

const BG: Color32 = Color32::from_rgb(17, 23, 29);
const PANEL: Color32 = Color32::from_rgb(24, 32, 39);
const CARD: Color32 = Color32::from_rgb(32, 42, 49);
const BORDER: Color32 = Color32::from_rgb(47, 60, 68);
const TEXT: Color32 = Color32::from_rgb(227, 234, 236);
const MUTED: Color32 = Color32::from_rgb(143, 160, 170);
const ACCENT: Color32 = Color32::from_rgb(168, 208, 145);
const AMBER: Color32 = Color32::from_rgb(234, 180, 108);
const PURPLE: Color32 = Color32::from_rgb(169, 160, 224);
const CONTROL_HEIGHT: f32 = 32.0;

#[derive(Clone, Copy, PartialEq, Eq)]
enum Tool {
    Select,
    Start,
    Wall,
    Erase,
    Room,
    Move,
}
impl Tool {
    fn label(self) -> &'static str {
        match self {
            Self::Select => "Inspect",
            Self::Start => "Start point",
            Self::Wall => "Wall",
            Self::Erase => "Erase",
            Self::Room => "Carve",
            Self::Move => "Move spawn",
        }
    }
    fn key(self) -> &'static str {
        match self {
            Self::Select => "V",
            Self::Start => "P",
            Self::Wall => "B",
            Self::Erase => "X",
            Self::Room => "R",
            Self::Move => "M",
        }
    }
}
#[derive(Clone, Copy, PartialEq, Eq)]
enum Tab {
    Cell,
    Monsters,
    Data,
}
#[derive(Clone, Copy)]
enum Dialog {
    Help,
    Reload,
    Export,
    Close,
}
struct Editor {
    project: Project,
    area: usize,
    section: usize,
    selected: usize,
    selected_spawn: Option<usize>,
    selected_binding: Option<usize>,
    script_editor: Option<scripts::EventEditor>,
    tool: Tool,
    brush: u8,
    linked: bool,
    tab: Tab,
    search: String,
    field_search: String,
    show_spawns: bool,
    show_triggers: bool,
    show_ids: bool,
    show_preview: bool,
    preview: preview::Preview,
    navigation: navigation::Repeater,
    zoom: f32,
    pan: Vec2,
    fit: bool,
    hover: Option<(usize, usize)>,
    stroke: bool,
    entity_drag: Option<entities::Drag>,
    clipboard: Option<[u8; 4]>,
    dialog: Option<Dialog>,
    status: String,
    error: Option<String>,
    export_path: String,
    job: Option<mpsc::Receiver<Result<String, String>>>,
    test_job: Option<mpsc::Receiver<Result<crate::playtest::Prepared, String>>>,
    test_worker: Option<std::thread::JoinHandle<()>>,
    test_game: Option<crate::playtest::Running>,
    text_buffers: BTreeMap<String, String>,
    textures: BTreeMap<String, egui::TextureHandle>,
    allow_close: bool,
}
pub fn run(assets: PathBuf, runtime: PathBuf, level: usize) -> Result<()> {
    let project = Project::open(&assets)?;
    let area = if project.areas.iter().any(|a| a.id == level) {
        level
    } else {
        project.areas[0].id
    };
    let editor = Editor {
        project,
        area,
        section: 0,
        selected: 171,
        selected_spawn: None,
        selected_binding: None,
        script_editor: None,
        tool: Tool::Select,
        brush: 1,
        linked: true,
        tab: Tab::Cell,
        search: String::new(),
        field_search: String::new(),
        show_spawns: true,
        show_triggers: true,
        show_ids: false,
        show_preview: true,
        preview: preview::Preview::default(),
        navigation: navigation::Repeater::default(),
        zoom: 20.0,
        pan: Vec2::ZERO,
        fit: true,
        hover: None,
        stroke: false,
        entity_drag: None,
        clipboard: None,
        dialog: None,
        status: "Ready. Select a cell to inspect it.".into(),
        error: None,
        export_path: runtime.display().to_string(),
        job: None,
        test_job: None,
        test_worker: None,
        test_game: None,
        text_buffers: BTreeMap::new(),
        textures: BTreeMap::new(),
        allow_close: false,
    };
    let options = eframe::NativeOptions {
        viewport: egui::ViewportBuilder::default()
            .with_decorations(false)
            .with_inner_size([1440.0, 900.0])
            .with_min_inner_size([1080.0, 700.0])
            .with_app_id("eye2.darkmoon-studio")
            .with_icon(icon()),
        renderer: eframe::Renderer::Glow,
        ..Default::default()
    };
    eframe::run_native(
        "Darkmoon Studio · Level editor",
        options,
        Box::new(move |cc| {
            theme(&cc.egui_ctx);
            Ok(Box::new(editor))
        }),
    )
    .map_err(|e| anyhow::anyhow!("Editor could not start: {e}"))
}
fn theme(ctx: &egui::Context) {
    ctx.set_theme(egui::Theme::Dark);
    let mut s = (*ctx.style_of(egui::Theme::Dark)).clone();
    s.visuals = egui::Visuals::dark();
    s.visuals.panel_fill = PANEL;
    s.visuals.window_fill = PANEL;
    s.visuals.extreme_bg_color = BG;
    s.visuals.faint_bg_color = CARD;
    s.visuals.override_text_color = Some(TEXT);
    s.visuals.selection.bg_fill = Color32::from_rgb(60, 80, 63);
    s.visuals.selection.stroke = Stroke::new(1.0, ACCENT);
    s.visuals.widgets.noninteractive.bg_stroke = Stroke::new(1.0, BORDER);
    s.visuals.widgets.inactive.weak_bg_fill = CARD;
    s.visuals.widgets.inactive.bg_fill = CARD;
    s.visuals.widgets.inactive.bg_stroke = Stroke::new(1.0, BORDER);
    s.visuals.widgets.hovered.weak_bg_fill = Color32::from_rgb(49, 65, 70);
    s.visuals.widgets.active.weak_bg_fill = Color32::from_rgb(58, 78, 70);
    s.spacing.item_spacing = Vec2::new(8.0, 8.0);
    // Keep text and combo-box icons within the shared button/field height.
    s.spacing.button_padding = Vec2::new(12.0, 6.0);
    s.spacing.interact_size = Vec2::new(36.0, CONTROL_HEIGHT);
    s.spacing.indent = 12.0;
    s.text_styles
        .insert(egui::TextStyle::Body, FontId::proportional(14.0));
    s.text_styles
        .insert(egui::TextStyle::Button, FontId::proportional(14.0));
    s.text_styles
        .insert(egui::TextStyle::Heading, FontId::proportional(20.0));
    s.text_styles
        .insert(egui::TextStyle::Small, FontId::proportional(12.0));
    ctx.set_style_of(egui::Theme::Dark, s);
}
fn icon() -> egui::IconData {
    let mut rgba = vec![0u8; 64 * 64 * 4];
    for y in 0..64 {
        for x in 0..64 {
            let ink = (12..52).contains(&x)
                && ((y == 14 || y == 15 || y == 48 || y == 49)
                    || (x == 14 || x == 15 || x == 48 || x == 49))
                || (28..=31).contains(&x) && (24..=49).contains(&y)
                || (28..=49).contains(&x) && (28..=31).contains(&y);
            let c = if ink { ACCENT } else { PANEL };
            let p = (y * 64 + x) * 4;
            rgba[p..p + 4].copy_from_slice(&[c.r(), c.g(), c.b(), 255]);
        }
    }
    egui::IconData {
        rgba,
        width: 64,
        height: 64,
    }
}
fn frame() -> Frame {
    Frame::NONE.fill(PANEL).inner_margin(Margin::same(16))
}
fn small(ui: &mut egui::Ui, s: impl Into<String>) {
    ui.label(RichText::new(s.into()).small().color(MUTED));
}
fn badge(ui: &mut egui::Ui, s: impl Into<String>, color: Color32) {
    Frame::NONE
        .fill(color.gamma_multiply(0.12))
        .corner_radius(5)
        .inner_margin(Margin::symmetric(7, 3))
        .show(ui, |ui| {
            ui.label(RichText::new(s.into()).size(12.0).color(color));
        });
}
fn wall_color(id: u8) -> Color32 {
    match id {
        0 => ACCENT,
        1 | 2 => Color32::from_rgb(143, 166, 177),
        _ => [
            AMBER,
            PURPLE,
            Color32::from_rgb(99, 180, 191),
            Color32::from_rgb(211, 139, 154),
        ][id as usize % 4],
    }
}

impl Editor {
    fn location(&self) -> Location {
        self.project
            .location(self.area, self.section)
            .expect("validated level reference")
    }
    fn play_from_here(&mut self) {
        if self.test_job.is_some() || self.test_game.is_some() {
            return;
        }
        if let Err(e) = self.commit_text_buffers() {
            self.fail(e);
            return;
        }
        self.project.finish();
        self.stroke = false;
        let start = crate::playtest::Start {
            level: self.area,
            section: self.section,
            cell: self.preview.cell,
            facing: self.preview.facing,
        };
        let snapshot = self.project.snapshot();
        let (tx, rx) = mpsc::channel();
        self.test_job = Some(rx);
        self.status = format!(
            "Preparing test · area {:02}:{} · cell {}, {} · {}…",
            start.level,
            start.section,
            start.cell % SIZE,
            start.cell / SIZE,
            model::DIRECTIONS[start.facing]
        );
        self.test_worker = Some(std::thread::spawn(move || {
            let result = crate::playtest::prepare(snapshot, start)
                .map_err(|e| format!("Playtest failed: {e:#}"));
            let _ = tx.send(result);
        }));
    }
    fn poll_playtest(&mut self, ctx: &egui::Context) {
        if let Some(rx) = &self.test_job {
            match rx.try_recv() {
                Ok(result) => {
                    self.test_job = None;
                    match result.and_then(|prepared| {
                        prepared
                            .launch()
                            .map_err(|e| format!("Could not start playtest: {e:#}"))
                    }) {
                        Ok(game) => {
                            self.test_game = Some(game);
                            self.status = "Test running in a separate window. Stop test to return to editing.".into();
                        }
                        Err(error) => self.fail(error),
                    }
                }
                Err(mpsc::TryRecvError::Disconnected) => {
                    self.test_job = None;
                    self.fail("Playtest preparation stopped unexpectedly.");
                }
                Err(mpsc::TryRecvError::Empty) => {}
            }
        }
        if let Some(game) = &mut self.test_game {
            match game.poll() {
                Ok(Some(status)) => {
                    self.test_game = None;
                    if status.success() {
                        self.status =
                            "Test finished. Your editor changes are ready to continue.".into();
                    } else {
                        self.fail(format!("Test game exited with {status}"));
                    }
                }
                Err(error) => {
                    self.test_game = None;
                    self.fail(format!("Could not check test game: {error}"));
                }
                Ok(None) => {}
            }
        }
        if self.test_job.is_none()
            && let Some(worker) = self.test_worker.take()
        {
            let _ = worker.join();
        }
        if self.test_job.is_some() || self.test_game.is_some() {
            ctx.request_repaint_after(Duration::from_millis(200));
        }
    }
    fn fail(&mut self, error: impl std::fmt::Display) {
        self.error = Some(error.to_string());
    }
    fn change_area(&mut self, id: usize) {
        let section = self
            .project
            .areas
            .iter()
            .find(|a| a.id == id)
            .unwrap()
            .sections[0];
        self.change_location(id, section);
    }
    fn change_location(&mut self, area: usize, section: usize) {
        if let Err(e) = self.commit_text_buffers() {
            self.fail(e);
            return;
        }
        self.project.finish();
        self.area = area;
        self.section = section;
        self.selected_spawn = None;
        self.selected_binding = None;
        self.entity_drag = None;
        self.stroke = false;
        self.hover = None;
        self.navigation = navigation::Repeater::default();
        self.script_editor = None;
        self.fit = true;
        self.text_buffers.clear();
        self.preview.clear();
        self.status = format!("Opened area {area:02} · Sublevel {}.", section + 1);
    }
    fn save(&mut self) -> bool {
        if let Err(e) = self.commit_text_buffers() {
            self.fail(e);
            return false;
        }
        match self.project.save() {
            Ok(n) => {
                self.status = if n == 0 {
                    "All changes are already saved.".into()
                } else {
                    format!("Saved {n} modified file{}.", if n == 1 { "" } else { "s" })
                };
                true
            }
            Err(e) => {
                self.fail(format!("Save failed: {e:#}"));
                false
            }
        }
    }
    fn undo(&mut self) {
        if let Err(e) = self.commit_text_buffers() {
            self.fail(e);
            return;
        }
        let label = self.project.undo_label().map(str::to_owned);
        self.project.undo();
        self.text_buffers.clear();
        self.status = label.map_or_else(
            || "Nothing to undo.".into(),
            |label| format!("Undid: {label}"),
        );
    }
    fn redo(&mut self) {
        if let Err(e) = self.commit_text_buffers() {
            self.fail(e);
            return;
        }
        let label = self.project.redo_label().map(str::to_owned);
        self.project.redo();
        self.text_buffers.clear();
        self.status = label.map_or_else(
            || "Nothing to redo.".into(),
            |label| format!("Redid: {label}"),
        );
    }
    fn undo_redo_shortcuts(&mut self, ctx: &egui::Context) {
        if ctx
            .input_mut(|i| i.consume_key(egui::Modifiers::COMMAND | egui::Modifiers::SHIFT, Key::Z))
        {
            self.redo();
        } else if ctx.input_mut(|i| i.consume_key(egui::Modifiers::COMMAND, Key::Z)) {
            self.undo();
        }
        if ctx.input_mut(|i| i.consume_key(egui::Modifiers::COMMAND, Key::Y)) {
            self.redo();
        }
    }
    fn set_field(&mut self, script: &str, index: usize, value: Value, label: &str) {
        self.project.begin(label);
        if let Err(e) = self.project.set_field(script, index, value) {
            self.fail(e);
        }
        self.project.finish();
    }
    fn pending_text(&self) -> bool {
        self.script_editor.as_ref().is_some_and(|e| e.dirty())
            || self.text_buffers.iter().any(|(key, text)| {
                key.rsplit_once(':')
                    .and_then(|(script, index)| {
                        Some((
                            self.project.scripts.get(script)?,
                            index.parse::<usize>().ok()?,
                        ))
                    })
                    .is_some_and(|(script, index)| {
                        script.value["fields"][index]["value"].as_str() != Some(text)
                    })
            })
    }
    fn commit_text_buffers(&mut self) -> Result<()> {
        self.commit_event_draft()?;
        let buffers = self.text_buffers.clone();
        self.project.begin("Change level resources");
        for (key, text) in buffers {
            if let Some((script, index)) = key.rsplit_once(':')
                && let Ok(index) = index.parse::<usize>()
                && let Err(e) = self.project.set_field(script, index, json!(text))
            {
                self.project.finish();
                return Err(e.context("a resource field has an invalid value"));
            }
        }
        self.project.finish();
        Ok(())
    }
    fn shortcuts(&mut self, ctx: &egui::Context) {
        if self.entity_drag.is_some() {
            if ctx.input_mut(|i| i.consume_key(egui::Modifiers::NONE, Key::Escape)) {
                self.entity_drag = None;
                self.status = "Entity move cancelled.".into();
            }
            self.navigation = navigation::Repeater::default();
            return;
        }
        if self.error.is_some() || self.job.is_some() {
            self.navigation = navigation::Repeater::default();
            return;
        }
        if self.dialog.is_some() {
            return;
        }
        if ctx.input_mut(|i| i.consume_key(egui::Modifiers::COMMAND, Key::S)) {
            self.save();
        }
        if ctx.input_mut(|i| i.consume_key(egui::Modifiers::COMMAND, Key::Q)) {
            ctx.send_viewport_cmd(egui::ViewportCommand::Close);
        }
        if ctx.egui_wants_keyboard_input() {
            self.navigation = navigation::Repeater::default();
            return;
        }
        self.undo_redo_shortcuts(ctx);
        if self.script_editor.is_some() {
            self.navigation = navigation::Repeater::default();
            return;
        }
        ctx.input(|i| {
            if i.modifiers.command || i.modifiers.ctrl || i.modifiers.alt {
                return;
            }
            for (key, tool) in [
                (Key::V, Tool::Select),
                (Key::P, Tool::Start),
                (Key::B, Tool::Wall),
                (Key::X, Tool::Erase),
                (Key::R, Tool::Room),
                (Key::M, Tool::Move),
            ] {
                if i.key_pressed(key) {
                    self.project.finish();
                    self.tool = tool;
                }
            }
            if i.key_pressed(Key::F) {
                self.fit = true;
            }
            for (key, dir) in [
                (Key::ArrowUp, 0),
                (Key::ArrowRight, 1),
                (Key::ArrowDown, 2),
                (Key::ArrowLeft, 3),
            ] {
                if i.key_pressed(key)
                    && let Some(cell) = model::neighbor(self.selected, dir)
                {
                    self.selected = cell;
                }
            }
        });
        if ctx.input_mut(|i| i.consume_key(egui::Modifiers::COMMAND, Key::C)) {
            self.copy_cell();
        }
        if ctx.input_mut(|i| i.consume_key(egui::Modifiers::COMMAND, Key::V)) {
            self.paste_cell();
        }
        self.navigation_shortcuts(ctx);
    }
    fn navigation_shortcuts(&mut self, ctx: &egui::Context) {
        use navigation::Action;
        let (action, repaint_after) = ctx.input(|i| {
            if !i.focused || i.modifiers.command || i.modifiers.ctrl || i.modifiers.alt {
                self.navigation = navigation::Repeater::default();
                return (None, None);
            }
            let keys = [
                (Key::W, Action::Forward),
                (Key::S, Action::Backward),
                (Key::A, Action::Left),
                (Key::D, Action::Right),
                (Key::Q, Action::TurnLeft),
                (Key::E, Action::TurnRight),
            ];
            // Prefer a fresh press when another movement key is already held.
            let pressed = i.events.iter().rev().find_map(|event| match event {
                egui::Event::Key {
                    key,
                    pressed: true,
                    repeat: false,
                    ..
                } => keys.iter().find(|(k, _)| k == key).map(|(_, a)| *a),
                _ => None,
            });
            let down: Vec<_> = keys
                .into_iter()
                .filter(|(key, _)| i.key_down(*key))
                .map(|(_, action)| action)
                .collect();
            let action = self.navigation.poll(i.time, pressed, &down);
            let repaint_after = (!down.is_empty()).then(|| self.navigation.remaining(i.time));
            (action, repaint_after)
        });
        if let Some(delay) = repaint_after {
            ctx.request_repaint_after(Duration::from_secs_f64(delay));
        }
        if let Some(action) = action {
            let l = self.location();
            let flags = preview::wall_flags(&self.project, &l);
            match navigation::advance(
                &self.project.maps[&l.map].walls,
                &flags,
                self.preview.cell,
                self.preview.facing,
                action,
            ) {
                Ok((cell, facing)) => {
                    self.preview.cell = cell;
                    self.preview.facing = facing;
                    self.status = format!(
                        "Preview at {}, {} · facing {}",
                        cell % SIZE,
                        cell / SIZE,
                        model::DIRECTIONS[facing]
                    );
                }
                Err(navigation::Blocked::Wall(id)) => {
                    self.status = format!("Movement blocked by wall {id}.")
                }
                Err(navigation::Blocked::Boundary) => {
                    self.status = "Movement blocked by the map boundary.".into()
                }
            }
        }
    }
    fn copy_cell(&mut self) {
        let l = self.location();
        self.clipboard = Some(self.project.maps[&l.map].walls[self.selected]);
        self.status = "Copied the four walls of the selected cell.".into();
    }
    fn paste_cell(&mut self) {
        if let Some(walls) = self.clipboard {
            let l = self.location();
            self.project.begin("Paste cell");
            for (dir, id) in walls.into_iter().enumerate() {
                self.project
                    .paint(&l.map, self.selected, dir, id, self.linked);
            }
            self.project.finish();
        }
    }
    fn main_menu(&mut self, ui: &mut egui::Ui) {
        egui::Panel::top("main-menu")
            .exact_size(CONTROL_HEIGHT)
            .frame(Frame::NONE.fill(PANEL).inner_margin(Margin::symmetric(16, 0)))
            .show(ui, |ui| {
                egui::MenuBar::new().ui(ui, |ui| {
                    ui.menu_button("File", |ui| {
                        ui.set_min_width(220.0);
                        let save_shortcut = ui.ctx().format_shortcut(&egui::KeyboardShortcut::new(
                            egui::Modifiers::COMMAND,
                            Key::S,
                        ));
                        if ui
                            .add(egui::Button::new("Save all").shortcut_text(save_shortcut))
                            .on_hover_text("Save edited levels to the project asset folder")
                            .clicked()
                        {
                            ui.close();
                            self.save();
                        }
                        if ui
                            .button("Export game files…")
                            .on_hover_text("Save and repack assets into a game directory")
                            .clicked()
                        {
                            ui.close();
                            self.project.finish();
                            self.dialog = Some(Dialog::Export);
                        }
                        ui.separator();
                        if ui
                            .button("Reload from disk…")
                            .on_hover_text("Reload the project asset files")
                            .clicked()
                        {
                            ui.close();
                            self.dialog = Some(Dialog::Reload);
                        }
                    });
                    ui.menu_button("View", |ui| {
                        ui.set_min_width(180.0);
                        ui.checkbox(&mut self.show_spawns, "Monsters")
                            .on_hover_text("Show monster spawn icons. Hover a cell for spawn IDs, types and facing.");
                        ui.checkbox(&mut self.show_triggers, "Scripts")
                            .on_hover_text("Show script binding icons. Hover a cell for bytecode offsets and flags.");
                        ui.checkbox(&mut self.show_ids, "Wall IDs")
                            .on_hover_text("Show wall IDs on the map");
                        ui.separator();
                        if ui
                            .checkbox(&mut self.show_preview, "Preview")
                            .on_hover_text("Show or hide the cell preview")
                            .changed()
                            && self.show_preview
                        {
                            self.preview.minimized = false;
                            ui.ctx().request_repaint();
                        }
                    });
                    ui.menu_button("Help", |ui| {
                        if ui.button("Editor help").clicked() {
                            ui.close();
                            self.dialog = Some(Dialog::Help);
                        }
                    });
                });
            });
    }
    fn header(&mut self, ui: &mut egui::Ui) {
        let header = egui::Panel::top("header")
            .exact_size(78.0)
            .frame(frame())
            .show(ui, |ui| {
                ui.style_mut().interaction.selectable_labels = false;
                ui.horizontal(|ui| {
                    let (rect, _) = ui.allocate_exact_size(Vec2::splat(40.0), egui::Sense::hover());
                    let p = ui.painter();
                    p.rect_filled(rect, 9, ACCENT.gamma_multiply(0.12));
                    let c = rect.center();
                    let a = ACCENT;
                    p.line_segment(
                        [c + Vec2::new(-11.0, -11.0), c + Vec2::new(11.0, -11.0)],
                        (2.0, a),
                    );
                    p.line_segment(
                        [c + Vec2::new(-11.0, -11.0), c + Vec2::new(-11.0, 11.0)],
                        (2.0, a),
                    );
                    p.line_segment(
                        [c + Vec2::new(-11.0, 11.0), c + Vec2::new(11.0, 11.0)],
                        (2.0, a),
                    );
                    p.line_segment(
                        [c + Vec2::new(0.0, 0.0), c + Vec2::new(11.0, 0.0)],
                        (2.0, a),
                    );
                    p.line_segment([c, c + Vec2::new(0.0, 11.0)], (2.0, a));
                    ui.vertical(|ui| {
                        ui.label(RichText::new("Darkmoon Studio").size(23.0).strong());
                        small(ui, "Eye of the Beholder II · Level editor");
                    });
                    let actions = ui.with_layout(Layout::right_to_left(Align::Center), |ui| {
                        window::controls(ui);
                        ui.add_space(8.0);
                        if self.test_game.is_some() {
                            if ui.button("Stop test").on_hover_text("Close the test game and discard its temporary saves").clicked() {
                                match self.test_game.as_mut().unwrap().stop() {
                                    Ok(()) => {
                                        self.test_game = None;
                                        self.status = "Test stopped. Your editor changes are ready to continue.".into();
                                    }
                                    Err(e) => self.fail(format!("Could not stop test: {e:#}")),
                                }
                            }
                        } else if ui.add_enabled(self.test_job.is_none(), egui::Button::new(RichText::new(
                            if self.test_job.is_some() { "Preparing…" } else { "Play from here" }
                        ).color(BG).strong()).fill(ACCENT).corner_radius(6)).on_hover_text("Test current edits at the start point and preview facing, using the quick-start party with spare +2 weapons, extra-healing potions, and rations in their backpacks. Use Start point (P) to place it. Unsaved edits are included; test saves are temporary.").clicked() {
                            self.play_from_here();
                            ui.ctx().request_repaint();
                        }
                        let n = self.project.dirty_count() + usize::from(self.pending_text());
                        ui.label(
                            RichText::new(if n == 0 {
                                "All changes saved".into()
                            } else {
                                format!("{n} unsaved")
                            })
                            .size(12.0)
                            .color(if n == 0 { MUTED } else { AMBER }),
                        );
                    });
                    actions.response.rect
                })
                .inner
            });
        window::drag(ui, header.response.rect, header.inner);
        self.main_menu(ui);
    }
    fn footer(&mut self, ui: &mut egui::Ui) {
        egui::Panel::bottom("status")
            .exact_size(31.0)
            .frame(
                Frame::NONE
                    .fill(PANEL)
                    .inner_margin(Margin::symmetric(16, 7)),
            )
            .show(ui, |ui| {
                ui.horizontal(|ui| {
                    small(ui, self.status.clone());
                    ui.with_layout(Layout::right_to_left(Align::Center), |ui| {
                        small(ui, "Wheel: pan · Shift: horizontal · Ctrl: zoom · F: fit");
                    });
                });
            });
    }
    fn sidebar(&mut self, ui: &mut egui::Ui) {
        egui::Panel::left("levels")
            .exact_size(210.0)
            .frame(frame())
            .show(ui, |ui| {
                ui.horizontal(|ui| {
                    ui.label(RichText::new("Levels").size(18.0).strong());
                    badge(ui, self.project.areas.len().to_string(), MUTED);
                });
                ui.add_space(5.0);
                ui.add(
                    egui::TextEdit::singleline(&mut self.search)
                        .hint_text("Filter levels…")
                        .desired_width(f32::INFINITY),
                );
                ui.add_space(8.0);
                let filter = self.search.to_lowercase();
                let mut chosen = None;
                let areas: Vec<_> = self
                    .project
                    .areas
                    .iter()
                    .filter_map(|a| {
                        let l = self.project.location(a.id, a.sections[0]).ok()?;
                        let name = model::title(a.id);
                        let search =
                            format!("{} {:02} {name} {} {}", a.id, a.id, l.map, l.graphics)
                                .to_lowercase();
                        if !search.contains(&filter) {
                            return None;
                        }
                        Some((a.id, name.to_owned(), l.map, self.project.area_dirty(a)))
                    })
                    .collect();
                egui::ScrollArea::vertical()
                    .id_salt("area-list")
                    .max_height((ui.available_height() - 94.0).max(100.0))
                    .auto_shrink([false, false])
                    .show(ui, |ui| {
                        for (id, title, map, dirty) in areas {
                            let selected = id == self.area;
                            let (rect, response) = ui.allocate_exact_size(
                                Vec2::new(ui.available_width(), 39.0),
                                egui::Sense::click(),
                            );
                            if selected || response.hovered() {
                                ui.painter().rect_filled(
                                    rect,
                                    6,
                                    if selected {
                                        Color32::from_rgb(43, 61, 52)
                                    } else {
                                        CARD
                                    },
                                );
                            }
                            if selected {
                                ui.painter().rect_filled(
                                    egui::Rect::from_min_size(
                                        rect.min + Vec2::new(0.0, 7.0),
                                        Vec2::new(3.0, 25.0),
                                    ),
                                    2,
                                    ACCENT,
                                );
                            }
                            ui.painter().text(
                                rect.min + Vec2::new(12.0, 11.0),
                                egui::Align2::LEFT_TOP,
                                format!("{id:02}"),
                                FontId::monospace(13.0),
                                if selected { ACCENT } else { MUTED },
                            );
                            ui.painter().text(
                                rect.min + Vec2::new(42.0, 11.0),
                                egui::Align2::LEFT_TOP,
                                title,
                                FontId::proportional(14.0),
                                if selected { ACCENT } else { TEXT },
                            );
                            if dirty {
                                ui.painter().circle_filled(
                                    rect.right_center() - Vec2::new(8.0, 0.0),
                                    3.0,
                                    AMBER,
                                );
                            }
                            if response
                                .on_hover_text(format!("Area {id:02} · {map}.maz"))
                                .clicked()
                            {
                                chosen = Some(id);
                            }
                        }
                    });
                if let Some(id) = chosen {
                    self.change_area(id);
                }
            });
    }
    fn workspace(&mut self, ui: &mut egui::Ui) {
        egui::CentralPanel::default()
            .frame(Frame::NONE.fill(BG).inner_margin(16))
            .show(ui, |ui| {
                ui.horizontal(|ui| {
                    let l = self.location();
                    ui.label(RichText::new(model::title(l.area)).size(23.0).strong());
                    badge(ui, format!("Area {:02}", l.area), MUTED);
                    let sections = self
                        .project
                        .areas
                        .iter()
                        .find(|a| a.id == self.area)
                        .unwrap()
                        .sections
                        .clone();
                    if sections.len() > 1 {
                        let mut section = self.section;
                        egui::ComboBox::from_id_salt("section")
                            .selected_text(format!("Sublevel {}", self.section + 1))
                            .width(100.0)
                            .show_ui(ui, |ui| {
                                for s in sections {
                                    ui.selectable_value(
                                        &mut section,
                                        s,
                                        format!("Sublevel {}", s + 1),
                                    );
                                }
                            });
                        if section != self.section {
                            self.change_location(self.area, section);
                            ui.ctx().request_repaint();
                        }
                    }
                    ui.with_layout(Layout::right_to_left(Align::Center), |ui| {
                        if ui
                            .button("Fit")
                            .on_hover_text("Fit map to canvas · F")
                            .clicked()
                        {
                            self.fit = true;
                        }
                        if ui.button("+").clicked() {
                            self.zoom = (self.zoom * 1.2).min(64.0);
                        }
                        ui.label(
                            RichText::new(format!("{}%", (self.zoom / 20.0 * 100.0).round()))
                                .small()
                                .color(MUTED),
                        );
                        if ui.button("−").clicked() {
                            self.zoom = (self.zoom / 1.2).max(7.0);
                        }
                    });
                });
                let l = self.location();
                let shared = self.project.shared_areas(&l.map);
                let extra = if shared.len() > 1 {
                    format!(
                        " · Shared by areas {}",
                        shared
                            .iter()
                            .map(|x| format!("{x:02}"))
                            .collect::<Vec<_>>()
                            .join(", ")
                    )
                } else {
                    String::new()
                };
                small(ui, format!("{} · 32 × 32 cells{}", l.map, extra));
                ui.add_space(8.0);
                ui.horizontal(|ui| {
                    if icons::button(
                        ui,
                        icons::Icon::Undo,
                        "Undo",
                        self.project.undo_label().is_some(),
                    )
                    .on_hover_text(format!(
                        "Undo: {} · Ctrl+Z",
                        self.project.undo_label().unwrap_or("nothing")
                    ))
                    .on_disabled_hover_text("Undo · Ctrl+Z · Nothing to undo")
                    .clicked()
                    {
                        self.undo();
                    }
                    if icons::button(
                        ui,
                        icons::Icon::Redo,
                        "Redo",
                        self.project.redo_label().is_some(),
                    )
                    .on_hover_text(format!(
                        "Redo: {} · Ctrl+Shift+Z / Ctrl+Y",
                        self.project.redo_label().unwrap_or("nothing")
                    ))
                    .on_disabled_hover_text("Redo · Ctrl+Shift+Z / Ctrl+Y · Nothing to redo")
                    .clicked()
                    {
                        self.redo();
                    }
                    ui.with_layout(Layout::right_to_left(Align::Center), |ui| {
                        small(ui, format!("{} · {}", self.tool.key(), self.tool.label()));
                    });
                });
                ui.add_space(5.0);
                ui.horizontal_top(|ui| {
                    self.tool_bar(ui);
                    self.canvas(ui);
                });
            });
    }
    fn tool_bar(&mut self, ui: &mut egui::Ui) {
        let height = ui.available_height();
        ui.allocate_ui_with_layout(
            Vec2::new(CONTROL_HEIGHT + 18.0, height),
            Layout::top_down(Align::Min),
            |ui| {
                Frame::NONE
                    .fill(PANEL)
                    .stroke(Stroke::new(1.0, BORDER))
                    .corner_radius(8)
                    .inner_margin(8)
                    .show(ui, |ui| {
                        ui.set_width(CONTROL_HEIGHT);
                        ui.set_min_height((height - 18.0).max(0.0));
                        for tool in [
                            Tool::Start,
                            Tool::Select,
                            Tool::Wall,
                            Tool::Erase,
                            Tool::Room,
                            Tool::Move,
                        ] {
                            let selected = self.tool == tool;
                            let response = ui
                                .add_sized(
                                    Vec2::splat(CONTROL_HEIGHT),
                                    egui::Button::selectable(selected, "")
                                        .sense(egui::Sense::CLICK),
                                )
                                .on_hover_text(if tool == Tool::Start {
                                    "Start point · P · Click a cell to move the preview and playtest start. Ctrl+Click works with any tool.".to_owned()
                                } else if tool == Tool::Room {
                                    "Carve · R · Excavate one tile and join adjacent floor. Walls against solid tiles stay in place. Click or drag across cells.".to_owned()
                                } else {
                                    format!("{} · {}", tool.label(), tool.key())
                                });
                            response.widget_info(|| {
                                egui::WidgetInfo::selected(
                                    egui::Role::Button,
                                    ui.is_enabled(),
                                    selected,
                                    tool.label(),
                                )
                            });
                            icons::tool(
                                ui.painter(),
                                egui::Rect::from_center_size(response.rect.center(), Vec2::splat(20.0)),
                                tool,
                                if selected { ACCENT } else { TEXT },
                            );
                            if response.clicked() {
                                self.project.finish();
                                self.tool = tool;
                            }
                        }
                    });
            },
        );
    }
    fn inspector(&mut self, ui: &mut egui::Ui) {
        egui::Panel::right("inspector")
            .exact_size(302.0)
            .frame(frame())
            .show(ui, |ui| {
                ui.horizontal(|ui| {
                    ui.label(RichText::new("Inspector").size(18.0).strong());
                    ui.with_layout(Layout::right_to_left(Align::Center), |ui| {
                        badge(
                            ui,
                            format!("{}, {}", self.selected % SIZE, self.selected / SIZE),
                            ACCENT,
                        );
                    });
                });
                ui.add_space(7.0);
                ui.horizontal(|ui| {
                    ui.selectable_value(&mut self.tab, Tab::Cell, "Cell");
                    ui.selectable_value(&mut self.tab, Tab::Monsters, "Monsters");
                    ui.selectable_value(&mut self.tab, Tab::Data, "Level data");
                });
                ui.separator();
                egui::ScrollArea::vertical()
                    .id_salt("inspector-scroll")
                    .show(ui, |ui| {
                        ui.set_min_width(ui.available_width());
                        match self.tab {
                            Tab::Cell => self.cell_inspector(ui),
                            Tab::Monsters => self.monsters(ui),
                            Tab::Data => self.level_data(ui),
                        }
                    });
            });
    }
    fn cell_inspector(&mut self, ui: &mut egui::Ui) {
        let l = self.location();
        if let Some(binding) = self
            .selected_binding
            .and_then(|index| self.project.scripts[&l.script].value["bindings"].get(index))
            .cloned()
        {
            Frame::NONE
                .fill(CARD)
                .corner_radius(7)
                .inner_margin(10)
                .show(ui, |ui| {
                    ui.label(
                        RichText::new("Selected script trigger")
                            .strong()
                            .color(PURPLE),
                    );
                    let cell = binding["block"].as_u64().unwrap_or(0) as usize;
                    small(
                        ui,
                        format!("Cell {}, {} · Block {cell}", cell % SIZE, cell / SIZE),
                    );
                    small(
                        ui,
                        format!(
                            "Bytecode 0x{:04X} · Flags 0x{:02X}",
                            binding["bytecode_offset"].as_u64().unwrap_or(0),
                            binding["flags"].as_u64().unwrap_or(0)
                        ),
                    );
                    if ui
                        .button("Locate cell")
                        .on_hover_text("Select this trigger's cell for inspection")
                        .clicked()
                    {
                        self.selected = cell.min(SIZE * SIZE - 1);
                        ui.ctx().request_repaint();
                    }
                    if ui.button("Edit event steps…").clicked() {
                        self.open_event(&l.script, self.selected_binding.unwrap());
                    }
                });
            ui.add_space(8.0);
        }
        let walls = self.project.maps[&l.map].walls[self.selected];
        ui.add_space(5.0);
        ui.label(
            RichText::new(if self.selected_binding.is_some() {
                "Preview cell walls"
            } else {
                "Cell walls"
            })
            .strong(),
        );
        small(ui, format!("Block {} · {}", self.selected, l.map));
        ui.add_space(4.0);
        for (dir, name) in model::DIRECTIONS.iter().enumerate() {
            ui.horizontal(|ui| {
                let (r, _) = ui.allocate_exact_size(Vec2::splat(8.0), egui::Sense::hover());
                ui.painter()
                    .circle_filled(r.center(), 4.0, wall_color(walls[dir]));
                ui.add_sized([65.0, CONTROL_HEIGHT], egui::Label::new(*name));
                let mut value = walls[dir];
                if ui
                    .add(egui::DragValue::new(&mut value).range(0..=255))
                    .changed()
                {
                    self.project.begin("Change cell wall");
                    self.project
                        .paint(&l.map, self.selected, dir, value, self.linked);
                    self.project.finish();
                }
                if ui
                    .button("Use")
                    .on_hover_text("Use this wall ID as the brush")
                    .clicked()
                {
                    self.brush = value;
                    self.tool = Tool::Wall;
                }
            });
        }
        ui.add_space(7.0);
        ui.checkbox(&mut self.linked,"Paint both sides of an edge").on_hover_text("Also update the adjacent cell's opposite wall. Existing one-sided walls are preserved until edited.");
        ui.horizontal(|ui| {
            if ui.button("Copy cell").on_hover_text("Ctrl+C").clicked() {
                self.copy_cell();
            }
            if ui
                .add_enabled(self.clipboard.is_some(), egui::Button::new("Paste"))
                .on_hover_text("Ctrl+V")
                .clicked()
            {
                self.paste_cell();
            }
        });
        ui.add_space(9.0);
        ui.separator();
        ui.add_space(3.0);
        ui.label(RichText::new("Wall palette").strong());
        small(ui, "Choose a graphic, then paint a cell edge.");
        ui.horizontal(|ui| {
            small(ui, "Brush ID");
            ui.add(egui::DragValue::new(&mut self.brush).range(0..=255));
        });
        let mut ids = self.project.wall_ids(&l);
        if !ids.contains(&self.brush) {
            ids.push(self.brush);
            ids.sort_unstable();
        }
        let thumbnails = self
            .preview
            .wall_thumbnails(ui.ctx(), &self.project, &l, &ids);
        let width = ((ui.available_width() - 8.0) / 2.0).floor();
        ui.add_space(5.0);
        egui::Grid::new("wall-palette")
            .num_columns(2)
            .spacing(Vec2::splat(8.0))
            .show(ui, |ui| {
                for (index, &id) in ids.iter().enumerate() {
                    if preview::wall_tile(ui, id, &thumbnails[&id], self.brush == id, width) {
                        self.brush = id;
                        self.tool = if id == 0 { Tool::Erase } else { Tool::Wall };
                    }
                    if index % 2 == 1 {
                        ui.end_row();
                    }
                }
            });
        ui.add_space(10.0);
        self.edge_preview(ui, walls);
        let bindings: Vec<_> = self.project.scripts[&l.script].value["bindings"]
            .as_array()
            .map(|b| {
                b.iter()
                    .filter(|b| b["block"].as_u64() == Some(self.selected as u64))
                    .cloned()
                    .collect()
            })
            .unwrap_or_default();
        if !bindings.is_empty() {
            ui.add_space(12.0);
            badge(ui, "Script trigger", PURPLE);
            small(
                ui,
                "This cell has scripted behavior. Its trigger remains attached when you edit walls.",
            );
            for (index, binding) in self.project.scripts[&l.script].value["bindings"]
                .as_array()
                .unwrap()
                .clone()
                .iter()
                .enumerate()
            {
                if binding["block"].as_u64() == Some(self.selected as u64)
                    && ui.button("Edit event steps…").clicked()
                {
                    self.open_event(&l.script, index);
                }
            }
        }
        let spawns: Vec<_> = self
            .project
            .spawns_at(&l)
            .into_iter()
            .filter(|s| s.block == self.selected)
            .collect();
        for spawn in spawns {
            ui.add_space(5.0);
            if ui
                .button(format!("Inspect monster {} →", spawn.slot))
                .clicked()
            {
                self.selected_spawn = Some(spawn.slot);
                self.selected_binding = None;
                self.tab = Tab::Monsters;
            }
        }
    }
    fn edge_preview(&self, ui: &mut egui::Ui, walls: [u8; 4]) {
        Frame::NONE
            .fill(BG)
            .corner_radius(7)
            .inner_margin(10)
            .show(ui, |ui| {
                let (rect, _) = ui.allocate_exact_size(
                    Vec2::new(ui.available_width(), 94.0),
                    egui::Sense::hover(),
                );
                let center = rect.center();
                let r = egui::Rect::from_center_size(center, Vec2::splat(56.0));
                for (dir, id) in walls.into_iter().enumerate() {
                    let [a, b] = canvas::edge(r, dir);
                    ui.painter().line_segment(
                        [a, b],
                        (
                            if id == 0 { 1.0 } else { 3.0 },
                            wall_color(id).gamma_multiply(if id == 0 { 0.3 } else { 1.0 }),
                        ),
                    );
                }
                ui.painter().text(
                    center,
                    egui::Align2::CENTER_CENTER,
                    format!("{}", self.selected),
                    FontId::monospace(13.0),
                    MUTED,
                );
            });
    }
    fn monsters(&mut self, ui: &mut egui::Ui) {
        let l = self.location();
        let spawns = self.project.spawns_at(&l);
        ui.add_space(5.0);
        ui.label(RichText::new("Initial monster spawns").strong());
        small(ui, "Select a spawn to move it or adjust its properties.");
        ui.add_space(5.0);
        if spawns.is_empty() {
            small(
                ui,
                "This sublevel has no initial spawns with loaded monster shapes.",
            );
            return;
        }
        if self
            .selected_spawn
            .is_none_or(|id| !spawns.iter().any(|s| s.slot == id))
        {
            self.selected_spawn = Some(spawns[0].slot);
        }
        let id = self.selected_spawn.unwrap();
        let spawn = spawns.iter().find(|s| s.slot == id).unwrap();
        egui::ComboBox::from_id_salt("spawn-selector")
            .width(245.0)
            .selected_text(format!("Spawn {id:02} · Type {}", spawn.kind))
            .show_ui(ui, |ui| {
                for s in &spawns {
                    if ui
                        .selectable_value(
                            &mut self.selected_spawn,
                            Some(s.slot),
                            format!(
                                "Spawn {:02} · Type {} · {},{}",
                                s.slot,
                                s.kind,
                                s.block % 32,
                                s.block / 32
                            ),
                        )
                        .changed()
                    {
                        self.selected_binding = None;
                    }
                }
            });
        ui.horizontal(|ui| {
            if ui.button("Locate").clicked() {
                self.selected = spawn.block.min(1023);
                ui.ctx().request_repaint();
            }
            if ui
                .add(egui::Button::selectable(
                    self.tool == Tool::Move,
                    "Move on map",
                ))
                .clicked()
            {
                self.tool = Tool::Move;
                self.selected = spawn.block.min(1023);
            }
        });
        if self.tool == Tool::Move {
            small(ui, "Click a cell to place the selected spawn.");
        }
        ui.add_space(5.0);
        if let Some(shape) = self.project.monster_shape(&l, spawn) {
            let sheet = shape.sheet.to_owned();
            self.sprite_preview(ui, &sheet);
        }
        let prefix = format!("spawn[{id}].");
        let indices: Vec<_> = self
            .project
            .fields(&l.script)
            .iter()
            .enumerate()
            .filter(|(_, f)| f["name"].as_str().is_some_and(|n| n.starts_with(&prefix)))
            .map(|(i, _)| i)
            .collect();
        for index in indices {
            self.field_editor(ui, &l.script, index, Some(&prefix));
        }
        ui.add_space(9.0);
        ui.separator();
        ui.label(RichText::new(format!("Type {} statistics", spawn.kind)).strong());
        small(
            ui,
            "Changes affect every monster using this type in this sublevel.",
        );
        let prefix = format!("sublevel[{}].monster_type[{}].", l.section, spawn.kind);
        let indices: Vec<_> = self
            .project
            .fields(&l.script)
            .iter()
            .enumerate()
            .filter(|(_, f)| f["name"].as_str().is_some_and(|n| n.starts_with(&prefix)))
            .map(|(i, _)| i)
            .collect();
        for index in indices {
            self.field_editor(ui, &l.script, index, Some(&prefix));
        }
    }
    fn sprite_preview(&mut self, ui: &mut egui::Ui, sheet: &str) {
        if !self.textures.contains_key(sheet) {
            let path = self
                .project
                .root
                .join(format!("sprites/{sheet}/group-0-frame-0.png"));
            if let Ok(file) = std::fs::File::open(path) {
                let d = png::Decoder::new(std::io::BufReader::new(file));
                if let Ok(mut r) = d.read_info() {
                    let pal = r.info().palette.clone();
                    if let Some(size) = r.output_buffer_size() {
                        let mut b = vec![0; size];
                        if let Ok(f) = r.next_frame(&mut b)
                            && f.color_type == png::ColorType::Indexed
                            && let Some(pal) = pal
                        {
                            let rgba: Vec<u8> = b[..f.buffer_size()]
                                .iter()
                                .flat_map(|&c| {
                                    let i = c as usize * 3;
                                    [pal[i], pal[i + 1], pal[i + 2], if c == 0 { 0 } else { 255 }]
                                })
                                .collect();
                            let image = egui::ColorImage::from_rgba_unmultiplied(
                                [f.width as usize, f.height as usize],
                                &rgba,
                            );
                            let handle =
                                ui.ctx()
                                    .load_texture(sheet, image, egui::TextureOptions::NEAREST);
                            self.textures.insert(sheet.into(), handle);
                        }
                    }
                }
            }
        }
        if let Some(texture) = self.textures.get(sheet) {
            Frame::NONE
                .fill(BG)
                .corner_radius(7)
                .inner_margin(12)
                .show(ui, |ui| {
                    ui.horizontal(|ui| {
                        ui.image((texture.id(), Vec2::new(44.0, 76.0)));
                        ui.vertical(|ui| {
                            ui.label(RichText::new(sheet).strong());
                            small(ui, "Original sprite");
                        });
                    });
                });
            ui.add_space(5.0);
        }
    }
    fn level_data(&mut self, ui: &mut egui::Ui) {
        let l = self.location();
        ui.add_space(5.0);
        ui.label(RichText::new("Decoded level properties").strong());
        small(
            ui,
            "Adjust monster types, timers, wall mappings, and resources.",
        );
        ui.add(
            egui::TextEdit::singleline(&mut self.field_search)
                .hint_text("Find a property…")
                .desired_width(f32::INFINITY),
        );
        ui.add_space(7.0);
        let prefix = format!("sublevel[{}].", l.section);
        let filter = self.field_search.to_lowercase();
        let mut groups = BTreeMap::<String, Vec<usize>>::new();
        for (i, f) in self.project.fields(&l.script).iter().enumerate() {
            let name = f["name"].as_str().unwrap_or("");
            if let Some(rest) = name.strip_prefix(&prefix) {
                if !filter.is_empty() && !rest.to_lowercase().contains(&filter) {
                    continue;
                }
                let group = rest.split('.').next().unwrap().to_owned();
                groups.entry(group).or_default().push(i);
            }
        }
        for (group, indices) in groups {
            egui::CollapsingHeader::new(group.replace('_', " "))
                .id_salt(format!("{}:{}:{group}", l.script, l.section))
                .default_open(!filter.is_empty())
                .show(ui, |ui| {
                    for index in indices {
                        self.field_editor(ui, &l.script, index, Some(&prefix));
                    }
                });
        }
        ui.add_space(8.0);
        small(
            ui,
            "Drag script icons in Inspect mode to relocate their trigger cells. Script instructions and embedded block references are preserved.",
        );
    }
    fn field_editor(
        &mut self,
        ui: &mut egui::Ui,
        script: &str,
        index: usize,
        prefix: Option<&str>,
    ) {
        let f = self.project.fields(script)[index].clone();
        let full = f["name"].as_str().unwrap_or("");
        let label = full
            .strip_prefix(prefix.unwrap_or(""))
            .unwrap_or(full)
            .replace('_', " ");
        ui.push_id((script, index), |ui| {
            if f["encoding"] == "string13" {
                small(ui, label);
                let key = format!("{script}:{index}");
                let buf = self
                    .text_buffers
                    .entry(key.clone())
                    .or_insert_with(|| f["value"].as_str().unwrap_or("").into());
                let r = ui.add(egui::TextEdit::singleline(buf).desired_width(f32::INFINITY));
                if r.lost_focus() || (r.has_focus() && ui.input(|i| i.key_pressed(Key::Enter))) {
                    let value = self.text_buffers[&key].clone();
                    if value != f["value"].as_str().unwrap_or("") {
                        self.set_field(script, index, json!(value), "Change level resource");
                    }
                }
            } else {
                ui.horizontal(|ui| {
                    ui.add_sized(
                        [ui.available_width() - 82.0, CONTROL_HEIGHT],
                        egui::Label::new(RichText::new(label).size(12.5)).wrap(),
                    );
                    let mut n = f["value"].as_i64().unwrap_or(0);
                    let (min, max) = model::field_range(&f);
                    if ui
                        .add(egui::DragValue::new(&mut n).range(min..=max).speed(0.2))
                        .changed()
                    {
                        self.set_field(script, index, json!(n), "Change level property");
                    }
                });
            }
        });
    }
    fn dialogs(&mut self, ctx: &egui::Context) {
        if self.error.is_some() {
            egui::Modal::new(egui::Id::unique("error")).show(ctx, |ui| {
                ui.set_width(440.0);
                ui.heading("Could not complete the action");
                ui.add_space(8.0);
                ui.label(self.error.as_ref().unwrap());
                ui.add_space(8.0);
                if ui.button("OK").clicked() {
                    self.error = None;
                }
            });
            return;
        }
        let mut close = false;
        if let Some(dialog) = self.dialog {
            egui::Modal::new(egui::Id::unique("dialog")).show(ctx, |ui| {
                ui.set_width(480.0);
                match dialog {
                    Dialog::Help => {
                        ui.heading("Make Darkmoon your own");
                        ui.label("Select an area on the left, choose a tool, and edit directly on the map.");
                        ui.add_space(8.0);
                        for (key, description) in [
                            ("V", "Inspect cells; drag entity icons to move them"),
                            ("P", "Place the preview and playtest start point"),
                            ("Ctrl + click", "Place the start point with any tool"),
                            ("B / X", "Paint / erase the nearest cell edge"),
                            ("W / S", "Walk forward / backward, respecting walls"),
                            ("A / D · Q / E", "Sidestep left / right · turn left / right"),
                            ("R", "Excavate one tile; join floor and keep solid neighbors"),
                            ("M", "Move the selected existing monster spawn"),
                            ("Alt + click", "Sample a wall ID"),
                            ("Middle-drag / Space-drag", "Pan the map"),
                            ("Wheel / Shift+wheel", "Pan vertically / horizontally"),
                            ("Ctrl+wheel / F", "Zoom around the pointer / fit the map"),
                            ("Ctrl+Z / Ctrl+Y", "Undo / redo · 100 actions retained"),
                            ("Ctrl+C / Ctrl+V", "Copy / paste a cell's four walls"),
                            ("Ctrl+S / Ctrl+Q", "Save all / close the editor"),
                        ] {
                            ui.horizontal(|ui| {
                                ui.add_sized([190.0,24.0], egui::Label::new(RichText::new(key).color(ACCENT)));
                                ui.label(description);
                            });
                        }
                        ui.add_space(8.0);
                        ui.label("View contains Monsters, Scripts, Wall IDs, and Preview visibility toggles. Enable Preview to reopen it expanded. Its title bar has minimize/restore and close controls. Drag the title bar to move it; double-click to return it to the bottom-right corner.");
                        ui.label("File contains Save all, Export game files, and Reload from disk. Help contains Editor help. Save writes to your editable asset folder. Export game files builds a separate runtime folder. The editor runs natively on Linux.");
                        ui.label("Use Start point (P) or Ctrl+Click a cell with any tool to place the preview and playtest start. Inspecting cells and editing walls or entities keeps it in place. WASD walks from that point; Q/E changes facing. Play from here starts the full game there with the quick-start party, spare +2 weapons, extra-healing potions, and rations in their backpacks, and includes unsaved edits. Stop test closes the game; temporary test saves are discarded.");
                        if ui.button("Start editing").clicked() { close=true; }
                    }
                    Dialog::Reload => {
                        ui.heading("Reload the project?");
                        ui.label("This reads the asset files again. Unsaved edits and undo history will be discarded.");
                        ui.horizontal(|ui| {
                            if ui.button("Cancel").clicked() { close=true; }
                            if ui.button("Reload").clicked() {
                                match Project::open(&self.project.root) {
                                    Ok(p) => {
                                        self.project=p;
                                        if !self.project.areas.iter().any(|a|a.id==self.area) { self.area=self.project.areas[0].id; }
                                        let area=self.project.areas.iter().find(|a|a.id==self.area).unwrap();
                                        if !area.sections.contains(&self.section) { self.section=area.sections[0]; }
                                        self.text_buffers.clear();
                                        self.textures.clear();
                                        self.preview.clear();
                                        self.selected_spawn=None;
                                        self.selected_binding=None;
                                        self.script_editor=None;
                                        self.fit=true;
                                        self.status="Reloaded project from disk.".into();
                                    }
                                    Err(e) => self.fail(e),
                                }
                                close=true;
                            }
                        });
                    }
                    Dialog::Export => {
                        ui.heading("Export game files");
                        ui.label("Save your changes and build a separate game folder with the edited assets.");
                        ui.add_space(8.0);
                        small(ui,"Destination folder");
                        ui.add(egui::TextEdit::singleline(&mut self.export_path).desired_width(f32::INFINITY));
                        ui.add_space(5.0);
                        small(ui,"Existing saves in the destination are preserved.");
                        ui.horizontal(|ui| {
                            if ui.button("Cancel").clicked() { close=true; }
                            if ui.button("Save & export").clicked() && self.save() {
                                let root=self.project.root.clone();
                                let out=PathBuf::from(&self.export_path);
                                let (tx,rx)=mpsc::channel();
                                self.job=Some(rx);
                                std::thread::spawn(move || {
                                    let result=crate::assets::pack(&root,&out)
                                        .map(|_|format!("Exported game files to {}",out.display()))
                                        .map_err(|e|format!("{e:#}"));
                                    let _=tx.send(result);
                                });
                                close=true;
                            }
                        });
                    }
                    Dialog::Close => {
                        ui.heading("Save before closing?");
                        ui.label("Your project has unsaved changes.");
                        ui.horizontal(|ui| {
                            if ui.button("Keep editing").clicked() { close=true; }
                            if ui.button("Discard edits").clicked() {
                                self.allow_close=true;
                                ctx.send_viewport_cmd(egui::ViewportCommand::Close);
                            }
                            if ui.button("Save & close").clicked() && self.save() {
                                self.allow_close=true;
                                ctx.send_viewport_cmd(egui::ViewportCommand::Close);
                            }
                        });
                    }
                }
            });
        }
        if close {
            self.dialog = None;
        }
        if self.job.is_some() {
            egui::Modal::new(egui::Id::unique("export-progress")).show(ctx, |ui| {
                ui.set_width(340.0);
                ui.horizontal(|ui| {
                    ui.spinner();
                    ui.heading("Exporting game files");
                });
                ui.label("Your edited assets are being rebuilt.");
            });
            ctx.request_repaint_after(Duration::from_millis(80));
        }
    }
}
impl Drop for Editor {
    fn drop(&mut self) {
        self.test_game = None;
        self.test_job = None;
        // Let playtest preparation finish cleaning its private workspace before
        // process exit terminates background threads. Dropping the receiver
        // above also discards any prepared game still waiting in the channel.
        if let Some(worker) = self.test_worker.take() {
            let _ = worker.join();
        }
    }
}
impl eframe::App for Editor {
    fn ui(&mut self, ui: &mut egui::Ui, _frame: &mut eframe::Frame) {
        let ctx = ui.ctx().clone();
        self.poll_playtest(&ctx);
        if let Some(rx) = &self.job
            && let Ok(result) = rx.try_recv()
        {
            self.job = None;
            match result {
                Ok(message) => self.status = message,
                Err(error) => self.fail(error),
            }
        }
        if ctx.input(|i| i.viewport().close_requested()) && !self.allow_close {
            self.project.finish();
            if self.job.is_some() {
                ctx.send_viewport_cmd(egui::ViewportCommand::CancelClose);
            } else if self.project.dirty_count() > 0 || self.pending_text() {
                ctx.send_viewport_cmd(egui::ViewportCommand::CancelClose);
                self.dialog = Some(Dialog::Close);
            }
        }
        self.shortcuts(&ctx);
        self.header(ui);
        self.footer(ui);
        self.sidebar(ui);
        self.inspector(ui);
        self.workspace(ui);
        window::resize(ui);
        self.event_window(&ctx);
        self.dialogs(&ctx);
    }
}
