//! Native static EOB2 scene compositor. Perspective, clipping, VMP tile layout,
//! and decoration placement follow ScummVM's scene_rpg.cpp / scene_eob.cpp
//! (GPL-3.0-or-later). This renders editor state, not a running game simulation.
use super::*;
use crate::{assets, cps};
use anyhow::{Context, ensure};
use egui::{Rect, TextureHandle, TextureOptions, UiBuilder};
use std::sync::Arc;

const W: usize = 176;
const H: usize = 120;
const OFF: [i32; 9] = [102, 97, 129, 117, 81, 159, 45, 239, 0];
const POS: [(i32, i32); 18] = [
    (-3, 3),
    (-2, 3),
    (-1, 3),
    (0, 3),
    (1, 3),
    (2, 3),
    (3, 3),
    (-2, 2),
    (-1, 2),
    (0, 2),
    (1, 2),
    (2, 2),
    (-1, 1),
    (0, 1),
    (1, 1),
    (-1, 0),
    (0, 0),
    (1, 0),
];
type Signature = (usize, usize, String, u64, usize, usize);
type PaletteSignature = (usize, usize, String, u64, Vec<u8>);
pub(super) struct WallThumbnail {
    texture: Option<TextureHandle>,
    label: &'static str,
    description: String,
    error: Option<String>,
}
pub(super) struct Preview {
    pub cell: usize,
    pub facing: usize,
    panel_position: Option<Vec2>,
    pub panel_interacting: bool,
    texture: Option<TextureHandle>,
    signature: Option<Signature>,
    resources: BTreeMap<String, Resources>,
    error: Option<String>,
    palette_signature: Option<PaletteSignature>,
    palette_config: Option<(String, Config)>,
    thumbnails: BTreeMap<u8, WallThumbnail>,
}
impl Default for Preview {
    fn default() -> Self {
        Self {
            cell: 171,
            facing: 2,
            panel_position: None,
            panel_interacting: false,
            texture: None,
            signature: None,
            resources: BTreeMap::new(),
            error: None,
            palette_signature: None,
            palette_config: None,
            thumbnails: BTreeMap::new(),
        }
    }
}
impl Preview {
    pub fn clear(&mut self) {
        self.signature = None;
        self.resources.clear();
        self.texture = None;
        self.error = None;
        self.palette_signature = None;
        self.palette_config = None;
        self.thumbnails.clear();
    }
    pub fn wall_thumbnails(
        &mut self,
        ctx: &egui::Context,
        project: &Project,
        l: &Location,
        ids: &[u8],
    ) -> &BTreeMap<u8, WallThumbnail> {
        let signature = (
            l.area,
            l.section,
            l.graphics.clone(),
            project.revision,
            ids.to_vec(),
        );
        if self.palette_signature.as_ref() != Some(&signature) {
            self.palette_signature = Some(signature);
            let config = (l.graphics.clone(), Config::new(project, l));
            // Painting changes the project revision, but not the brush art.
            // Keep those textures until their actual graphics definition changes.
            if self.palette_config.as_ref() != Some(&config) {
                self.thumbnails.clear();
                self.palette_config = Some(config);
            }
            let cfg = &self.palette_config.as_ref().unwrap().1;
            let key = format!("{}:{}", l.graphics, cfg.palette);
            let result = (|| -> Result<()> {
                if !self.resources.contains_key(&key) {
                    self.resources.insert(
                        key.clone(),
                        Resources::load(&project.root, &l.graphics, &cfg.palette)?,
                    );
                }
                Ok(())
            })();
            for &id in ids {
                if self.thumbnails.contains_key(&id) {
                    continue;
                }
                let label = if id == 0 {
                    "Open"
                } else if cfg.flags[id as usize] & 8 != 0 {
                    "Door"
                } else if cfg.decorations.contains_key(&id) {
                    "Decorated"
                } else if cfg.mapping[id as usize] != 0 {
                    "Wall"
                } else {
                    "Invisible"
                };
                let description = format!(
                    "Wall ID {id} · {label} · {}",
                    if cfg.flags[id as usize] & 1 != 0 {
                        "Passable"
                    } else {
                        "Blocks movement"
                    }
                );
                let image = match &result {
                    Ok(()) => render_wall(id, cfg, self.resources.get_mut(&key).unwrap()),
                    Err(e) => Err(anyhow::anyhow!("{e:#}")),
                };
                let (texture, error) = match image {
                    Ok(pixels) => (
                        Some(ctx.load_texture(
                            format!("wall-palette-{id}"),
                            egui::ColorImage::from_rgb([W, H], &pixels),
                            TextureOptions::NEAREST,
                        )),
                        None,
                    ),
                    Err(e) => (None, Some(format!("{e:#}"))),
                };
                self.thumbnails.insert(
                    id,
                    WallThumbnail {
                        texture,
                        label,
                        description,
                        error,
                    },
                );
            }
        }
        &self.thumbnails
    }
    fn update(&mut self, ctx: &egui::Context, project: &Project, l: &Location, cell: usize) {
        let signature = (
            l.area,
            l.section,
            l.graphics.clone(),
            project.revision,
            cell,
            self.facing,
        );
        if self.signature.as_ref() == Some(&signature) {
            return;
        }
        self.signature = Some(signature);
        let config = Config::new(project, l);
        let key = format!("{}:{}", l.graphics, config.palette);
        let image = (|| -> Result<egui::ColorImage> {
            if !self.resources.contains_key(&key) {
                self.resources.insert(
                    key.clone(),
                    Resources::load(&project.root, &l.graphics, &config.palette)?,
                );
            }
            let res = self.resources.get_mut(&key).unwrap();
            let pixels = render(project, l, cell, self.facing, &config, res)?;
            Ok(egui::ColorImage::from_rgb([W, H], &pixels))
        })();
        match image {
            Ok(image) => {
                self.error = None;
                if let Some(texture) = &mut self.texture {
                    texture.set(image, TextureOptions::NEAREST);
                } else {
                    self.texture =
                        Some(ctx.load_texture("cell-first-person", image, TextureOptions::NEAREST));
                }
            }
            Err(e) => {
                self.texture = None;
                self.error = Some(format!("{e:#}"));
            }
        }
    }
}
pub(super) fn wall_tile(
    ui: &mut egui::Ui,
    id: u8,
    thumbnail: &WallThumbnail,
    selected: bool,
    width: f32,
) -> bool {
    let image_size = Vec2::new(width - 10.0, (width - 10.0) * 144.0 / 176.0);
    let (rect, response) =
        ui.allocate_exact_size(Vec2::new(width, image_size.y + 33.0), egui::Sense::click());
    response.widget_info(|| {
        egui::WidgetInfo::selected(
            egui::Role::Button,
            ui.is_enabled(),
            selected,
            format!("Wall {id}: {}", thumbnail.label),
        )
    });
    let highlighted = response.hovered() || response.has_focus();
    let painter = ui.painter();
    painter.rect(
        rect,
        6,
        if selected {
            ACCENT.gamma_multiply(0.16)
        } else if highlighted {
            CARD
        } else {
            BG
        },
        Stroke::new(
            if selected { 2.0 } else { 1.0 },
            if selected {
                ACCENT
            } else if highlighted {
                MUTED
            } else {
                BORDER
            },
        ),
        egui::StrokeKind::Inside,
    );
    let image_rect = Rect::from_min_size(rect.min + Vec2::splat(5.0), image_size);
    if let Some(texture) = &thumbnail.texture {
        painter.image(
            texture.id(),
            image_rect,
            Rect::from_min_max(egui::Pos2::ZERO, egui::pos2(1.0, 1.0)),
            Color32::WHITE,
        );
    } else {
        painter.text(
            image_rect.center(),
            egui::Align2::CENTER_CENTER,
            "Art unavailable",
            FontId::proportional(12.0),
            MUTED,
        );
    }
    painter.text(
        egui::pos2(rect.left() + 8.0, rect.bottom() - 13.0),
        egui::Align2::LEFT_CENTER,
        format!("{id:02} · {}", thumbnail.label),
        FontId::proportional(12.0),
        if selected { ACCENT } else { TEXT },
    );
    response
        .on_hover_ui(|ui| {
            ui.label(RichText::new(&thumbnail.description).strong());
            if let Some(texture) = &thumbnail.texture {
                ui.image((texture.id(), Vec2::new(W as f32, 144.0)));
            }
            if let Some(error) = &thumbnail.error {
                ui.label(RichText::new(error).color(AMBER));
            }
            if thumbnail.label == "Invisible" {
                small(ui, "This wall ID has no visible wall graphic.");
            }
        })
        .clicked()
}
impl Preview {
    pub fn panel_rect(&mut self, ui: &mut egui::Ui, canvas: Rect, movable: bool) -> Rect {
        let width = (canvas.width() * 0.36).clamp(228.0, 304.0);
        // VGA pixels are taller than square pixels: retain the game's 5:6 aspect.
        let size = Vec2::new(width, width * 144.0 / 176.0 + 111.0);
        let bounds = canvas.shrink(12.0);
        let available = (bounds.size() - size).max(Vec2::ZERO);
        let mut position = self
            .panel_position
            .unwrap_or(available)
            .clamp(Vec2::ZERO, available);
        let rect = Rect::from_min_size(bounds.min + position, size);
        self.panel_interacting = false;
        if movable {
            let header =
                Rect::from_min_size(rect.min + Vec2::splat(10.0), Vec2::new(width - 20.0, 32.0));
            let response = ui
                .interact(
                    header,
                    ui.scope_id().with("cell-preview-drag"),
                    // Moving the preview must leave WASD available afterwards.
                    egui::Sense::CLICK | egui::Sense::DRAG,
                )
                .on_hover_cursor(egui::CursorIcon::Grab)
                .on_hover_text("Drag to move. Double-click to return to the bottom-right corner.");
            self.panel_interacting = response.is_pointer_button_down_on()
                || response.dragged()
                || response.drag_stopped()
                || response.double_clicked();
            if response.double_clicked() {
                self.panel_position = None;
                return Rect::from_min_size(bounds.min + available, size);
            }
            if response.dragged_by(egui::PointerButton::Primary) {
                position = (position + response.drag_delta()).clamp(Vec2::ZERO, available);
                self.panel_position = Some(position);
                ui.ctx().set_cursor_icon(egui::CursorIcon::Grabbing);
            }
        }
        // Keep a moved panel reachable when the editor window gets smaller.
        if self.panel_position.is_some() {
            self.panel_position = Some(position);
        }
        Rect::from_min_size(bounds.min + position, size)
    }
}
impl Editor {
    pub(super) fn draw_preview(&mut self, ui: &mut egui::Ui, rect: Rect) {
        let mut child = ui.new_child(
            UiBuilder::new()
                .id_salt("first-person-preview")
                .max_rect(rect)
                .layout(Layout::top_down(Align::Min)),
        );
        Frame::NONE
            .fill(PANEL)
            .stroke(Stroke::new(1.0, BORDER))
            .corner_radius(8)
            .inner_margin(10)
            .show(&mut child, |ui| {
                ui.set_width((rect.width() - 22.0).max(190.0));
                ui.horizontal(|ui| {
                    ui.style_mut().interaction.selectable_labels = false;
                    let (grip, _) =
                        ui.allocate_exact_size(Vec2::new(8.0, 20.0), egui::Sense::hover());
                    for x in [-2.0, 2.0] {
                        for y in [-4.0, 0.0, 4.0] {
                            ui.painter()
                                .circle_filled(grip.center() + Vec2::new(x, y), 1.0, MUTED);
                        }
                    }
                    ui.label(RichText::new("Cell preview").strong());
                    ui.with_layout(Layout::right_to_left(Align::Center), |ui| {
                        small(
                            ui,
                            format!("{}, {}", self.preview.cell % 32, self.preview.cell / 32),
                        );
                    });
                });
                ui.horizontal(|ui| {
                    small(ui, "Facing");
                    for (i, name) in ["N", "E", "S", "W"].into_iter().enumerate() {
                        if ui
                            .add_sized(
                                [32.0, 24.0],
                                egui::Button::selectable(self.preview.facing == i, name),
                            )
                            .on_hover_text(model::DIRECTIONS[i])
                            .clicked()
                        {
                            self.preview.facing = i;
                            ui.ctx().request_repaint();
                        }
                    }
                });
                small(ui, "WASD walk · Q/E turn");
                let l = self.location();
                self.preview
                    .update(ui.ctx(), &self.project, &l, self.preview.cell);
                if let Some(texture) = &self.preview.texture {
                    let size =
                        Vec2::new(ui.available_width(), ui.available_width() * 144.0 / 176.0);
                    ui.image((texture.id(), size));
                } else {
                    Frame::NONE.fill(BG).inner_margin(8).show(ui, |ui| {
                        ui.set_min_height(95.0);
                        ui.label(RichText::new("Preview unavailable").color(AMBER));
                        small(
                            ui,
                            self.preview
                                .error
                                .as_deref()
                                .unwrap_or("No scene graphics found."),
                        );
                    });
                }
            });
    }
}

