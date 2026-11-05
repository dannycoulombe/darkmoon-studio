#!/usr/bin/env python3
"""Export original EOB II AdLib music/cues as WAV without building the app."""
import argparse
import array
import hashlib
import json
import math
import os
from pathlib import Path
import shutil
import struct
import subprocess
import tempfile
import wave

ROOT = Path(__file__).resolve().parent.parent
OPS = json.loads((ROOT / "data/adlib-opcodes.json").read_text())
RATE = 44100


def word(data, offset, signed=False):
    return struct.unpack_from("<h" if signed else "<H", data, offset)[0]


def inspect_bank(data):
    """Find channel-nine music starters; exclude reset/fade-only commands."""
    if len(data) < 1120:
        raise ValueError("truncated AdLib v2 bank")
    body = data[120:]
    offsets = struct.unpack_from("<250H", body)

    def program_start(program):
        if program >= 250:
            raise ValueError(f"invalid program {program}")
        start = offsets[program]
        if not 1000 <= start < len(body) - 2 or body[start] > 9:
            raise ValueError(f"invalid program offset {start}")
        return start + 2

    def walk(start, children=False):
        pending, seen = [start], {}
        while pending:
            pos = pending.pop()
            if pos in seen:
                continue
            if not 1000 <= pos < len(body):
                raise ValueError(f"instruction outside bank: {pos}")
            op = body[pos]
            spec = OPS[min(op & 127, len(OPS) - 1)] if op >= 128 else None
            name = spec["name"] if spec else "note"
            end = pos + 1 + (spec["arguments"] if spec else 1)
            if end > len(body):
                raise ValueError(f"truncated instruction at {pos}")
            seen[pos] = (name, end)
            if name in ("jump", "checkRepeat"):
                pending.append(end + word(body, pos + 1, signed=True))
            if name == "jumpToSubroutine":
                pending.append(word(body, pos + 1, signed=True) - 191)
            if name == "setupProgram" and children and body[pos + 1] != 255:
                pending.append(program_start(body[pos + 1]))
            if name not in ("stopChannel", "returnFromSubroutine", "jump"):
                pending.append(end)
        return seen

    aliases = {}
    for track, program in enumerate(data[:120]):
        if program == 255:
            continue
        start = program_start(program)
        if body[start - 2] == 9:
            code = walk(start)
            if any(name == "setupProgram" for name, _ in code.values()):
                aliases.setdefault(offsets[program], []).append(track)

    # AdPlug assumes v3. EOB II v2 CALLs use absolute offsets minus 191;
    # v3 uses displacements from the next instruction (reference/adlib.cpp).
    # Adjust only reachable CALL operands in the temporary playback copy.
    playback = bytearray(data)
    calls = set()
    for offset in aliases:
        for pos, (name, end) in walk(offset + 2, children=True).items():
            if name == "jumpToSubroutine":
                target = word(body, pos + 1, signed=True) - 191
                struct.pack_into("<H", playback, 120 + pos + 1, (target - end) & 65535)
                calls.add(pos)
    return aliases, bytes(playback), len(calls)


def player_command():
    local = ROOT / "tools/adplay/usr/bin/adplay"
    player = os.environ.get("EYE2_ADPLAY") or (str(local) if local.exists() else shutil.which("adplay"))
    if not player:
        raise ValueError("AdPlay is required; run python3 tools/bootstrap.py --adplay")
    env = os.environ.copy()
    if Path(player).resolve() == local.resolve():
        libs = str(ROOT / "tools/adplay/usr/lib/x86_64-linux-gnu")
        env["LD_LIBRARY_PATH"] = libs + os.pathsep + env.get("LD_LIBRARY_PATH", "")
    return player, env


