//! Small vector symbols shared by map markers and their legend.
use super::*;
use egui::{Painter, Pos2, Rect, Shape};

#[derive(Clone, Copy)]
pub(super) enum Icon {
    Monster,
    Script,
    Preview,
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
