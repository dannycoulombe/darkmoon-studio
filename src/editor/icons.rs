//! Small vector symbols for map markers, their legend, and editing tools.
use super::*;
use egui::{Painter, Pos2, Rect, Shape};

#[derive(Clone, Copy)]
pub(super) enum Icon {
    Monster,
    Script,
    Preview,
    Undo,
    Redo,
}

pub(super) fn draw(painter: &Painter, rect: Rect, icon: Icon, color: Color32) {
    let size = rect.width().min(rect.height());
    let center = rect.center();
    let point = |x, y| center + Vec2::new(x, y) * size;
    let line = Stroke::new((size * 0.095).max(1.0), color);
    match icon {
        Icon::Monster => {
            painter.add(Shape::convex_polygon(
                [
                    (-0.25, -0.43),
                    (0.25, -0.43),
                    (0.43, -0.24),
                    (0.43, 0.08),
                    (0.25, 0.24),
                    (-0.25, 0.24),
                    (-0.43, 0.08),
                    (-0.43, -0.24),
                ]
                .map(|(x, y)| point(x, y))
                .to_vec(),
                color,
                Stroke::NONE,
            ));
            painter.rect_filled(
                Rect::from_min_max(point(-0.25, 0.15), point(0.25, 0.42)),
                0,
                color,
            );
            for x in [-0.18, 0.18] {
                painter.circle_filled(point(x, -0.04), (size * 0.11).max(0.7), BG);
            }
            painter.add(Shape::convex_polygon(
                vec![point(0.0, 0.07), point(-0.07, 0.20), point(0.07, 0.20)],
                BG,
                Stroke::NONE,
            ));
            if size >= 10.0 {
                for x in [-0.08, 0.08] {
                    painter.line_segment(
                        [point(x, 0.31), point(x, 0.43)],
                        Stroke::new((size * 0.07).max(0.8), BG),
                    );
                }
            }
        }
        Icon::Script => {
            for sign in [-1.0, 1.0] {
                painter.add(Shape::line(
                    vec![
                        point(sign * 0.20, -0.30),
                        point(sign * 0.43, 0.0),
                        point(sign * 0.20, 0.30),
                    ],
                    line,
                ));
            }
            painter.line_segment([point(0.08, -0.34), point(-0.08, 0.34)], line);
        }
        Icon::Preview => {
            painter.add(Shape::convex_polygon(
                vec![point(0.0, -0.45), point(0.34, 0.34), point(-0.34, 0.34)],
                color,
                Stroke::NONE,
            ));
        }
        Icon::Undo | Icon::Redo => {
            let direction: f32 = if matches!(icon, Icon::Redo) {
                -1.0
            } else {
                1.0
            };
            let point = |x: f32, y: f32| point(x * direction, y);
            painter.add(Shape::line(
                vec![
                    point(-0.38, -0.16),
                    point(0.04, -0.16),
                    point(0.20, -0.11),
                    point(0.31, 0.01),
                    point(0.35, 0.16),
                    point(0.31, 0.31),
                    point(0.20, 0.42),
                ],
                line,
            ));
            painter.add(Shape::line(
                vec![point(-0.16, -0.38), point(-0.38, -0.16), point(-0.16, 0.06)],
                line,
            ));
        }
    }
}

pub(super) fn button(ui: &mut egui::Ui, icon: Icon, label: &str, enabled: bool) -> egui::Response {
    ui.add_enabled_ui(enabled, |ui| {
        let response = ui.add_sized(
            Vec2::splat(CONTROL_HEIGHT),
            egui::Button::new("").sense(egui::Sense::CLICK),
        );
        response.widget_info(|| {
            egui::WidgetInfo::labeled(egui::Role::Button, response.enabled(), label)
        });
        draw(
            ui.painter(),
            Rect::from_center_size(response.rect.center(), Vec2::splat(20.0)),
            icon,
            ui.style().interact(&response).fg_stroke.color,
        );
        response
    })
    .inner
}

