//! Map entity picking and a draft drag that commits once, on a valid drop.
use super::*;
use egui::{Painter, Pos2, Rect, StrokeKind};

#[derive(Default)]
pub(super) struct Markers {
    pub monsters: Vec<model::Spawn>,
    pub scripts: Vec<(usize, u64, u64)>,
}

pub(super) fn collect(
    project: &Project,
    l: &Location,
    monsters: bool,
    scripts: bool,
) -> BTreeMap<usize, Markers> {
    let mut result = BTreeMap::<usize, Markers>::new();
    if scripts && let Some(bindings) = project.scripts[&l.script].value["bindings"].as_array() {
        for (index, binding) in bindings.iter().enumerate() {
            if let Some(cell) = binding["block"]
                .as_u64()
                .filter(|b| *b < (SIZE * SIZE) as u64)
            {
                result.entry(cell as usize).or_default().scripts.push((
                    index,
                    binding["bytecode_offset"].as_u64().unwrap_or(0),
                    binding["flags"].as_u64().unwrap_or(0),
                ));
            }
        }
    }
    if monsters {
        for spawn in project.spawns(&l.script) {
            if spawn.block < SIZE * SIZE {
                result.entry(spawn.block).or_default().monsters.push(spawn);
            }
        }
    }
    result
}

pub(super) struct Layout {
    pub size: f32,
    pub monster: Pos2,
    pub script: Pos2,
}
pub(super) fn layout(cell: Rect, markers: &Markers) -> Layout {
    let mixed = !markers.monsters.is_empty() && !markers.scripts.is_empty();
    let zoom = cell.width();
    let size = if mixed {
        (zoom * 0.60).clamp(6.0, 22.0)
    } else {
        (zoom * 0.88).clamp(7.0, 28.0)
    };
    let offset = if mixed {
        Vec2::new(zoom * 0.22, -zoom * 0.22)
    } else {
        Vec2::ZERO
    };
    Layout {
        size,
        monster: cell.center() - offset,
        script: cell.center() + offset,
    }
}

#[derive(Clone, Copy, PartialEq, Eq)]
pub(super) enum Kind {
    Monsters,
    Scripts,
}
impl Kind {
    fn icon(self) -> icons::Icon {
        match self {
            Self::Monsters => icons::Icon::Monster,
            Self::Scripts => icons::Icon::Script,
        }
    }
    fn color(self) -> Color32 {
        match self {
            Self::Monsters => AMBER,
            Self::Scripts => PURPLE,
        }
    }
    fn name(self, count: usize) -> &'static str {
        match (self, count == 1) {
            (Self::Monsters, true) => "monster spawn",
            (Self::Monsters, false) => "monster spawns",
            (Self::Scripts, true) => "script trigger",
            (Self::Scripts, false) => "script triggers",
        }
    }
}

pub(super) struct Drag {
    area: usize,
    section: usize,
    script: String,
    source: usize,
    kind: Kind,
    members: Vec<usize>,
    start: Pos2,
    moved: bool,
    destination: Option<usize>,
}

fn cell_rect(origin: Pos2, zoom: f32, cell: usize) -> Rect {
    Rect::from_min_size(
        origin + Vec2::new((cell % SIZE) as f32, (cell / SIZE) as f32) * zoom,
        Vec2::splat(zoom),
    )
}
fn pick(
    markers: &BTreeMap<usize, Markers>,
    origin: Pos2,
    zoom: f32,
    pointer: Pos2,
) -> Option<(usize, Kind)> {
    let mut nearest: Option<(f32, usize, Kind)> = None;
    for (&cell, markers) in markers {
        let layout = layout(cell_rect(origin, zoom, cell), markers);
        for (kind, center, count) in [
            (Kind::Monsters, layout.monster, markers.monsters.len()),
            (Kind::Scripts, layout.script, markers.scripts.len()),
        ] {
            let mut rect = Rect::from_center_size(center, Vec2::splat(layout.size));
            if count > 1 {
                rect = rect.union(icons::count_rect(rect, count));
            }
            if count > 0 && rect.expand(1.0).contains(pointer) {
                let distance = center.distance_sq(pointer);
                if nearest.is_none_or(|(d, _, _)| distance < d) {
                    nearest = Some((distance, cell, kind));
                }
            }
        }
    }
    nearest.map(|(_, cell, kind)| (cell, kind))
}

