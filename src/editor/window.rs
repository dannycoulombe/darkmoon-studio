//! Native window controls integrated into the editor header.
use super::*;
use egui::{PointerButton, Rect, Sense, StrokeKind, ViewportCommand, viewport::ResizeDirection};

pub(super) fn drag(ui: &egui::Ui, header: Rect, actions: Rect) {
    // Reserve the outer edge for window resizing. Subtract the toolbar from
    // the header instead of putting a drag target behind clickable buttons.
    let header = header.shrink(5.0);
    let actions = actions.expand(4.0).intersect(header);
    for (index, rect) in [
        Rect::from_min_max(header.min, egui::pos2(header.right(), actions.top())),
        Rect::from_min_max(egui::pos2(header.left(), actions.bottom()), header.max),
        Rect::from_min_max(
            egui::pos2(header.left(), actions.top()),
            egui::pos2(actions.left(), actions.bottom()),
        ),
        Rect::from_min_max(
            egui::pos2(actions.right(), actions.top()),
            egui::pos2(header.right(), actions.bottom()),
        ),
    ]
    .into_iter()
    .enumerate()
    {
        if !rect.is_positive() {
            continue;
        }
        let response = ui.interact(
            rect,
            ui.id().with(("window-drag", index)),
            Sense::click_and_drag(),
        );
        if response.double_clicked_by(PointerButton::Primary) {
            let maximized = ui.input(|i| i.viewport().maximized.unwrap_or(false));
            ui.ctx()
                .send_viewport_cmd(ViewportCommand::Maximized(!maximized));
        } else if response.drag_started_by(PointerButton::Primary) {
            ui.ctx().send_viewport_cmd(ViewportCommand::StartDrag);
        }
    }
}

pub(super) fn controls(ui: &mut egui::Ui) {
    let maximized = ui.input(|i| i.viewport().maximized.unwrap_or(false));
    // The header uses right-to-left layout: close stays at the far right.
    ui.scope(|ui| {
        ui.spacing_mut().item_spacing.x = 4.0;
        for (index, label, command) in [
            (0, "Close", ViewportCommand::Close),
            (
                1,
                if maximized { "Restore" } else { "Maximize" },
                ViewportCommand::Maximized(!maximized),
            ),
            (2, "Minimize", ViewportCommand::Minimized(true)),
        ] {
            let response = ui
                .add_sized([34.0, 32.0], egui::Button::new("").frame(false))
                .on_hover_text(label);
            response.widget_info(|| {
                egui::WidgetInfo::labeled(egui::Role::Button, ui.is_enabled(), label)
            });
            if response.hovered() || response.is_pointer_button_down_on() {
                ui.painter().rect_filled(
                    response.rect,
                    5,
                    if index == 0 {
                        Color32::from_rgb(163, 57, 64)
                    } else {
                        CARD
                    },
                );
            }
            let rect = Rect::from_center_size(response.rect.center(), Vec2::splat(12.0));
            let stroke = Stroke::new(1.4, TEXT);
            let p = ui.painter();
            match index {
                0 => {
                    p.line_segment([rect.left_top(), rect.right_bottom()], stroke);
                    p.line_segment([rect.right_top(), rect.left_bottom()], stroke);
                }
                1 if maximized => {
                    let back = rect.translate(Vec2::new(2.0, -2.0)).shrink(1.0);
                    let front = rect.translate(Vec2::new(-2.0, 2.0)).shrink(1.0);
                    p.rect_stroke(back, 0, stroke, StrokeKind::Inside);
                    p.rect_filled(front, 0, if response.hovered() { CARD } else { PANEL });
                    p.rect_stroke(front, 0, stroke, StrokeKind::Inside);
                }
                1 => {
                    p.rect_stroke(rect, 0, stroke, StrokeKind::Inside);
                }
                _ => {
                    p.line_segment([rect.left_center(), rect.right_center()], stroke);
                }
            }
            if response.clicked() {
                ui.ctx().send_viewport_cmd(command);
            }
        }
    });
}

pub(super) fn resize(ui: &egui::Ui) {
    if ui.input(|i| {
        i.viewport().maximized.unwrap_or(false) || i.viewport().fullscreen.unwrap_or(false)
    }) {
        return;
    }
    let rect = ui.ctx().viewport_rect();
    let edge = 5.0;
    let corner = 14.0;
    let left = rect.left();
    let right = rect.right();
    let top = rect.top();
    let bottom = rect.bottom();
    for (index, (direction, min, max, cursor)) in [
        (
            ResizeDirection::NorthWest,
            [left, top],
            [left + corner, top + corner],
            egui::CursorIcon::ResizeNwSe,
        ),
        (
            ResizeDirection::NorthEast,
            [right - corner, top],
            [right, top + corner],
            egui::CursorIcon::ResizeNeSw,
        ),
        (
            ResizeDirection::SouthWest,
            [left, bottom - corner],
            [left + corner, bottom],
            egui::CursorIcon::ResizeNeSw,
        ),
        (
            ResizeDirection::SouthEast,
            [right - corner, bottom - corner],
            [right, bottom],
            egui::CursorIcon::ResizeNwSe,
        ),
        (
            ResizeDirection::North,
            [left + corner, top],
            [right - corner, top + edge],
            egui::CursorIcon::ResizeVertical,
        ),
        (
            ResizeDirection::South,
            [left + corner, bottom - edge],
            [right - corner, bottom],
            egui::CursorIcon::ResizeVertical,
        ),
        (
            ResizeDirection::West,
            [left, top + corner],
            [left + edge, bottom - corner],
            egui::CursorIcon::ResizeHorizontal,
        ),
        (
            ResizeDirection::East,
            [right - edge, top + corner],
            [right, bottom - corner],
            egui::CursorIcon::ResizeHorizontal,
        ),
    ]
    .into_iter()
    .enumerate()
    {
        let response = ui
            .interact(
                Rect::from_min_max(min.into(), max.into()),
                ui.id().with(("window-resize", index)),
                Sense::drag(),
            )
            .on_hover_cursor(cursor);
        if response.is_pointer_button_down_on()
            && ui.input(|i| i.pointer.button_pressed(PointerButton::Primary))
        {
            ui.ctx()
                .send_viewport_cmd(ViewportCommand::BeginResize(direction));
        }
    }
}