#[derive(serde::Deserialize)]
struct Tables {
    wall_flags: Vec<u8>,
    shape_coords: Vec<i32>,
    shape_index: Vec<i32>,
    shape_x: Vec<i32>,
    draw_order: Vec<usize>,
    dim1: Vec<i32>,
    dim2: Vec<i32>,
    wall_mapping: Vec<i32>,
    door_shape_index: Vec<usize>,
    door_y1: Vec<i32>,
    door_y2: Vec<i32>,
    door_frame_y2: Vec<i32>,
    door_scale_offs: Vec<i32>,
    door_scale_mult1: Vec<i32>,
    door_scale_mult3: Vec<i32>,
    item_pos: Vec<usize>,
}
fn tables() -> &'static Tables {
    static TABLE: std::sync::OnceLock<Tables> = std::sync::OnceLock::new();
    TABLE.get_or_init(|| {
        serde_json::from_str(include_str!("../../data/scene-layout.json"))
            .expect("embedded scene tables")
    })
}
#[derive(Clone, PartialEq, Eq)]
struct Decoration {
    sheet: String,
    definitions: String,
    index: usize,
}
#[derive(Clone, Copy, Default, PartialEq, Eq)]
struct Crop {
    x: usize,
    y: usize,
    w: usize,
    h: usize,
}
#[derive(PartialEq, Eq)]
struct Door {
    sheet: String,
    kind: usize,
    shapes: [Crop; 3],
}
#[derive(PartialEq, Eq)]
struct Config {
    mapping: [usize; 256],
    flags: [u8; 256],
    decorations: BTreeMap<u8, Decoration>,
    doors: BTreeMap<usize, Door>,
    palette: String,
}
// Use exactly the same live INF overrides as the scene compositor.
pub(super) fn wall_flags(project: &Project, l: &Location) -> [u8; 256] {
    Config::new(project, l).flags
}
impl Config {
    fn new(project: &Project, l: &Location) -> Self {
        let mut c = Self {
            mapping: [0; 256],
            flags: [0; 256],
            decorations: BTreeMap::new(),
            doors: BTreeMap::new(),
            palette: l.graphics.clone(),
        };
        c.mapping[1] = 1;
        c.mapping[2] = 2;
        c.mapping[3..23].fill(3);
        c.mapping[23] = 4;
        c.mapping[24] = 5;
        c.flags[..tables().wall_flags.len()].copy_from_slice(&tables().wall_flags);
        let fields = project.fields(&l.script);
        let bytes: Vec<u8> = project.scripts[&l.script].value["bytes"]
            .as_array()
            .into_iter()
            .flatten()
            .flat_map(|r| {
                r.as_array()
                    .into_iter()
                    .flatten()
                    .filter_map(|n| n.as_u64().map(|n| n as u8))
            })
            .collect();
        let mut definition = (String::new(), String::new());
        for s in 0..=l.section {
            let prefix = format!("sublevel[{s}].");
            let get = |name: &str| {
                let key = format!("{prefix}{name}");
                fields.iter().find(|f| f["name"] == key)
            };
            if let Some(f) = get("graphics") {
                c.palette = f["value"].as_str().unwrap_or(&c.palette).into();
            }
            if let Some(f) = get("palette_override") {
                c.palette = f["value"].as_str().unwrap_or(&c.palette).into();
            }
            let mut walls: BTreeMap<usize, BTreeMap<String, Value>> = BTreeMap::new();
            for f in fields {
                if let Some(rest) = f["name"]
                    .as_str()
                    .and_then(|n| n.strip_prefix(&format!("{prefix}wall[")))
                    && let Some((id, key)) = rest.split_once("].")
                    && let Ok(id) = id.parse()
                {
                    walls
                        .entry(id)
                        .or_default()
                        .insert(key.into(), f["value"].clone());
                }
            }
            for values in walls.values() {
                if let Some(sheet) = values.get("sheet").and_then(Value::as_str) {
                    definition = (
                        sheet.into(),
                        values
                            .get("definitions")
                            .and_then(Value::as_str)
                            .unwrap_or("")
                            .trim_end_matches(".dec")
                            .into(),
                    );
                    continue;
                }
                let Some(id) = values
                    .get("wall_id")
                    .and_then(Value::as_u64)
                    .filter(|id| *id < 256)
                    .map(|id| id as u8)
                else {
                    continue;
                };
                c.mapping[id as usize] =
                    values.get("vmp_index").and_then(Value::as_u64).unwrap_or(0) as usize;
                c.flags[id as usize] =
                    values.get("flags").and_then(Value::as_u64).unwrap_or(4) as u8 ^ 4;
                if let Some(index) = values
                    .get("decoration_index")
                    .and_then(Value::as_i64)
                    .filter(|i| *i >= 0)
                {
                    c.decorations.insert(
                        id,
                        Decoration {
                            sheet: definition.0.clone(),
                            definitions: definition.1.clone(),
                            index: index as usize,
                        },
                    );
                } else {
                    c.decorations.remove(&id);
                }
            }
            for d in 0..2 {
                if let Some(f) = get(&format!("door[{d}].sheet")) {
                    let p = f["offset"].as_u64().unwrap_or(0) as usize;
                    let value = |key: &str| {
                        get(&format!("door[{d}].{key}"))
                            .and_then(|f| f["value"].as_u64())
                            .unwrap_or(0) as usize
                    };
                    let mut shapes = [Crop::default(); 3];
                    for (i, shape) in shapes.iter_mut().enumerate() {
                        let p = p + 16 + i * 8;
                        *shape = Crop {
                            x: cps::word(&bytes, p).unwrap_or(0) as usize * 8,
                            y: cps::word(&bytes, p + 2).unwrap_or(0) as usize,
                            w: cps::word(&bytes, p + 4).unwrap_or(0) as usize * 8,
                            h: cps::word(&bytes, p + 6).unwrap_or(0) as usize,
                        };
                    }
                    c.doors.insert(
                        value("index"),
                        Door {
                            sheet: f["value"].as_str().unwrap_or("").into(),
                            kind: value("type"),
                            shapes,
                        },
                    );
                }
            }
        }
        c
    }
}
struct Indexed {
    w: usize,
    h: usize,
    pixels: Vec<u8>,
}
struct Resources {
    root: PathBuf,
    tiles: Indexed,
    color_map: Vec<u8>,
    vmp: Vec<u16>,
    palette: Vec<u8>,
    sheets: BTreeMap<String, Arc<Indexed>>,
    definitions: BTreeMap<String, Value>,
}
impl Resources {
    fn load(root: &std::path::Path, graphics: &str, palette: &str) -> Result<Self> {
        let pal =
            assets::read_json(&root.join(format!("palettes/{}.pal.json", palette.to_lowercase())))?;
        let mut p = Vec::new();
        for row in pal["colors"].as_array().context("palette colors")? {
            p.extend(assets::numbers(row)?);
        }
        ensure!(p.len() == 768, "palette needs 256 colors");
        let tilemeta = assets::read_json(&root.join(format!("tiles/{graphics}.json")))?;
        let color_map = assets::numbers(&tilemeta["color_map"])?;
        ensure!(color_map.len() == 32, "invalid tile color map");
        let rgb = assets::rgb(&p);
        let tilepalette: Vec<_> = color_map
            .iter()
            .take(16)
            .flat_map(|c| rgb[*c as usize * 3..*c as usize * 3 + 3].iter().copied())
            .collect();
        let (w, h, pixels) =
            assets::read_png(&root.join(format!("tiles/{graphics}.png")), &tilepalette)?;
        ensure!(
            w == 256 && pixels.iter().all(|p| *p < 16),
            "tiles need indices 0–15 in a 256-wide sheet"
        );
        let meta = assets::read_json(&root.join(format!("tiles/{graphics}.vmp.json")))?;
        let vmp = meta["entries"]
            .as_array()
            .context("VMP entries")?
            .iter()
            .map(|n| {
                n.as_u64()
                    .filter(|n| *n <= 65535)
                    .map(|n| n as u16)
                    .context("invalid VMP entry")
            })
            .collect::<Result<_>>()?;
        Ok(Self {
            root: root.into(),
            tiles: Indexed {
                w: w as usize,
                h: h as usize,
                pixels,
            },
            color_map,
            vmp,
            palette: rgb,
            sheets: BTreeMap::new(),
            definitions: BTreeMap::new(),
        })
    }
    fn sheet(&mut self, name: &str) -> Result<Arc<Indexed>> {
        let name = name.trim_end_matches(".cps").to_lowercase();
        if let Some(image) = self.sheets.get(&name) {
            return Ok(image.clone());
        }
        // Reuse the asset pipeline so edited individual crops are included too.
        let manifest = assets::manifest(&self.root)?;
        let entry = manifest
            .files
            .iter()
            .find(|e| e.kind == "cps" && e.name.eq_ignore_ascii_case(&format!("{name}.cps")))
            .context("scene sprite sheet not found")?;
        let bitmap = cps::decode(&assets::rebuild(&self.root, entry)?)?;
        let (w, h, pixels) = (320, 200, bitmap.data);
        let image = Arc::new(Indexed {
            w: w as usize,
            h: h as usize,
            pixels,
        });
        self.sheets.insert(name, image.clone());
        Ok(image)
    }
    fn definitions(&mut self, name: &str) -> Result<Value> {
        if !self.definitions.contains_key(name) {
            self.definitions.insert(
                name.into(),
                assets::read_json(&self.root.join(format!("sprites/{name}.dec.json")))?,
            );
        }
        Ok(self.definitions[name].clone())
    }
}
fn visible(cell: usize, facing: usize) -> [usize; 18] {
    let forward = [-32, 1, 32, -1][facing % 4];
    let right = [1, 32, -1, -32][facing % 4];
    POS.map(|(x, y)| ((cell as i32 + x * right + y * forward).rem_euclid(1024)) as usize)
}
struct Blocks<'a> {
    data: [u16; 660],
    res: &'a Resources,
    cfg: &'a Config,
}
impl Blocks<'_> {
    // Same parameters as the original perspective tile stamp, plus mirroring.
    #[allow(clippy::too_many_arguments)]
    fn stamp(&mut self, x: i32, y: usize, id: u8, offset: i32, w: usize, h: usize, flip: bool) {
        let map = self.cfg.mapping[id as usize];
        if map == 0 {
            return;
        }
        let base = (map as i32 - 1) * 431 + offset + 330;
        for row in 0..h {
            for col in 0..w {
                let xx = x + col as i32;
                if !(0..22).contains(&xx) || y + row >= 30 {
                    continue;
                }
                let ix = base + ((row * w) + if flip { w - col - 1 } else { col }) as i32;
                if ix >= 0
                    && let Some(&tile) = self.res.vmp.get(ix as usize)
                    && tile != 0
                {
                    self.data[(y + row) * 22 + xx as usize] =
                        if flip { tile ^ 0x4000 } else { tile };
                }
            }
        }
    }
    fn pixels(&self) -> Vec<u8> {
        let mut out = vec![0; W * H];
        for i in 0..330 {
            let entry = self.data[i];
            let composite = entry & 0x8000 != 0;
            let wall = entry & 0x3fff;
            let floor = self.data[i + 330];
            let (tile, flip, bank) = if composite || wall == 0 {
                (
                    floor & 0x3fff,
                    floor & 0x4000 != 0 || (!composite && entry & 0x4000 != 0),
                    0,
                )
            } else {
                (wall, entry & 0x4000 != 0, 16)
            };
            self.tile(&mut out, i, tile as usize, flip, bank, false);
            if composite {
                self.tile(&mut out, i, wall as usize, entry & 0x4000 != 0, 16, true);
            }
        }
        out
    }
    fn tile(
        &self,
        out: &mut [u8],
        i: usize,
        tile: usize,
        flip: bool,
        bank: usize,
        transparent: bool,
    ) {
        for y in 0..8 {
            for x in 0..8 {
                let sx = tile % 32 * 8 + if flip { 7 - x } else { x };
                let sy = tile / 32 * 8 + y;
                if sy >= self.res.tiles.h {
                    continue;
                }
                let index = self.res.tiles.pixels[sy * self.res.tiles.w + sx] as usize;
                let color = self.res.color_map[index + bank];
                if !transparent || color != 0 {
                    out[(i / 22 * 8 + y) * W + i % 22 * 8 + x] = color;
                }
            }
        }
    }
}
fn draw_base(
    walls: &[[u8; 4]],
    cell: usize,
    facing: usize,
    cfg: &Config,
    res: &Resources,
) -> Vec<u8> {
    let v = visible(cell, facing);
    let down = (facing + 2) % 4;
    let right = (facing + 1) % 4;
    let left = (facing + 3) % 4;
    let w = |i: usize, d: usize| walls[v[i]][d];
    let has = |id: u8| id != 0 && cfg.flags[id as usize] & 8 == 0;
    let mut b = Blocks {
        data: [0; 660],
        res,
        cfg,
    };
    b.stamp(
        0,
        15,
        1,
        -330,
        22,
        15,
        (cell / 32 + cell % 32 + facing) & 1 != 0,
    );
    b.stamp(-2, 3, w(0, right), OFF[0], 3, 5, false);
    b.stamp(21, 3, w(6, left), OFF[0], 3, 5, true);
    for (i, j, d, x, flip) in [(1, 2, right, 2, false), (5, 4, left, 17, true)] {
        let t = w(i, d);
        let t2 = w(j, down);
        if has(t) && cfg.flags[t2 as usize] & 8 == 0 {
            b.stamp(x, 3, t, OFF[0], 3, 5, flip);
        } else if t != 0 && cfg.flags[t2 as usize] & 8 != 0 {
            b.stamp(x, 3, t2, OFF[0], 3, 5, flip);
        }
    }
    b.stamp(8, 3, w(2, right), OFF[1], 1, 5, false);
    b.stamp(13, 3, w(4, left), OFF[1], 1, 5, true);
    for (i, x) in [(1, -4), (5, 20), (2, 2), (4, 14)] {
        let t = w(i, down);
        if has(t) {
            b.stamp(x, 3, t, OFF[2], 6, 5, false);
        }
    }
    b.stamp(8, 3, w(3, down), OFF[2], 6, 5, false);
    b.stamp(0, 3, w(7, right), OFF[3], 2, 6, false);
    b.stamp(20, 3, w(11, left), OFF[3], 2, 6, true);
    b.stamp(6, 2, w(8, right), OFF[4], 2, 8, false);
    b.stamp(14, 2, w(10, left), OFF[4], 2, 8, true);
    for (i, x) in [(8, -4), (10, 16)] {
        let t = w(i, down);
        if has(t) {
            b.stamp(x, 2, t, OFF[5], 10, 8, false);
        }
    }
    b.stamp(6, 2, w(9, down), OFF[5], 10, 8, false);
    b.stamp(3, 1, w(12, right), OFF[6], 3, 12, false);
    b.stamp(16, 1, w(14, left), OFF[6], 3, 12, true);
    for (i, x) in [(12, -13), (14, 19)] {
        let t = w(i, down);
        if cfg.flags[t as usize] & 8 == 0 {
            b.stamp(x, 1, t, OFF[7], 16, 12, false);
        }
    }
    b.stamp(3, 1, w(13, down), OFF[7], 16, 12, false);
    b.stamp(0, 0, w(15, right), OFF[8], 3, 15, false);
    b.stamp(19, 0, w(17, left), OFF[8], 3, 15, true);
    b.pixels()
}
fn clip(
    index: usize,
    walls: &[[u8; 4]],
    v: &[usize; 18],
    down: usize,
    cfg: &Config,
) -> Option<(i32, i32)> {
    let (mut l, mut r) = (0, 22);
    for i in 0..18 {
        let id = walls[v[i]][down];
        let t = tables().dim1[index * 18 + i];
        if cfg.flags[id as usize] & 8 != 0 {
            l = l.max(tables().dim2[(index * 18 + i) * 2]);
            r = r.min(tables().dim2[(index * 18 + i) * 2 + 1]);
        } else if cfg.mapping[id as usize] != 0 && t != -40 {
            if t == -41 {
                return None;
            }
            if t > 0 {
                r = r.min(t);
            }
            if t < 0 {
                l = l.max(-t);
            }
        }
    }
    if r > l { Some((l * 8, r * 8)) } else { None }
}
#[allow(clippy::too_many_arguments)]
fn blit(
    out: &mut [u8],
    image: &Indexed,
    crop: Crop,
    x: i32,
    y: i32,
    w: usize,
    h: usize,
    flip: bool,
    clip: (i32, i32),
) {
    if crop.w == 0 || crop.h == 0 || w == 0 || h == 0 {
        return;
    }
    for dy in 0..h {
        let yy = y + dy as i32;
        if !(0..H as i32).contains(&yy) {
            continue;
        }
        let sy = crop.y + dy * crop.h / h;
        if sy >= image.h {
            continue;
        }
        for dx in 0..w {
            let xx = x + dx as i32;
            if xx < clip.0 || xx >= clip.1 || !(0..W as i32).contains(&xx) {
                continue;
            }
            let sx = crop.x
                + if flip {
                    crop.w - 1 - dx * crop.w / w
                } else {
                    dx * crop.w / w
                };
            if sx >= image.w {
                continue;
            }
            let color = image.pixels[sy * image.w + sx];
            if color != 0 {
                out[yy as usize * W + xx as usize] = color;
            }
        }
    }
}
fn render(
    project: &Project,
    l: &Location,
    cell: usize,
    facing: usize,
    cfg: &Config,
    res: &mut Resources,
) -> Result<Vec<u8>> {
    let walls = &project.maps[&l.map].walls;
    render_scene(walls, cell, facing, cfg, res, Some((project, l)))
}
fn render_wall(id: u8, cfg: &Config, res: &mut Resources) -> Result<Vec<u8>> {
    // A fixed sample corridor keeps neighboring cells and monsters out of the
    // brush artwork. Rendering uses the same tiles, doors and DEC overlays as
    // the cell preview, without changing the editable map.
    let cell = 16 * SIZE + 16;
    let mut walls = vec![[0; 4]; SIZE * SIZE];
    for depth in 0..=3 {
        let block = cell - depth * SIZE;
        walls[block][1] = 1;
        walls[block + 1][3] = 1;
        walls[block][3] = 1;
        walls[block - 1][1] = 1;
    }
    walls[cell - 3 * SIZE][0] = 1;
    walls[cell - 4 * SIZE][2] = 1;
    walls[cell][0] = id;
    walls[cell - SIZE][2] = id;
    render_scene(&walls, cell, 0, cfg, res, None)
}
fn render_scene(
    walls: &[[u8; 4]],
    cell: usize,
    facing: usize,
    cfg: &Config,
    res: &mut Resources,
    actors: Option<(&Project, &Location)>,
) -> Result<Vec<u8>> {
    let v = visible(cell, facing);
    let down = (facing + 2) % 4;
    let directions = [down, (facing + 1) % 4, (facing + 3) % 4];
    let mut out = draw_base(walls, cell, facing, cfg, res);
    let spawns = actors.map_or_else(Vec::new, |(project, l)| project.spawns(&l.script));
    for &i in &tables().draw_order {
        let Some(bounds) = clip(i, walls, &v, down, cfg) else {
            continue;
        };
        for side in (0..2).rev() {
            let slot = i * 2 + side;
            let d = tables().wall_mapping[slot];
            if d < 0 {
                continue;
            }
            let id = walls[v[i]][directions[d as usize]];
            let Some(dec) = cfg.decorations.get(&id) else {
                continue;
            };
            let defs = res.definitions(&dec.definitions)?;
            let image = res.sheet(&dec.sheet)?;
            let mut index = dec.index;
            for _ in 0..32 {
                let Some(prop) = defs["decorations"].get(index) else {
                    break;
                };
                let mut ix = tables().shape_index[slot];
                let shape = ix.unsigned_abs().saturating_sub(1) as usize;
                let flags = prop["flags"].as_u64().unwrap_or(0);
                if side == 0
                    && (flags & 1 != 0
                        || (flags & 2 != 0 && (cell / 32 + cell % 32 + facing) & 1 != 0))
                {
                    ix = -ix;
                }
                if let Some(rect) = prop["shape_indices"]
                    .get(shape)
                    .and_then(Value::as_u64)
                    .filter(|n| *n != 255)
                    .and_then(|n| defs["rectangles"].get(n as usize))
                {
                    let crop = Crop {
                        x: rect["x_tiles"].as_u64().unwrap_or(0) as usize * 8,
                        y: rect["y"].as_u64().unwrap_or(0) as usize,
                        w: rect["width_tiles"].as_u64().unwrap_or(0) as usize * 8,
                        h: rect["height"].as_u64().unwrap_or(0) as usize,
                    };
                    let base = if side == 0 {
                        if flags & 4 != 0 {
                            tables().shape_coords[(i * 5 + 4) * 2]
                        } else {
                            tables().shape_x[i]
                        }
                    } else {
                        0
                    };
                    let px = prop["x"][shape].as_i64().unwrap_or(0) as i32;
                    let y = prop["y"][shape].as_i64().unwrap_or(0) as i32;
                    let x = base + if ix < 0 { 176 - px - crop.w as i32 } else { px };
                    blit(&mut out, &image, crop, x, y, crop.w, crop.h, ix < 0, bounds);
                }
                index = prop["next"].as_u64().unwrap_or(0) as usize;
                if index == 0 {
                    break;
                }
            }
        }
        let wall = walls[v[i]][down] as usize;
        if i < 15
            && cfg.flags[wall] & 8 != 0
            && let Some(&kind) = tables().door_shape_index.get(wall)
            && let Some(door) = cfg.doors.get(&kind)
        {
            let depth = if i < 7 {
                0
            } else if i < 12 {
                1
            } else {
                2
            };
            let crop = door.shapes[2 - depth];
            let image = res.sheet(&door.sheet)?;
            let offset = tables().shape_coords[(i * 5 + 4) * 2];
            let x = 88 + offset - crop.w as i32 / 2;
            let step = wall as i32 - tables().door_scale_offs[wall];
            let y = if door.kind == 2 {
                tables().door_y2[depth] - step * tables().door_scale_mult3[depth]
            } else {
                tables().door_y1[depth] - crop.h as i32 - step * tables().door_scale_mult1[depth]
            };
            blit(&mut out, &image, crop, x, y, crop.w, crop.h, false, bounds);
            // Type 1/2 door frames occupy the second loaded door shape set.
            if door.kind > 0
                && let Some(frame) = cfg.doors.get(&(kind + 1))
            {
                let crop = frame.shapes[2 - depth];
                let image = res.sheet(&frame.sheet)?;
                let yy = if door.kind == 2 {
                    tables().door_frame_y2[depth] - crop.h as i32
                        + ((step * tables().door_scale_mult3[depth]) >> 1)
                        - 1
                } else {
                    y
                };
                blit(&mut out, &image, crop, x, yy, crop.w, crop.h, false, bounds);
            }
        }
        if i < 15
            && let Some((project, l)) = actors
        {
            for spawn in spawns.iter().filter(|s| s.block == v[i]) {
                let get = |suffix: &str| {
                    let key = format!("spawn[{}].{suffix}", spawn.slot);
                    project
                        .fields(&l.script)
                        .iter()
                        .find(|f| f["name"] == key)
                        .and_then(|f| f["value"].as_u64())
                        .unwrap_or(0) as usize
                };
                let slot = get("shape_slot");
                let prefix = format!("sublevel[{}].monster_shapes[", l.section);
                let fields = project.fields(&l.script);
                let sheet = fields
                    .iter()
                    .find(|f| {
                        f["name"]
                            .as_str()
                            .is_some_and(|n| n.starts_with(&prefix) && n.ends_with(".slot"))
                            && f["value"].as_u64() == Some(slot as u64)
                    })
                    .and_then(|f| f["name"].as_str())
                    .and_then(|name| {
                        fields
                            .iter()
                            .find(|f| f["name"] == name.replace(".slot", ".sheet"))
                    })
                    .and_then(|f| f["value"].as_str());
                let Some(sheet) = sheet else {
                    continue;
                };
                let image = res.sheet(sheet)?;
                let group = fields
                    .iter()
                    .find(|f| {
                        f["name"]
                            == format!(
                                "sublevel[{}].monster_shapes[{slot}].layout_group",
                                l.section
                            )
                    })
                    .and_then(|f| f["value"].as_u64())
                    .unwrap_or(0) as usize;
                let shapes: Value =
                    serde_json::from_str(include_str!("../../data/sprite-layouts.json"))?;
                let frame = [3, 1, 0, 2][(spawn.direction as usize + 4 - facing) % 4];
                let r = &shapes["monster_rects"][group * 18 + frame];
                let Some(rect) = r.as_array() else {
                    continue;
                };
                let crop = Crop {
                    x: rect[0].as_u64().unwrap() as usize * 8,
                    y: rect[1].as_u64().unwrap() as usize,
                    w: rect[2].as_u64().unwrap() as usize * 8,
                    h: rect[3].as_u64().unwrap() as usize,
                };
                let depth = if i < 7 {
                    2
                } else if i < 12 {
                    1
                } else {
                    0
                };
                let scale = (2.0f64 / 3.0).powi(depth);
                let (w, h) = (
                    (crop.w as f64 * scale) as usize,
                    (crop.h as f64 * scale) as usize,
                );
                let pos = get("position");
                let pos = if pos == 4 {
                    4
                } else {
                    *tables().item_pos.get(facing * 4 + pos).unwrap_or(&4)
                };
                let coords = (i * 5 + pos.min(4)) * 2;
                let x = 88 + tables().shape_coords[coords] - w as i32 / 2;
                let y = 127 + tables().shape_coords[coords + 1] - h as i32;
                blit(&mut out, &image, crop, x, y, w, h, false, bounds);
            }
        }
    }
    Ok(out
        .into_iter()
        .flat_map(|c| {
            res.palette[c as usize * 3..c as usize * 3 + 3]
                .iter()
                .copied()
        })
        .collect())
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    #[ignore = "requires the owner's extracted EOB2 data in assets/"]
    fn supplied_areas_render_all_facings() -> Result<()> {
        let project =
            Project::open(&std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("assets"))?;
        let mut resources = BTreeMap::<String, Resources>::new();
        let mut count = 0;
        let mut thumbnails = 0;
        for area in &project.areas {
            for &section in &area.sections {
                let l = project.location(area.id, section)?;
                let cfg = Config::new(&project, &l);
                let key = format!("{}:{}", l.graphics, cfg.palette);
                if !resources.contains_key(&key) {
                    resources.insert(
                        key.clone(),
                        Resources::load(&project.root, &l.graphics, &cfg.palette)?,
                    );
                }
                let walls = &project.maps[&l.map].walls;
                for id in project.wall_ids(&l) {
                    let image = render_wall(id, &cfg, resources.get_mut(&key).unwrap())
                        .with_context(|| {
                            format!("area {}, sublevel {section}, wall ID {id}", area.id)
                        })?;
                    ensure!(image.len() == W * H * 3, "wrong wall thumbnail size");
                    thumbnails += 1;
                }
                let mut cells = std::collections::BTreeSet::from([171]);
                cells.extend(
                    walls
                        .iter()
                        .enumerate()
                        .filter(|(_, w)| w.contains(&0))
                        .take(2)
                        .map(|(i, _)| i),
                );
                cells.extend(
                    walls
                        .iter()
                        .enumerate()
                        .filter(|(_, w)| w.iter().any(|id| *id > 2))
                        .take(2)
                        .map(|(i, _)| i),
                );
                cells.extend(
                    project
                        .spawns(&l.script)
                        .iter()
                        .take(2)
                        .map(|s| s.block.min(1023)),
                );
                for cell in cells {
                    for facing in 0..4 {
                        let image = render(
                            &project,
                            &l,
                            cell,
                            facing,
                            &cfg,
                            resources.get_mut(&key).unwrap(),
                        )
                        .with_context(|| {
                            format!(
                                "area {}, sublevel {section}, cell {cell}, facing {facing}",
                                area.id
                            )
                        })?;
                        ensure!(image.len() == W * H * 3, "wrong preview image size");
                        count += 1;
                    }
                }
            }
        }
        println!(
            "Rendered {count} scene views and {thumbnails} wall thumbnails across all {} areas and their sublevels",
            project.areas.len()
        );
        Ok(())
    }
    #[test]
    fn camera_rotation_selects_the_correct_neighbor() {
        let cell = 171;
        assert_eq!(visible(cell, 0)[13], 139);
        assert_eq!(visible(cell, 1)[13], 172);
        assert_eq!(visible(cell, 2)[13], 203);
        assert_eq!(visible(cell, 3)[13], 170);
        for d in 0..4 {
            assert_eq!(visible(cell, d)[16], cell);
            assert!(visible(0, d).iter().all(|n| *n < 1024));
        }
    }
    #[test]
    fn tile_flipping_and_wall_palette_are_distinct() {
        let mut mapping = [0; 256];
        mapping[1] = 1;
        let cfg = Config {
            mapping,
            flags: [0; 256],
            decorations: BTreeMap::new(),
            doors: BTreeMap::new(),
            palette: String::new(),
        };
        let mut pixels = vec![0; 256 * 8];
        pixels[8..16].copy_from_slice(&[1, 2, 3, 4, 5, 6, 7, 8]);
        pixels[18] = 3;
        let mut color_map: Vec<u8> = (0..32).collect();
        color_map[16] = 0;
        let res = Resources {
            root: PathBuf::new(),
            tiles: Indexed {
                w: 256,
                h: 8,
                pixels,
            },
            color_map,
            vmp: vec![1; 761],
            palette: vec![0; 768],
            sheets: BTreeMap::new(),
            definitions: BTreeMap::new(),
        };
        let mut b = Blocks {
            data: [0; 660],
            res: &res,
            cfg: &cfg,
        };
        b.data[330] = 1;
        assert_eq!(&b.pixels()[..8], &[1, 2, 3, 4, 5, 6, 7, 8]);
        b.data[0] = 0x4001;
        assert_eq!(&b.pixels()[..8], &[24, 23, 22, 21, 20, 19, 18, 17]);
        b.data[0] = 0xc002;
        assert_eq!(&b.pixels()[..8], &[1, 2, 3, 4, 5, 19, 7, 8]);
    }
}
