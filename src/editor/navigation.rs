//! Grid camera movement using EOB's destination-wall passability rule.
use super::model::neighbor;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(super) enum Action {
    Forward,
    Backward,
    Left,
    Right,
    TurnLeft,
    TurnRight,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(super) enum Blocked {
    Wall(u8),
    Boundary,
}

pub(super) fn advance(
    walls: &[[u8; 4]],
    flags: &[u8; 256],
    cell: usize,
    facing: usize,
    action: Action,
) -> Result<(usize, usize), Blocked> {
    let direction = match action {
        Action::TurnLeft => return Ok((cell, (facing + 3) % 4)),
        Action::TurnRight => return Ok((cell, (facing + 1) % 4)),
        Action::Forward => facing,
        Action::Backward => (facing + 2) % 4,
        Action::Left => (facing + 3) % 4,
        Action::Right => (facing + 1) % 4,
    };
    let destination = neighbor(cell, direction).ok_or(Blocked::Boundary)?;
    // EOB checks the face entered on the destination, preserving one-sided
    // passages. Bit 0 permits walking; a nonzero wall ID can still be passable.
    let wall = walls[destination][direction ^ 2];
    if flags[wall as usize] & 1 == 0 {
        return Err(Blocked::Wall(wall));
    }
    Ok((destination, facing))
}

/// Drive held keys at a fixed grid cadence, independent of OS key repetition.
#[derive(Default)]
pub(super) struct Repeater {
    active: Option<Action>,
    next_at: f64,
}
impl Repeater {
    pub const INTERVAL: f64 = 0.16;

    pub fn remaining(&self, now: f64) -> f64 {
        (self.next_at - now).max(0.001)
    }

    pub fn poll(&mut self, now: f64, pressed: Option<Action>, down: &[Action]) -> Option<Action> {
        let action = pressed
            .or(self.active.filter(|a| down.contains(a)))
            .or_else(|| down.first().copied());
        let fire =
            action.is_some() && (pressed.is_some() || action != self.active || now >= self.next_at);
        self.active = action;
        if fire {
            self.next_at = now + Self::INTERVAL;
            action
        } else {
            None
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn walking_is_relative_and_turning_stays_in_place() {
        let walls = vec![[0; 4]; 1024];
        let flags = [1; 256];
        for facing in 0..4 {
            for (action, offset) in [
                (Action::Forward, 0),
                (Action::Right, 1),
                (Action::Backward, 2),
                (Action::Left, 3),
            ] {
                assert_eq!(
                    advance(&walls, &flags, 171, facing, action),
                    Ok((neighbor(171, (facing + offset) % 4).unwrap(), facing))
                );
            }
            assert_eq!(
                advance(&walls, &flags, 171, facing, Action::TurnLeft),
                Ok((171, (facing + 3) % 4))
            );
            assert_eq!(
                advance(&walls, &flags, 171, facing, Action::TurnRight),
                Ok((171, (facing + 1) % 4))
            );
        }
    }

    #[test]
    fn walls_use_the_entered_face_and_boundaries_never_wrap() {
        let mut walls = vec![[0; 4]; 1024];
        let mut flags = [0; 256];
        flags[0] = 7;
        // The source and destination can intentionally have different faces.
        walls[171][2] = 1;
        assert_eq!(
            advance(&walls, &flags, 171, 2, Action::Forward),
            Ok((203, 2))
        );
        for id in [1, 2, 3, 74, 255] {
            walls[203][0] = id;
            assert_eq!(
                advance(&walls, &flags, 171, 2, Action::Forward),
                Err(Blocked::Wall(id))
            );
        }
        for (cell, direction) in [(0, 0), (31, 1), (1023, 2), (0, 3)] {
            assert_eq!(
                advance(&walls, &flags, cell, direction, Action::Forward),
                Err(Blocked::Boundary)
            );
        }
    }

    #[test]
    fn held_keys_repeat_at_a_fixed_rate_and_switch_immediately() {
        let mut repeat = Repeater::default();
        let w = Action::Forward;
        let e = Action::TurnRight;
        assert_eq!(repeat.poll(0.0, Some(w), &[w]), Some(w));
        assert_eq!(repeat.poll(0.05, None, &[w]), None); // OS repeat isn't a fresh press
        assert_eq!(repeat.poll(0.17, None, &[w]), Some(w));
        assert_eq!(repeat.poll(0.18, Some(e), &[w, e]), Some(e));
        assert_eq!(repeat.poll(0.19, Some(e), &[w, e]), Some(e)); // quick second tap
        assert_eq!(repeat.poll(0.2, None, &[w, e]), None);
        assert_eq!(repeat.poll(0.21, None, &[w]), Some(w));
        assert_eq!(repeat.poll(0.22, None, &[]), None);
        assert_eq!(repeat.poll(0.23, Some(w), &[w]), Some(w));
        // Fast taps that press and release between frames still count once.
        repeat.poll(0.24, None, &[]);
        assert_eq!(repeat.poll(0.25, Some(e), &[]), Some(e));
        assert_eq!(repeat.poll(0.5, None, &[]), None);
    }
}
