//! Disposable, original-engine playtests of an editor snapshot.
use crate::{assets, runtime};
use anyhow::{Context, Result, ensure};
use serde_json::Value;
use std::{
    fs,
    os::unix::fs::DirBuilderExt,
    path::{Component, Path, PathBuf},
    process::{Child, ExitStatus},
    sync::atomic::{AtomicU64, Ordering},
};

pub struct Snapshot {
    pub root: PathBuf,
    pub documents: Vec<(PathBuf, Value)>,
}

#[derive(Clone, Copy)]
pub struct Start {
    pub level: usize,
    pub section: usize,
    pub cell: usize,
    pub facing: usize,
}
impl Start {
    fn validate(self) -> Result<()> {
        ensure!((1..=16).contains(&self.level), "invalid test level");
        ensure!(self.section < 16, "invalid test sublevel");
        ensure!(self.cell < 1024, "test cell must be inside the map");
        ensure!(self.facing < 4, "invalid test facing");
        Ok(())
    }
}

struct Workspace(PathBuf);
impl Workspace {
    fn new() -> Result<Self> {
        static NEXT: AtomicU64 = AtomicU64::new(0);
        for _ in 0..100 {
            let path = std::env::temp_dir().join(format!(
                "eye2-playtest-{}-{}",
                std::process::id(),
                NEXT.fetch_add(1, Ordering::Relaxed)
            ));
            match fs::DirBuilder::new().mode(0o700).create(&path) {
                Ok(()) => return Ok(Self(path)),
                Err(e) if e.kind() == std::io::ErrorKind::AlreadyExists => continue,
                Err(e) => return Err(e.into()),
            }
        }
        anyhow::bail!("could not create a private playtest folder")
    }
}
impl Drop for Workspace {
    fn drop(&mut self) {
        let _ = fs::remove_dir_all(&self.0);
    }
}

pub struct Prepared {
    _workspace: Workspace,
    game: PathBuf,
}
pub struct Running {
    child: Child,
    _prepared: Prepared,
}
impl Prepared {
    pub fn launch(self) -> Result<Running> {
        let child = runtime::spawn(&self.game, false)?;
        Ok(Running {
            child,
            _prepared: self,
        })
    }
}
impl Running {
    pub fn poll(&mut self) -> Result<Option<ExitStatus>> {
        Ok(self.child.try_wait()?)
    }
    pub fn stop(&mut self) -> Result<()> {
        if self.child.try_wait()?.is_none() {
            self.child.kill()?;
        }
        self.child.wait()?;
        Ok(())
    }
}
impl Drop for Running {
    fn drop(&mut self) {
        let _ = self.stop();
    }
}

pub fn prepare(snapshot: Snapshot, start: Start) -> Result<Prepared> {
    start.validate()?;
    let workspace = Workspace::new()?;
    let root = workspace.0.canonicalize()?;
    let source = snapshot.root.canonicalize()?;
    let manifest = assets::manifest(&source)?;
    let original = PathBuf::from(&manifest.source).canonicalize()?;
    ensure!(
        !root.starts_with(&source) && !root.starts_with(&original),
        "temporary playtest folder must be outside assets and original game files"
    );
    let copy = root.join("assets");
    copy_tree(&source, &copy)?;
    for (path, value) in snapshot.documents {
        ensure!(
            path.components().all(|c| matches!(c, Component::Normal(_))),
            "invalid snapshot document path"
        );
        assets::save_json(&copy.join(path), &value)?;
    }
    let game = root.join("game");
    assets::pack(&copy, &game)?;
    let exe_path = game.join("start.exe");
    let mut exe = fs::read(&exe_path)?;
    patch_boot(&mut exe).context("this executable does not support direct playtests")?;
    let save_path = game.join("eobdata0.sav");
    let mut save = fs::read(&save_path).context("playtests need the original quick-start party")?;
    patch_save(&mut save, start)?;
    fs::write(exe_path, exe)?;
    fs::write(save_path, save)?;
    // The DOS loader requires LEVELS.TMP to exist even with no cached levels.
    // Keep the freshly packed original; patch_save clears all cache flags.
    Ok(Prepared {
        _workspace: workspace,
        game,
    })
}

