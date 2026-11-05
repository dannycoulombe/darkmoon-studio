use super::*;
use egui::{Align2, Pos2, Rect, Sense, StrokeKind};

pub fn edge(r: Rect, dir: usize) -> [Pos2; 2] {
    match dir {
        0 => [r.left_top(), r.right_top()],
        1 => [r.right_top(), r.right_bottom()],
        2 => [r.left_bottom(), r.right_bottom()],
        _ => [r.left_top(), r.left_bottom()],
    }
}
fn hit(origin: Pos2, zoom: f32, p: Pos2) -> Option<(usize, usize)> {
    let v = (p - origin) / zoom;
    let x = v.x.floor() as i32;
    let y = v.y.floor() as i32;
    if !(0..32).contains(&x) || !(0..32).contains(&y) {
        return None;
    }
    let u = v.x.fract();
    let v = v.y.fract();
    let distances = [v, 1.0 - u, 1.0 - v, u];
    let dir = (0..4)
        .min_by(|a, b| distances[*a].total_cmp(&distances[*b]))
        .unwrap();
    Some((y as usize * 32 + x as usize, dir))
}
impl Editor {
    pub(super) fn canvas(&mut self, ui: &mut egui::Ui) {
        let size = ui.available_size();
        let (rect, response) = ui.allocate_exact_size(size, Sense::click_and_drag());
        let preview_movable = self.dialog.is_none() && self.error.is_none() && self.job.is_none();
        // Resolve the panel's drag before processing map input so the overlay's
        // new location and captured drag both protect cells underneath it.
        let preview_rect = self
            .show_preview
            .then(|| self.preview.panel_rect(ui, rect, preview_movable));
        let painter = ui.painter_at(rect);
        painter.rect_filled(rect, 8, BG);
        painter.rect_stroke(rect, 8, Stroke::new(1.0, BORDER), StrokeKind::Inside);
        if self.fit {
            self.zoom = ((rect.width() - 64.0).min(rect.height() - 88.0) / 32.0).clamp(7.0, 48.0);
            self.pan = Vec2::ZERO;
            self.fit = false;
        }
        let mut origin =
            rect.center() - Vec2::splat(self.zoom * 16.0) + self.pan + Vec2::new(0.0, -4.0);
        let (
            pointer,
            pressed,
            secondary_pressed,
            down,
            secondary_down,
            middle,
            space,
            alt,
            ctrl,
            delta,
            scroll,
            zoom_delta,
        ) = ui.input(|i| {
            (
                i.pointer.hover_pos(),
                i.pointer.button_pressed(egui::PointerButton::Primary),
                i.pointer.button_pressed(egui::PointerButton::Secondary),
                i.pointer.button_down(egui::PointerButton::Primary),
                i.pointer.button_down(egui::PointerButton::Secondary),
                i.pointer.button_down(egui::PointerButton::Middle),
                i.key_down(Key::Space),
                i.modifiers.alt,
                i.modifiers.ctrl,
                i.pointer.delta(),
                // egui maps Shift+wheel to X and Ctrl+wheel to zoom_delta.
                i.smooth_scroll_delta,
                i.zoom_delta(),
            )
        });
        let over_preview = (self.show_preview && self.preview.panel_interacting)
            || pointer.is_some_and(|p| preview_rect.is_some_and(|r| r.contains(p)));
        if response.hovered()
            && !over_preview
            && self.entity_drag.is_none()
            && let Some(pointer) = pointer
        {
            self.pan += scroll;
            origin += scroll;
            if zoom_delta != 1.0 {
                let old = self.zoom;
                let next = (old * zoom_delta).clamp(7.0, 64.0);
                let local = (pointer - origin) / old;
                self.zoom = next;
                let new_base = rect.center() - Vec2::splat(next * 16.0) + Vec2::new(0.0, -4.0);
                self.pan = pointer - local * next - new_base;
                origin = new_base + self.pan;
            }
        }
        let panning = response.dragged()
            && !over_preview
            && self.entity_drag.is_none()
            && (middle || (down && space));
        if panning {
            self.pan += delta;
            origin += delta;
            ui.ctx().set_cursor_icon(egui::CursorIcon::Grabbing);
        }
        self.hover = pointer
            .filter(|p| rect.contains(*p) && !over_preview)
            .and_then(|p| hit(origin, self.zoom, p));
        let l = self.location();
        let entity_consumed = self.entity_input(ui, &l, origin, over_preview, panning);
        if !entity_consumed && self.dialog.is_none() && self.error.is_none() && self.job.is_none() {
            if let Some((cell, dir)) = self.hover {
                if (pressed || secondary_pressed) && !space && !middle {
                    let place_start =
                        !secondary_pressed && (ctrl || (self.tool == Tool::Start && !alt));
                    if !place_start {
                        self.selected = cell;
                    }
                    if place_start {
                        self.project.finish();
                        self.stroke = false;
                        self.preview.cell = cell;
                        self.status = format!(
                            "Start point at {}, {} · facing {}.",
                            cell % SIZE,
                            cell / SIZE,
                            model::DIRECTIONS[self.preview.facing]
                        );
                    } else if alt {
                        self.brush = self.project.maps[&l.map].walls[cell][dir];
                        self.tool = Tool::Wall;
                        self.status = format!("Sampled wall ID {}.", self.brush);
                    } else if self.tool == Tool::Select && !secondary_pressed {
                        self.selected_binding = None;
                        if let Some(s) = self.project.spawns_at(&l).iter().find(|s| s.block == cell)
                        {
                            self.selected_spawn = Some(s.slot);
                            self.tab = Tab::Monsters;
                        } else {
                            self.tab = Tab::Cell;
                        }
                    } else {
                        self.stroke = true;
                        self.project.begin(if secondary_pressed {
                            "Erase walls"
                        } else {
                            self.tool.label()
                        });
                    }
                }
                if self.stroke
                    && (down || secondary_down || pressed || secondary_pressed)
                    && !panning
                {
                    self.selected = cell;
                    let tool = if secondary_down || secondary_pressed {
                        Tool::Erase
                    } else {
                        self.tool
                    };
                    match tool {
                        Tool::Wall => {
                            self.project
                                .paint(&l.map, cell, dir, self.brush, self.linked)
                        }
                        Tool::Erase => self.project.paint(&l.map, cell, dir, 0, self.linked),
                        Tool::Room => self.project.carve(&l.map, cell),
                        Tool::Move => {
                            let spawns = self.project.spawns_at(&l);
                            let selected = self
                                .selected_spawn
                                .or_else(|| spawns.first().map(|s| s.slot));
                            if let Some(spawn) = spawns.iter().find(|s| Some(s.slot) == selected) {
                                self.selected_spawn = Some(spawn.slot);
                                self.tab = Tab::Monsters;
                                if let Err(e) = self.project.set_field(
                                    &l.script,
                                    spawn.block_field,
                                    json!(cell),
                                ) {
                                    self.fail(e);
                                }
                            } else {
                                self.status =
                                    "This sublevel has no visible initial monster spawns to move."
                                        .into();
                            }
                        }
                        Tool::Select | Tool::Start => {}
                    }
                }
                if response.hovered() && !panning {
                    ui.ctx().set_cursor_icon(if space {
                        egui::CursorIcon::Grab
                    } else if self.tool == Tool::Select && !ctrl {
                        egui::CursorIcon::Default
                    } else {
                        egui::CursorIcon::Crosshair
                    });
                }
            }
            if self.stroke && !down && !secondary_down {
                self.project.finish();
                self.stroke = false;
                if self.project.dirty_count() > 0 {
                    self.status = format!("{} edit ready. Ctrl+S to save.", self.tool.label());
                }
            }
        }
        let grid = Rect::from_min_size(origin, Vec2::splat(32.0 * self.zoom));
        let walls = &self.project.maps[&l.map].walls;
        for (cell, values) in walls.iter().enumerate() {
            let r = Rect::from_min_size(
                origin
                    + Vec2::new(
                        (cell % 32) as f32 * self.zoom,
                        (cell / 32) as f32 * self.zoom,
                    ),
                Vec2::splat(self.zoom),
            );
            if !r.intersects(rect) {
                continue;
            }
            let walkable = values.contains(&0);
            let fill = if walkable {
                Color32::from_rgb(31, 47, 45)
            } else {
                Color32::from_rgb(22, 31, 39)
            };
            painter.rect_filled(r.shrink(0.6), 1, fill);
            painter.rect_stroke(
                r,
                0,
                Stroke::new(0.5, Color32::from_rgb(35, 47, 55)),
                StrokeKind::Inside,
            );
            for (dir, &id) in values.iter().enumerate() {
                if id == 0 {
                    continue;
                }
                let points = edge(r.shrink(1.7), dir);
                painter.line_segment(
                    points,
                    Stroke::new(
                        if id <= 2 { 1.4 } else { 2.2 },
                        wall_color(id).gamma_multiply(if id <= 2 { 0.60 } else { 0.95 }),
                    ),
                );
                if self.show_ids && self.zoom >= 24.0 {
                    let middle = points[0] + (points[1] - points[0]) * 0.5;
                    let offset = match dir {
                        0 => Vec2::new(0.0, 4.0),
                        1 => Vec2::new(-4.0, 0.0),
                        2 => Vec2::new(0.0, -4.0),
                        _ => Vec2::new(4.0, 0.0),
                    };
                    painter.text(
                        middle + offset,
                        Align2::CENTER_CENTER,
                        id.to_string(),
                        FontId::monospace(7.5),
                        wall_color(id),
                    );
                }
            }
        }
        painter.rect_stroke(
            grid.expand(2.0),
            0,
            Stroke::new(1.0, BORDER),
            StrokeKind::Outside,
        );
        let step = if self.zoom < 12.0 { 4 } else { 2 };
        for n in (0..32).step_by(step) {
            let c = (n as f32 + 0.5) * self.zoom;
            painter.text(
                origin + Vec2::new(c, -13.0),
                Align2::CENTER_CENTER,
                format!("{n:02}"),
                FontId::monospace(10.0),
                MUTED,
            );
            painter.text(
                origin + Vec2::new(-16.0, c),
                Align2::CENTER_CENTER,
                format!("{n:02}"),
                FontId::monospace(10.0),
                MUTED,
            );
        }
        let entities = entities::collect(&self.project, &l, self.show_spawns, self.show_triggers);
        for (&cell, markers) in &entities {
            let cell_rect = Rect::from_min_size(
                origin + Vec2::new((cell % SIZE) as f32, (cell / SIZE) as f32) * self.zoom,
                Vec2::splat(self.zoom),
            );
            if !cell_rect.intersects(rect) {
                continue;
            }
            let layout = entities::layout(cell_rect, markers);
            let size = layout.size;
            if !markers.monsters.is_empty() {
                let center = layout.monster;
                let active = self.tab == Tab::Monsters
                    && markers
                        .monsters
                        .iter()
                        .any(|s| self.selected_spawn == Some(s.slot));
                let icon_rect =
                    icons::badge(&painter, center, size, icons::Icon::Monster, AMBER, active);
                if markers.monsters.len() > 1 {
                    icons::count(&painter, icon_rect, markers.monsters.len(), AMBER);
                }
                let directed = if active {
                    markers
                        .monsters
                        .iter()
                        .find(|s| self.selected_spawn == Some(s.slot))
                } else if markers.monsters.len() == 1 {
                    markers.monsters.first()
                } else {
                    None
                };
                if self.zoom >= 24.0
                    && let Some(spawn) = directed
                {
                    let d = [
                        Vec2::new(0.0, -1.0),
                        Vec2::new(1.0, 0.0),
                        Vec2::new(0.0, 1.0),
                        Vec2::new(-1.0, 0.0),
                    ][spawn.direction as usize % 4];
                    let side = Vec2::new(-d.y, d.x);
                    let tip = center + d * (size * 0.5 + 3.0);
                    painter.add(egui::Shape::convex_polygon(
                        vec![tip, tip - d * 3.0 + side * 2.0, tip - d * 3.0 - side * 2.0],
                        AMBER,
                        Stroke::NONE,
                    ));
                }
            }
            if !markers.scripts.is_empty() {
                let icon_rect = icons::badge(
                    &painter,
                    layout.script,
                    size,
                    icons::Icon::Script,
                    PURPLE,
                    self.tab == Tab::Cell
                        && self.selected_binding.is_some_and(|selected| {
                            markers
                                .scripts
                                .iter()
                                .any(|(index, _, _)| *index == selected)
                        }),
                );
                if markers.scripts.len() > 1 {
                    icons::count(&painter, icon_rect, markers.scripts.len(), PURPLE);
                }
            }
            if !over_preview
                && !panning
                && !self.stroke
                && self.entity_drag.is_none()
                && self.dialog.is_none()
                && self.error.is_none()
                && self.job.is_none()
            {
                ui.interact(
                    cell_rect.intersect(rect),
                    ui.scope_id().with(("map-entities", cell)),
                    Sense::hover(),
                )
                .on_hover_ui(|ui| {
                    small(
                        ui,
                        format!("Cell {}, {} · Block {cell}", cell % SIZE, cell / SIZE),
                    );
                    if !markers.monsters.is_empty() {
                        ui.label(
                            RichText::new(format!("Monster spawns ({})", markers.monsters.len()))
                                .strong()
                                .color(AMBER),
                        );
                        for spawn in &markers.monsters {
                            let sheet = self
                                .project
                                .monster_shape(&l, spawn)
                                .map(|s| s.sheet)
                                .unwrap_or("");
                            ui.label(format!(
                                "Spawn {:02} · Type {} · {sheet} · {}",
                                spawn.slot,
                                spawn.kind,
                                model::DIRECTIONS[spawn.direction as usize % 4]
                            ));
                        }
                    }
                    if !markers.scripts.is_empty() {
                        ui.label(
                            RichText::new(format!("Script bindings ({})", markers.scripts.len()))
                                .strong()
                                .color(PURPLE),
                        );
                        for (_, offset, flags) in &markers.scripts {
                            ui.label(format!("Bytecode 0x{offset:04X} · Flags 0x{flags:02X}"));
                        }
                    }
                    small(
                        ui,
                        "Inspect (V): drag an icon to move it. Groups move together.",
                    );
                });
            }
        }
        let r = Rect::from_min_size(
            origin
                + Vec2::new(
                    (self.selected % 32) as f32 * self.zoom,
                    (self.selected / 32) as f32 * self.zoom,
                ),
            Vec2::splat(self.zoom),
        );
        painter.rect_filled(r.shrink(2.0), 2, ACCENT.gamma_multiply(0.12));
        painter.rect_stroke(
            r.shrink(0.7),
            2,
            Stroke::new(1.8, ACCENT),
            StrokeKind::Inside,
        );
        {
            let r = Rect::from_min_size(
                origin
                    + Vec2::new(
                        (self.preview.cell % SIZE) as f32 * self.zoom,
                        (self.preview.cell / SIZE) as f32 * self.zoom,
                    ),
                Vec2::splat(self.zoom),
            );
            let direction = [
                Vec2::new(0.0, -1.0),
                Vec2::new(1.0, 0.0),
                Vec2::new(0.0, 1.0),
                Vec2::new(-1.0, 0.0),
            ][self.preview.facing];
            let side = Vec2::new(-direction.y, direction.x);
            let occupied = entities.contains_key(&self.preview.cell);
            let c = r.center()
                + if occupied {
                    direction * self.zoom * 0.5
                } else {
                    Vec2::ZERO
                };
            let radius = if occupied {
                (self.zoom * 0.20).clamp(2.5, 7.0)
            } else {
                (self.zoom * 0.34).clamp(2.5, 13.0)
            };
            painter.add(egui::Shape::convex_polygon(
                vec![
                    c + direction * radius,
                    c - direction * radius * 0.5 + side * radius * 0.5,
                    c - direction * radius * 0.5 - side * radius * 0.5,
                ],
                ACCENT,
                Stroke::NONE,
            ));
        }
        if let Some((cell, dir)) = self.hover {
            let r = Rect::from_min_size(
                origin
                    + Vec2::new(
                        (cell % 32) as f32 * self.zoom,
                        (cell / 32) as f32 * self.zoom,
                    ),
                Vec2::splat(self.zoom),
            );
            if !ctrl && matches!(self.tool, Tool::Wall | Tool::Erase) {
                painter.line_segment(
                    edge(r.shrink(1.0), dir),
                    Stroke::new(
                        4.0,
                        if self.tool == Tool::Erase {
                            Color32::from_rgb(239, 135, 126)
                        } else {
                            ACCENT
                        },
                    ),
                );
            } else {
                painter.rect_stroke(
                    r.shrink(1.0),
                    2,
                    Stroke::new(1.0, ACCENT.gamma_multiply(0.5)),
                    StrokeKind::Inside,
                );
            }
        }
        let legend = Rect::from_min_size(
            rect.left_bottom() + Vec2::new(12.0, -38.0),
            Vec2::new(296.0, 30.0),
        );
        painter.rect_filled(legend, 5, PANEL);
        let mut x = legend.left() + 17.0;
        for (icon, color, label, width) in [
            (icons::Icon::Monster, AMBER, "Monster", 99.0),
            (icons::Icon::Script, PURPLE, "Script", 82.0),
            (icons::Icon::Preview, ACCENT, "Start", 88.0),
        ] {
            icons::draw(
                &painter,
                Rect::from_center_size(Pos2::new(x, legend.center().y), Vec2::splat(16.0)),
                icon,
                color,
            );
            painter.text(
                Pos2::new(x + 14.0, legend.center().y),
                Align2::LEFT_CENTER,
                label,
                FontId::proportional(11.0),
                MUTED,
            );
            x += width;
        }
        if let Some((cell, dir)) = self.hover {
            painter.text(
                rect.right_bottom() - Vec2::new(14.0, 20.0),
                Align2::RIGHT_CENTER,
                format!(
                    "{}, {}  ·  {} #{}",
                    cell % 32,
                    cell / 32,
                    model::DIRECTIONS[dir],
                    walls[cell][dir]
                ),
                FontId::monospace(11.0),
                MUTED,
            );
        }
        self.entity_overlay(ui, &painter, origin, &entities, over_preview);
        if let Some(rect) = preview_rect {
            self.draw_preview(ui, rect);
        }
    }
}
#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn picking_uses_nearest_edge_and_stays_inside_map() {
        let o = Pos2::new(10.0, 20.0);
        assert_eq!(hit(o, 20.0, Pos2::new(40.0, 41.0)), Some((33, 0)));
        assert_eq!(hit(o, 20.0, Pos2::new(49.0, 50.0)), Some((33, 1)));
        assert!(hit(o, 20.0, Pos2::new(9.0, 40.0)).is_none());
        assert!(hit(o, 20.0, Pos2::new(650.0, 40.0)).is_none());
    }
}