impl Editor {
    pub(super) fn entity_input(
        &mut self,
        ui: &mut egui::Ui,
        l: &Location,
        origin: Pos2,
        over_preview: bool,
        panning: bool,
    ) -> bool {
        let (pointer, pressed, down, released, focused, alt, space) = ui.input(|i| {
            (
                i.pointer.hover_pos(),
                i.pointer.primary_pressed(),
                i.pointer.primary_down(),
                i.pointer.button_released(egui::PointerButton::Primary),
                i.focused,
                i.modifiers.alt,
                i.key_down(Key::Space),
            )
        });
        let editable = self.dialog.is_none() && self.error.is_none() && self.job.is_none();
        if !editable || !focused {
            let consumed = self.entity_drag.take().is_some();
            return consumed;
        }
        let mut consumed = self.entity_drag.is_some();
        if self.entity_drag.is_none()
            && self.tool == Tool::Select
            && pressed
            && !alt
            && !space
            && !panning
            && !over_preview
            && self.hover.is_some()
            && let Some(pointer) = pointer
        {
            let markers = collect(&self.project, l, self.show_spawns, self.show_triggers);
            if let Some((cell, kind)) = pick(&markers, origin, self.zoom, pointer) {
                let members = match kind {
                    Kind::Monsters => markers[&cell]
                        .monsters
                        .iter()
                        .map(|s| s.slot)
                        .collect::<Vec<_>>(),
                    Kind::Scripts => markers[&cell]
                        .scripts
                        .iter()
                        .map(|s| s.0)
                        .collect::<Vec<_>>(),
                };
                self.project.finish();
                if kind == Kind::Monsters {
                    self.selected_binding = None;
                    if self
                        .selected_spawn
                        .is_none_or(|slot| !members.contains(&slot))
                    {
                        self.selected_spawn = members.first().copied();
                    }
                    self.tab = Tab::Monsters;
                } else {
                    self.selected_binding = members.first().copied();
                    self.tab = Tab::Cell;
                }
                // Entity selection is separate from the preview's cell. Locate
                // is the explicit camera jump; a click never teleports it.
                self.status = format!(
                    "Selected {} {} at {}, {}.",
                    members.len(),
                    kind.name(members.len()),
                    cell % SIZE,
                    cell / SIZE
                );
                ui.ctx().request_repaint();
                self.entity_drag = Some(Drag {
                    area: l.area,
                    section: l.section,
                    script: l.script.clone(),
                    source: cell,
                    kind,
                    members,
                    start: pointer,
                    moved: false,
                    destination: Some(cell),
                });
                consumed = true;
            }
        }
        if let Some(mut drag) = self.entity_drag.take() {
            if drag.area != l.area || drag.section != l.section || self.tool != Tool::Select {
                return true;
            }
            drag.moved |= pointer.is_some_and(|p| p.distance(drag.start) > 4.0);
            drag.destination = self.hover.map(|(cell, _)| cell);
            let valid = drag.destination.is_some_and(|cell| {
                drag.kind == Kind::Monsters
                    || self
                        .project
                        .binding_destination_available(&drag.script, &drag.members, cell)
            });
            if !down {
                if drag.moved
                    && released
                    && valid
                    && let Some(destination) = drag.destination
                    && destination != drag.source
                {
                    self.project.begin(&format!(
                        "Move {} {}",
                        drag.members.len(),
                        drag.kind.name(drag.members.len())
                    ));
                    let result = match drag.kind {
                        Kind::Monsters => {
                            self.project
                                .move_spawns(&drag.script, &drag.members, destination)
                        }
                        Kind::Scripts => {
                            self.project
                                .move_bindings(&drag.script, &drag.members, destination)
                        }
                    };
                    self.project.finish();
                    match result {
                        Ok(()) => {
                            self.selected = destination;
                            self.status = format!(
                                "Moved {} {} to {}, {}. Ctrl+Z to undo.",
                                drag.members.len(),
                                drag.kind.name(drag.members.len()),
                                destination % SIZE,
                                destination / SIZE
                            );
                        }
                        Err(e) => self.fail(e),
                    }
                } else if drag.moved {
                    self.status =
                        "Move cancelled. Drop on a map cell; script cells must be unoccupied."
                            .into();
                }
            } else {
                if drag.moved {
                    self.status = if valid {
                        format!(
                            "Moving {} {} · release to place · Esc cancels",
                            drag.members.len(),
                            drag.kind.name(drag.members.len())
                        )
                    } else {
                        "Cannot drop here. Choose a map cell without another script binding, or press Esc.".into()
                    };
                }
                self.entity_drag = Some(drag);
            }
        }
        consumed
    }

    pub(super) fn entity_overlay(
        &self,
        ui: &egui::Ui,
        painter: &Painter,
        origin: Pos2,
        markers: &BTreeMap<usize, Markers>,
        over_preview: bool,
    ) {
        let Some(pointer) = ui.input(|i| i.pointer.hover_pos()) else {
            return;
        };
        if let Some(drag) = &self.entity_drag {
            if !drag.moved {
                ui.ctx().set_cursor_icon(egui::CursorIcon::Grab);
                return;
            }
            let valid = drag.destination.is_some_and(|cell| {
                drag.kind == Kind::Monsters
                    || self
                        .project
                        .binding_destination_available(&drag.script, &drag.members, cell)
            });
            let color = if valid {
                drag.kind.color()
            } else {
                Color32::from_rgb(239, 135, 126)
            };
            if let Some(cell) = drag.destination {
                let rect = cell_rect(origin, self.zoom, cell);
                painter.rect(
                    rect.shrink(1.0),
                    3,
                    color.gamma_multiply(0.18),
                    Stroke::new(2.5, color),
                    StrokeKind::Inside,
                );
            }
            let icon_rect = icons::badge(
                painter,
                pointer + Vec2::new(16.0, -16.0),
                24.0,
                drag.kind.icon(),
                color,
                true,
            );
            if drag.members.len() > 1 {
                icons::count(painter, icon_rect, drag.members.len(), color);
            }
            ui.ctx().set_cursor_icon(if valid {
                egui::CursorIcon::Grabbing
            } else {
                egui::CursorIcon::NotAllowed
            });
        } else if self.tool == Tool::Select
            && !over_preview
            && self.hover.is_some()
            && pick(markers, origin, self.zoom, pointer).is_some()
            && !ui.input(|i| i.modifiers.alt || i.key_down(Key::Space))
        {
            ui.ctx().set_cursor_icon(egui::CursorIcon::Grab);
        }
    }
}
