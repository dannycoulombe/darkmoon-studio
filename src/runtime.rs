use anyhow::{Context, Result, ensure};
use std::{
    ffi::OsStr,
    fs,
    path::Path,
    process::{Child, Command},
};

fn keyboard_mapper(executable: &OsStr) -> &'static str {
    // Classic DOSBox uses SDL 1.2 key symbols; Staging uses SDL2 scancodes.
    // Each map preserves the keyboard and keypad, aliases WASD/QE to movement,
    // and uses Scroll Lock as a modifier for typing those letters normally.
    // DOSBox replaces all bindings when loading a map, so it must be complete.
    let classic = Command::new(executable)
        .arg("-version")
        .output()
        .is_ok_and(|output| String::from_utf8_lossy(&output.stdout).contains("DOSBox version 0."));
    if classic {
        include_str!("../resources/eye2-keyboard-sdl1.map")
    } else {
        include_str!("../resources/eye2-keyboard-sdl2.map")
    }
}

pub fn play(path: &Path, fullscreen: bool) -> Result<()> {
    let status = spawn(path, fullscreen)?.wait()?;
    ensure!(status.success(), "DOSBox exited with {status}");
    Ok(())
}

pub fn spawn(path: &Path, fullscreen: bool) -> Result<Child> {
    let path = path.canonicalize()?;
    ensure!(
        path.join("start.exe").exists(),
        "runtime has no start.exe; run extract and pack first"
    );
    let bundled = Path::new(env!("CARGO_MANIFEST_DIR")).join("tools/dosbox-staging/dosbox");
    let executable = std::env::var_os("EYE2_DOSBOX").unwrap_or_else(|| {
        if bundled.exists() {
            bundled.into_os_string()
        } else {
            "dosbox".into()
        }
    });
    fs::write(path.join("eye2-keyboard.map"), keyboard_mapper(&executable))?;
    let config = path.join("eye2-dosbox.conf");
    let captures = path.join("captures");
    fs::create_dir_all(&captures)?;
    fs::write(
        &config,
        format!(
            "[sdl]\nfullscreen={}\nfulldouble=false\nfullresolution=desktop\nwindowresolution=960x600\noutput=surface\nautolock=false\nusescancodes=true\nmapperfile=eye2-keyboard.map\n[dosbox]\nmachine=svga_s3\nmemsize=16\ncaptures={}\n[render]\naspect=true\nscaler=normal3x\n[cpu]\ncore=auto\ncputype=auto\ncycles=fixed 12000\n[mixer]\nrate=44100\nblocksize=1024\nprebuffer=30\n[sblaster]\nsbtype=sb16\nsbbase=220\nirq=7\ndma=1\nhdma=5\noplmode=auto\noplemu=default\noplrate=44100\n[midi]\nmpu401=intelligent\nmididevice=none\n",
            fullscreen,
            captures.display()
        ),
    )?;
    // A working directory plus `mount c .` avoids shell / DOS quoting of paths.
    let mut cmd = Command::new(executable);
    // SDL 1.2 compatibility on this Wayland desktop crashes unless X11 is explicit.
    if std::env::var_os("DISPLAY").is_some() && std::env::var_os("SDL_VIDEODRIVER").is_none() {
        cmd.env("SDL_VIDEODRIVER", "x11");
    }
    cmd.current_dir(&path)
        .arg("-conf")
        .arg(&config)
        .arg("-noconsole")
        .args([
            "-c",
            "mount c .",
            "-c",
            "c:",
            "-c",
            "start.exe",
            "-c",
            "exit",
        ])
        .spawn()
        .context("DOSBox is required for the complete-game backend")
}
