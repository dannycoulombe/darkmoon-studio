//! Native Rust asset workbench. This is not yet the EOB2 gameplay engine.
use crate::assets::{self, numbers, read_json, read_png, rgb, write_png};
use anyhow::{Context, Result, ensure};
use libloading::Library;
use std::{
    ffi::{CString, c_char, c_int, c_void},
    fs,
    path::Path,
    time::{Duration, Instant},
};

struct Sdl {
    _lib: Library,
    window: *mut c_void,
    renderer: *mut c_void,
    texture: *mut c_void,
    poll: unsafe extern "C" fn(*mut u8) -> c_int,
    update: unsafe extern "C" fn(*mut c_void, *const c_void, *const c_void, c_int) -> c_int,
    clear: unsafe extern "C" fn(*mut c_void) -> c_int,
    copy: unsafe extern "C" fn(*mut c_void, *mut c_void, *const c_void, *const c_void) -> c_int,
    present: unsafe extern "C" fn(*mut c_void),
    title: unsafe extern "C" fn(*mut c_void, *const c_char),
    destroy_texture: unsafe extern "C" fn(*mut c_void),
    destroy_renderer: unsafe extern "C" fn(*mut c_void),
    destroy_window: unsafe extern "C" fn(*mut c_void),
    quit: unsafe extern "C" fn(),
}
impl Sdl {
    fn new() -> Result<Self> {
        unsafe {
            let lib = Library::new("libSDL2-2.0.so.0").context("install SDL2 runtime")?;
            let init: unsafe extern "C" fn(u32) -> c_int = *lib.get(b"SDL_Init\0")?;
            ensure!(init(0x20) == 0, "SDL video initialization failed");
            let create_window: unsafe extern "C" fn(
                *const c_char,
                c_int,
                c_int,
                c_int,
                c_int,
                u32,
            ) -> *mut c_void = *lib.get(b"SDL_CreateWindow\0")?;
            let create_renderer: unsafe extern "C" fn(*mut c_void, c_int, u32) -> *mut c_void =
                *lib.get(b"SDL_CreateRenderer\0")?;
            let create_texture: unsafe extern "C" fn(
                *mut c_void,
                u32,
                c_int,
                c_int,
                c_int,
            ) -> *mut c_void = *lib.get(b"SDL_CreateTexture\0")?;
            let logical: unsafe extern "C" fn(*mut c_void, c_int, c_int) -> c_int =
                *lib.get(b"SDL_RenderSetLogicalSize\0")?;
            let window = create_window(
                c"EYE2 Rust workbench".as_ptr(),
                0x2fff0000,
                0x2fff0000,
                960,
                600,
                0x24,
            );
            ensure!(!window.is_null(), "SDL window creation failed");
            let renderer = create_renderer(window, -1, 0);
            ensure!(!renderer.is_null(), "SDL renderer creation failed");
            logical(renderer, 320, 200);
            let texture = create_texture(renderer, 0x16362004, 1, 320, 200);
            ensure!(!texture.is_null(), "SDL texture creation failed");
            Ok(Self {
                poll: *lib.get(b"SDL_PollEvent\0")?,
                update: *lib.get(b"SDL_UpdateTexture\0")?,
                clear: *lib.get(b"SDL_RenderClear\0")?,
                copy: *lib.get(b"SDL_RenderCopy\0")?,
                present: *lib.get(b"SDL_RenderPresent\0")?,
                title: *lib.get(b"SDL_SetWindowTitle\0")?,
                destroy_texture: *lib.get(b"SDL_DestroyTexture\0")?,
                destroy_renderer: *lib.get(b"SDL_DestroyRenderer\0")?,
                destroy_window: *lib.get(b"SDL_DestroyWindow\0")?,
                quit: *lib.get(b"SDL_Quit\0")?,
                _lib: lib,
                window,
                renderer,
                texture,
            })
        }
    }
    fn draw(&self, px: &[u8], pal: &[u8]) -> Result<()> {
        let colors: Vec<u32> = px
            .iter()
            .map(|&p| {
                let i = p as usize * 3;
                0xff000000
                    | ((pal[i] as u32) << 16)
                    | ((pal[i + 1] as u32) << 8)
                    | pal[i + 2] as u32
            })
            .collect();
        unsafe {
            ensure!(
                (self.update)(self.texture, std::ptr::null(), colors.as_ptr().cast(), 1280) == 0,
                "SDL texture upload failed"
            );
            (self.clear)(self.renderer);
            (self.copy)(
                self.renderer,
                self.texture,
                std::ptr::null(),
                std::ptr::null(),
            );
            (self.present)(self.renderer);
        }
        Ok(())
    }
    fn label(&self, s: &str) {
        if let Ok(s) = CString::new(s) {
            unsafe { (self.title)(self.window, s.as_ptr()) }
        }
    }
}
impl Drop for Sdl {
    fn drop(&mut self) {
        unsafe {
            (self.destroy_texture)(self.texture);
            (self.destroy_renderer)(self.renderer);
            (self.destroy_window)(self.window);
            (self.quit)();
        }
    }
}

