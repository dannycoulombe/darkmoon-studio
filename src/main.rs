mod assets;
mod cps;
mod editor;
mod exe;
mod inf;
mod inf_script;
mod native;
mod playtest;
mod runtime;
mod soundbank;
mod speaker;
mod sprites;

use anyhow::Result;
use clap::{Parser, Subcommand};
use std::path::PathBuf;

#[derive(Parser)]
#[command(version, about)]
struct Cli {
    #[command(subcommand)]
    command: Command,
}
#[derive(Subcommand)]
enum Command {
    /// Open Darkmoon Studio, the native Linux visual level editor.
    Editor {
        #[arg(long, default_value = "assets")]
        assets: PathBuf,
        #[arg(long, default_value = "runtime")]
        runtime: PathBuf,
        #[arg(long, default_value_t = 4)]
        level: usize,
    },
    /// Render every distinct PC speaker program to WAV, with an alias index.
    RenderSounds {
        #[arg(long, default_value = "assets")]
        assets: PathBuf,
        #[arg(long, default_value_t = 30)]
        seconds: u32,
        #[arg(long, default_value = "assets/audio/wav")]
        output: PathBuf,
    },
    /// Render a decoded PC speaker track to a standard PCM WAV using Rust.
    RenderSound {
        #[arg(long, default_value = "assets")]
        assets: PathBuf,
        #[arg(long, default_value = "intro")]
        bank: String,
        #[arg(long, default_value_t = 1)]
        track: usize,
        #[arg(long, default_value_t = 30)]
        seconds: u32,
        #[arg(long, default_value = "preview.wav")]
        output: PathBuf,
    },
    /// Decode original assets into PNG and editable JSON, retaining all originals.
    Extract {
        #[arg(long, default_value = "/home/dcoulombe/Games/DOS/EYE2")]
        source: PathBuf,
        #[arg(long, default_value = "assets")]
        output: PathBuf,
    },
    /// Rebuild a separate DOS game directory using the edited assets.
    Pack {
        #[arg(long, default_value = "assets")]
        assets: PathBuf,
        #[arg(long, default_value = "runtime")]
        output: PathBuf,
    },
    /// Play the complete original game with repacked assets (DOSBox backend).
    Play {
        #[arg(long, default_value = "assets")]
        assets: PathBuf,
        #[arg(long, default_value = "runtime")]
        runtime: PathBuf,
        #[arg(long)]
        no_pack: bool,
        #[arg(long)]
        fullscreen: bool,
    },
    /// Native Rust asset and map viewer (not a gameplay engine).
    Native {
        #[arg(long, default_value = "assets")]
        assets: PathBuf,
        #[arg(long)]
        screenshot: Option<PathBuf>,
        #[arg(long)]
        frames: Option<u32>,
    },
    /// Analyze a 16-bit MZ executable and emit assembly and function candidates.
    Analyze {
        #[arg(long, default_value = "/home/dcoulombe/Games/DOS/EYE2/start.exe")]
        exe: PathBuf,
        #[arg(long, default_value = "analysis")]
        output: PathBuf,
    },
    /// Verify every editable asset against the original decoded content.
    Verify {
        #[arg(long, default_value = "assets")]
        assets: PathBuf,
    },
}
fn main() -> Result<()> {
    match Cli::parse().command {
        Command::Editor {
            assets,
            runtime,
            level,
        } => editor::run(assets, runtime, level),
        Command::RenderSounds {
            assets,
            seconds,
            output,
        } => speaker::render_all(&assets, &output, seconds),
        Command::RenderSound {
            assets,
            bank,
            track,
            seconds,
            output,
        } => speaker::render(&assets, &bank, track, seconds, &output),
        Command::Extract { source, output } => assets::extract(&source, &output),
        Command::Pack { assets, output } => assets::pack(&assets, &output),
        Command::Play {
            assets,
            runtime,
            no_pack,
            fullscreen,
        } => {
            if !no_pack {
                assets::pack(&assets, &runtime)?;
            }
            runtime::play(&runtime, fullscreen)
        }
        Command::Native {
            assets,
            screenshot,
            frames,
        } => native::run(&assets, screenshot.as_deref(), frames),
        Command::Analyze { exe, output } => exe::analyze(&exe, &output),
        Command::Verify { assets } => assets::verify(&assets),
    }
}