fn copy_tree(source: &Path, target: &Path) -> Result<()> {
    fs::create_dir(target)?;
    for entry in fs::read_dir(source)? {
        let entry = entry?;
        let kind = entry.file_type()?;
        let destination = target.join(entry.file_name());
        if kind.is_dir() {
            copy_tree(&entry.path(), &destination)?;
        } else {
            ensure!(
                kind.is_file(),
                "unsupported asset file: {}",
                entry.path().display()
            );
            fs::copy(entry.path(), destination)?;
        }
    }
    Ok(())
}

fn patch_save(save: &mut [u8], start: Start) -> Result<()> {
    start.validate()?;
    // DOS format: 20-byte title, six 345-byte characters, then party globals.
    const PARTY: usize = 20 + 6 * 345;
    ensure!(save.len() == 46891, "unsupported quick-start save size");
    ensure!(
        save[PARTY..PARTY + 8] == [4, 0, 0, 0, 171, 0, 2, 0],
        "unsupported quick-start save layout"
    );
    save[..20].fill(0);
    save[..15].copy_from_slice(b"EDITOR PLAYTEST");
    for (i, value) in [start.level, start.section, start.cell, start.facing]
        .iter()
        .enumerate()
    {
        save[PARTY + i * 2..PARTY + i * 2 + 2].copy_from_slice(&(*value as u16).to_le_bytes());
    }
    // hasTempDataFlags: load current MAZ/INF rather than saved level snapshots.
    save[PARTY + 10..PARTY + 14].fill(0);
    Ok(())
}

fn replace(exe: &mut [u8], offset: usize, before: &[u8], after: &[u8]) -> Result<()> {
    ensure!(
        before.len() == after.len() && exe.get(offset..offset + before.len()) == Some(before),
        "unexpected game code at {offset:#x}"
    );
    exe[offset..offset + after.len()].copy_from_slice(after);
    Ok(())
}