fn load(root: &Path, name: &str) -> Result<(Vec<u8>, Vec<u8>)> {
    let meta = read_json(&root.join(format!("images/{name}.json")))?;
    let pal = rgb(&numbers(&meta["palette_vga"])?);
    let (_, _, px) = read_png(&root.join(format!("images/{name}.png")), &pal)?;
    Ok((px, pal))
}
fn text(px: &mut [u8], font: &[u8], s: &str, x: i32, y: i32, c: u8) {
    let mut cx = x;
    let mut cy = y;
    for ch in s.bytes() {
        if ch == b'\n' || ch == b'\r' {
            cx = x;
            cy += 9;
            continue;
        }
        let idx = ch as usize;
        if idx >= 128 {
            continue;
        }
        if let Ok(off) = crate::cps::word(font, 2 + idx * 2) {
            for row in 0..8 {
                for bit in 0..8 {
                    if font
                        .get(off as usize + row)
                        .is_some_and(|v| v & (0x80 >> bit) != 0)
                    {
                        let dx = cx + bit;
                        let dy = cy + row as i32;
                        if (0..320).contains(&dx) && (0..200).contains(&dy) {
                            px[dy as usize * 320 + dx as usize] = c;
                        }
                    }
                }
            }
        }
        cx += 8;
    }
}