pub(super) fn tool(painter: &Painter, rect: Rect, tool: Tool, color: Color32) {
    let size = rect.width().min(rect.height());
    let point = |x, y| rect.center() + Vec2::new(x, y) * size;
    let stroke = Stroke::new((size * 0.075).max(1.0), color);
    match tool {
        Tool::Start => draw(painter, rect, Icon::Preview, color),
        Tool::Select => {
            painter.circle_stroke(point(-0.08, -0.08), size * 0.27, stroke);
            painter.line_segment([point(0.12, 0.12), point(0.42, 0.42)], stroke);
        }
        Tool::Wall => {
            painter.rect_stroke(
                Rect::from_min_max(point(-0.43, -0.36), point(0.43, 0.36)),
                1,
                stroke,
                egui::StrokeKind::Inside,
            );
            for y in [-0.12, 0.12] {
                painter.line_segment([point(-0.43, y), point(0.43, y)], stroke);
            }
            for (x, top, bottom) in [
                (0.0, -0.36, -0.12),
                (-0.22, -0.12, 0.12),
                (0.22, -0.12, 0.12),
                (0.0, 0.12, 0.36),
            ] {
                painter.line_segment([point(x, top), point(x, bottom)], stroke);
            }
        }
        Tool::Erase => {
            painter.add(Shape::closed_line(
                vec![
                    point(-0.43, 0.12),
                    point(0.08, -0.39),
                    point(0.43, -0.04),
                    point(-0.01, 0.40),
                    point(-0.15, 0.40),
                ],
                stroke,
            ));
            painter.line_segment([point(-0.21, -0.10), point(0.14, 0.25)], stroke);
            painter.line_segment([point(-0.15, 0.40), point(0.43, 0.40)], stroke);
        }
        Tool::Room => {
            painter.line_segment([point(-0.32, 0.42), point(0.08, -0.27)], stroke);
            painter.add(Shape::line(
                vec![
                    point(-0.40, -0.03),
                    point(-0.19, -0.28),
                    point(0.04, -0.35),
                    point(0.28, -0.19),
                    point(0.42, 0.07),
                ],
                stroke,
            ));
        }
        Tool::Move => {
            for (x, y) in [(0.0, -1.0), (1.0, 0.0), (0.0, 1.0), (-1.0, 0.0)] {
                let tip = point(x * 0.44, y * 0.44);
                painter.line_segment([rect.center(), tip], stroke);
                painter.add(Shape::line(
                    vec![
                        point(x * 0.25 - y * 0.16, y * 0.25 + x * 0.16),
                        tip,
                        point(x * 0.25 + y * 0.16, y * 0.25 - x * 0.16),
                    ],
                    stroke,
                ));
            }
        }
    }
}

pub(super) fn badge(
    painter: &Painter,
    center: Pos2,
    size: f32,
    icon: Icon,
    color: Color32,
    selected: bool,
) -> Rect {
    let rect = Rect::from_center_size(center, Vec2::splat(size));
    painter.rect(
        rect,
        (size * 0.22).min(5.0),
        BG,
        Stroke::new(
            if selected { 1.7 } else { 1.0 },
            color.gamma_multiply(if selected { 1.0 } else { 0.65 }),
        ),
        egui::StrokeKind::Inside,
    );
    draw(painter, rect.shrink(size * 0.12), icon, color);
    rect
}

pub(super) fn count(painter: &Painter, rect: Rect, count: usize, color: Color32) {
    let bubble = count_rect(rect, count);
    let size = bubble.height();
    painter.rect(
        bubble,
        3,
        color,
        Stroke::new(1.0, BG),
        egui::StrokeKind::Inside,
    );
    painter.text(
        bubble.center(),
        egui::Align2::CENTER_CENTER,
        count.to_string(),
        FontId::monospace((size * 0.75).max(8.0)),
        BG,
    );
}
pub(super) fn count_rect(rect: Rect, count: usize) -> Rect {
    let size = 10.0f32.max(rect.width() * 0.42);
    let width = size.max(count.to_string().len() as f32 * size * 0.55 + 4.0);
    Rect::from_center_size(
        rect.right_bottom() - Vec2::splat(0.5),
        Vec2::new(width, size),
    )
}