def render(player, env, bank, track, destination, seconds):
    command = [player, "-O", "disk", "-d", "-", "-s", str(track), "-o",
               "-e", "nuked", "-f", str(RATE), "--16bit", "--stereo", str(bank)]
    limit = seconds * RATE * 4
    count, squares, peak = 0, 0, 0
    with tempfile.TemporaryFile() as log:
        process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=log, env=env)
        try:
            # AdPlay's stdout WAV header has placeholder lengths (pipes cannot
            # seek). Write a fresh header with the actual captured frame count.
            header = process.stdout.read(44)
            if (len(header) != 44 or header[:4] != b"RIFF" or header[8:16] != b"WAVEfmt "
                    or header[20:36] != struct.pack("<HHIIHH", 1, 2, RATE, RATE * 4, 4, 16)
                    or header[36:40] != b"data"):
                raise ValueError("AdPlay did not produce 44.1 kHz stereo PCM")
            with wave.open(str(destination), "wb") as output:
                output.setparams((2, 2, RATE, 0, "NONE", "not compressed"))
                while count < limit:
                    block = process.stdout.read(min(65536, limit - count))
                    if not block:
                        break
                    if len(block) % 4:
                        raise ValueError("incomplete PCM frame")
                    output.writeframesraw(block)
                    samples = array.array("h", block)
                    peak = max(peak, max(map(abs, samples), default=0))
                    squares += sum(sample * sample for sample in samples)
                    count += len(block)
            capped = count == limit
            if capped:
                process.terminate()
            process.stdout.close()
            status = process.wait(timeout=10)
            if status and not capped:
                raise ValueError(f"AdPlay failed with status {status}")
            if not count or not peak:
                raise ValueError("music export is empty or silent")
        except BaseException as error:
            process.kill()
            process.wait()
            log.seek(0)
            raise RuntimeError(f"{bank.stem} track {track}: {error}\n{log.read().decode(errors='replace')}") from error
    return {"seconds": count / (RATE * 4), "duration_capped": capped,
            "peak": peak, "rms": math.sqrt(squares / (count // 2))}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--assets", type=Path, default=Path("assets"))
    parser.add_argument("--output", type=Path, help="default: ASSETS/audio/music")
    parser.add_argument("--seconds", type=int, default=600, help="maximum per track (default: 600)")
    args = parser.parse_args()
    if not 1 <= args.seconds <= 1800:
        parser.error("--seconds must be 1..1800")
    output = args.output or args.assets / "audio/music"
    if output.exists():
        parser.error(f"{output} exists; choose a new --output to protect existing exports")
    player, env = player_command()
    manifest = json.loads((args.assets / "manifest.json").read_text())
    banks = sorted(entry["name"] for entry in manifest["files"] if entry["kind"] == "adl")
    if not banks:
        parser.error("no AdLib banks in assets manifest")
    output.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix=".music-", dir=output.parent) as staging:
        staging = Path(staging)
        exported = staging / "export"
        exported.mkdir()
        tracks = []
        for name in banks:
            original = (args.assets / "raw" / name).read_bytes()
            aliases, playback, call_count = inspect_bank(original)
            bank = staging / name
            bank.write_bytes(playback)
            directory = exported / bank.stem.lower()
            directory.mkdir()
            for offset, track_aliases in aliases.items():
                track = track_aliases[0]
                relative = Path(directory.name) / f"track-{track:03}.wav"
                path = exported / relative
                info = render(player, env, bank, track, path, args.seconds)
                tracks.append({"file": relative.as_posix(), "bank": name,
                               "track_aliases": track_aliases, "program": original[track],
                               "program_offset": offset,
                               "source_sha256": hashlib.sha256(original).hexdigest(),
                               "playback_call_adjustments": call_count, **info})
                print(f"{relative}: {info['seconds']:.2f}s" + (" (capped)" if info["duration_capped"] else ""), flush=True)
        index = {"format": 1, "renderer": "AdPlay / AdPlug, Nuked OPL3",
                 "sample_rate": RATE, "channels": 2, "bits_per_sample": 16,
                 "maximum_seconds": args.seconds,
                 "notes": "Original AdLib channel-nine music starters, including short musical cues. "
                          "Reset/fade-only tracks and ordinary sound effects are excluded. "
                          "Aliases share a program offset within one bank. Playback ends at "
                          "AdPlug's first-loop/end detection or the duration limit; these WAVs "
                          "are derived previews, not repack inputs.", "tracks": tracks}
        (exported / "index.json").write_text(json.dumps(index, indent=2) + "\n")
        (exported / "playlist.m3u").write_text("#EXTM3U\n" + "".join(
            f"#EXTINF:{track['seconds']:.3f},{track['bank']} track {track['track_aliases'][0]}\n{track['file']}\n"
            for track in tracks))
        exported.rename(output)
    print(f"Exported {len(tracks)} music/cue tracks from {len(banks)} banks to {output}")


if __name__ == "__main__":
    main()