pub fn run(root: &Path, screenshot: Option<&Path>, frames: Option<u32>) -> Result<()> {
    let m = assets::manifest(root)?;
    let names: Vec<String> = m
        .files
        .iter()
        .filter(|e| e.kind == "cps")
        .map(|e| {
            Path::new(&e.name)
                .file_stem()
                .unwrap()
                .to_string_lossy()
                .to_lowercase()
        })
        .collect();
    let mut index = names.iter().position(|x| x == "menu").unwrap_or(0);
    let font = fs::read(root.join("raw/font8.fnt"))?;
    let sdl = Sdl::new()?;
    let mut counter = 0;
    let mut map = false;
    let mut level = 4;
    let mut pos = (11usize, 5usize);
    let mut dir = 2usize;
    let mut last = load(root, &names[index])?;
    let mut dirty = true;
    let mut event = [0u32; 16];
    'run: loop {
        let start = Instant::now();
        while unsafe { (sdl.poll)(event.as_mut_ptr().cast()) } != 0 {
            if event[0] == 0x100 {
                break 'run;
            }
            if event[0] == 0x300 {
                let key = event[5] as i32;
                match key {
                    27 => break 'run,
                    109 => {
                        map = !map;
                        if !map {
                            last = load(root, &names[index])?;
                        }
                        dirty = true;
                    }
                    114 => {
                        last = load(root, &names[index])?;
                        dirty = true;
                    }
                    91 if map => {
                        level = if level == 1 { 15 } else { level - 1 };
                        dirty = true;
                    }
                    93 if map => {
                        level = if level == 15 { 1 } else { level + 1 };
                        dirty = true;
                    }
                    1073741904 if !map => {
                        index = (index + names.len() - 1) % names.len();
                        last = load(root, &names[index])?;
                        dirty = true;
                    }
                    1073741903 if !map => {
                        index = (index + 1) % names.len();
                        last = load(root, &names[index])?;
                        dirty = true;
                    }
                    97 if map => {
                        dir = (dir + 3) % 4;
                        dirty = true;
                    }
                    100 if map => {
                        dir = (dir + 1) % 4;
                        dirty = true;
                    }
                    119 | 1073741906 | 115 | 1073741905 if map => {
                        let back = key == 115 || key == 1073741905;
                        let d = (dir + if back { 2 } else { 0 }) % 4;
                        let v = read_json(&root.join(format!("maps/level{level}.json")))?;
                        let walls = numbers(&v["cells"][pos.1 * 32 + pos.0]["walls"])?;
                        if walls[d] == 0 {
                            let (dx, dy) = [(0, -1), (1, 0), (0, 1), (-1, 0)][d];
                            pos = (
                                ((pos.0 as i32 + dx).rem_euclid(32)) as usize,
                                ((pos.1 as i32 + dy).rem_euclid(32)) as usize,
                            );
                        }
                        dirty = true;
                    }
                    _ => {}
                }
            }
        }
        if dirty {
            if map {
                let v = read_json(&root.join(format!("maps/level{level}.json")))?;
                let mut px = vec![0u8; 64000];
                let mut pal = vec![0; 768];
                pal[3..6].copy_from_slice(&[110, 125, 105]);
                pal[6..9].copy_from_slice(&[255, 200, 80]);
                pal[9..12].copy_from_slice(&[255, 255, 255]);
                for y in 0..32 {
                    for x in 0..32 {
                        let walls = numbers(&v["cells"][y * 32 + x]["walls"])?;
                        let sx = 80 + x * 5;
                        let sy = 10 + y * 5;
                        for i in 0..5 {
                            if walls[0] != 0 {
                                px[sy * 320 + sx + i] = 1;
                            }
                            if walls[1] != 0 {
                                px[(sy + i) * 320 + sx + 4] = 1;
                            }
                            if walls[2] != 0 {
                                px[(sy + 4) * 320 + sx + i] = 1;
                            }
                            if walls[3] != 0 {
                                px[(sy + i) * 320 + sx] = 1;
                            }
                        }
                    }
                }
                let p = (10 + pos.1 * 5 + 2) * 320 + 80 + pos.0 * 5 + 2;
                px[p] = 2;
                let delta = [-320i32, 1, 320, -1][dir];
                px[(p as i32 + delta) as usize] = 2;
                text(
                    &mut px,
                    &font,
                    &format!("MAP {level}  {},{}", pos.0, pos.1),
                    8,
                    176,
                    3,
                );
                text(&mut px, &font, "[ ] LEVEL  WASD MOVE", 8, 187, 3);
                sdl.label("EYE2 Rust map inspection - no monsters, scripts, or game simulation");
                last = (px, pal);
            } else {
                sdl.label(&format!(
                    "EYE2 Rust asset viewer - {} - arrows: browse | M: map | R: reload | Esc: exit",
                    names[index]
                ));
            }
            dirty = false;
        }
        sdl.draw(&last.0, &last.1)?;
        counter += 1;
        if frames.is_some_and(|n| counter >= n) {
            break;
        }
        if let Some(wait) = Duration::from_millis(16).checked_sub(start.elapsed()) {
            std::thread::sleep(wait);
        }
    }
    if let Some(path) = screenshot {
        write_png(path, 320, 200, &last.0, &last.1)?;
    }
    Ok(())
}