fn patch_boot(exe: &mut Vec<u8>) -> Result<()> {
    ensure!(
        exe.len() == 333328 && exe.starts_with(b"MZ"),
        "unsupported DOS executable"
    );
    // Skip logos, retaining the word the MZ loader relocates at this call site.
    replace(
        exe,
        12800 + 0x8c50,
        &[0x9a, 0x4d, 0, 0xdd, 0x2a],
        &[0xe9, 2, 0, 0xdd, 0x2a],
    )?;
    // Main menu's initial action: load game instead of playing the intro.
    replace(exe, 0x46760 + 0x93e, &[0xbe, 4, 0], &[0xbe, 1, 0])?;
    // Save/load overlay. Extend it by two paragraphs for a startup-only slot-0
    // trampoline. Its relocation table moves with it; relocation sites stay put.
    const DESCRIPTOR: usize = 12800 + 0x2aed0;
    const CODE: usize = 0x490e0;
    const END: usize = 0x141b;
    replace(
        exe,
        DESCRIPTOR,
        &[0xcd, 0x3f, 0, 0, 0, 0xba, 0, 0, 0x1b, 0x14, 0xda, 0, 15, 0],
        &[0xcd, 0x3f, 0, 0, 0, 0xba, 0, 0, 0x3b, 0x14, 0xda, 0, 15, 0],
    )?;
    replace(
        exe,
        CODE + 0x4f1,
        &[0x90, 0x0e, 0xe8, 0x7f, 0x0d],
        &[0xe9, 0x27, 0x0f, 0x90, 0x90],
    )?;
    for (segment, offset) in [
        (0x2af4, 0xcf10u32),
        (0x2b00, 0xe8b0),
        (0x2b03, 0xea70),
        (0x2b09, 0xfb70),
        (0x2b10, 0x11a10),
    ] {
        let descriptor = 12800 + segment * 16;
        ensure!(
            exe[descriptor..descriptor + 4] == [0xcd, 0x3f, 0, 0],
            "unexpected overlay descriptor"
        );
        replace(
            exe,
            descriptor + 4,
            &offset.to_le_bytes(),
            &(offset + 32).to_le_bytes(),
        )?;
    }
    // cmp byte [9316],FF; je autoload; push cs; call picker; jmp caller;
    // autoload: xor ax,ax; jmp caller. In-game load retains the usual slot picker.
    let mut trampoline = [0x90; 32];
    trampoline[..19].copy_from_slice(&[
        0x80, 0x3e, 0x16, 0x93, 0xff, 0x74, 7, 0x0e, 0xe8, 0x4f, 0xfe, 0xe9, 0xcd, 0xf0, 0x31,
        0xc0, 0xe9, 0xc8, 0xf0,
    ]);
    exe.splice(CODE + END..CODE + END, trampoline);
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn save_only_changes_title_position_and_cache_flags() {
        let mut save: Vec<u8> = (0..46891).map(|i| (i % 251) as u8).collect();
        save[2090..2098].copy_from_slice(&[4, 0, 0, 0, 171, 0, 2, 0]);
        let before = save.clone();
        patch_save(
            &mut save,
            Start {
                level: 7,
                section: 1,
                cell: 1023,
                facing: 3,
            },
        )
        .unwrap();
        assert_eq!(&save[2090..2098], &[7, 0, 1, 0, 255, 3, 3, 0]);
        assert_eq!(&save[2100..2104], &[0; 4]);
        assert_eq!(&save[20..2090], &before[20..2090]);
        assert_eq!(&save[2098..2100], &before[2098..2100]);
        assert_eq!(&save[2104..], &before[2104..]);
        let patched = save.clone();
        assert!(
            patch_save(
                &mut save,
                Start {
                    level: 4,
                    section: 0,
                    cell: 1024,
                    facing: 0
                }
            )
            .is_err()
        );
        assert_eq!(save, patched);
    }

    #[test]
    #[ignore = "requires the extracted original game data"]
    fn boot_patch_keeps_relocations_and_later_overlays_intact() {
        let original = fs::read("assets/raw/start.exe").unwrap();
        let mut patched = original.clone();
        patch_boot(&mut patched).unwrap();
        assert_eq!(&patched[..12800], &original[..12800]);
        assert_eq!(&patched[0x4a4fb + 32..], &original[0x4a4fb..]);
        assert_eq!(patched.len(), original.len() + 32);
        assert!(patch_boot(&mut patched).is_err());
        let mut unknown = original;
        unknown[0x495d1] = 0;
        assert!(patch_boot(&mut unknown).is_err());
    }

    #[test]
    #[ignore = "requires the extracted original game data"]
    fn snapshot_uses_unsaved_edits_and_cleans_up() {
        let mut project = crate::editor::model::Project::open(Path::new("assets")).unwrap();
        let location = project.location(4, 0).unwrap();
        let path = project.root.join(format!("maps/{}.json", location.map));
        let before = fs::read(&path).unwrap();
        let old = project.maps[&location.map].walls[171][2];
        project.begin("test unsaved wall");
        project.paint(&location.map, 171, 2, old.wrapping_add(1), false);
        project.finish();
        let spawn = project.spawns(&location.script).remove(0);
        let script_path = project
            .root
            .join(format!("scripts/{}.json", location.script));
        let script_before = fs::read(&script_path).unwrap();
        project.begin("test unsaved spawn");
        project
            .move_spawns(&location.script, &[spawn.slot], 203)
            .unwrap();
        project.finish();
        let dirty = project.dirty_count();
        let prepared = prepare(
            project.snapshot(),
            Start {
                level: 4,
                section: 0,
                cell: 203,
                facing: 1,
            },
        )
        .unwrap();
        let temp = prepared._workspace.0.clone();
        let exported = fs::read(prepared.game.join(format!("{}.maz", location.map))).unwrap();
        assert_eq!(exported[6 + 171 * 4 + 2], old.wrapping_add(1));
        let encoded = fs::read(prepared.game.join(format!("{}.inf", location.script))).unwrap();
        let decoded = crate::cps::decode(&encoded).unwrap();
        let field = &project.scripts[&location.script].value["fields"][spawn.block_field];
        let offset = field["offset"].as_u64().unwrap() as usize;
        assert_eq!(&decoded.data[offset..offset + 2], &203u16.to_le_bytes());
        assert!(prepared.game.join("LEVELS.TMP").is_file());
        assert_eq!(fs::read(&path).unwrap(), before);
        assert_eq!(fs::read(&script_path).unwrap(), script_before);
        assert_eq!(project.dirty_count(), dirty);
        assert_eq!(project.undo_label(), Some("test unsaved spawn"));
        drop(prepared);
        assert!(!temp.exists());
    }
}
