#!/usr/bin/env bash
# Capture a fresh editor window on a private display, without building the app.
set -euo pipefail

repo="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
if [[ ${1:-} == --help || ${1:-} == -h ]]; then
  cat <<'EOF'
Usage: ./screenshot.sh [output.png] [editor arguments...]

Launch the existing release executable on a private Xvfb display, capture its
window as a PNG, then close that instance. No build is performed.
Default output: verification/screenshot.png (replaced on each run).
Every capture also updates resources/darkmoon-studio-screenshot.png in README.
Editor arguments, such as --level 4 or --assets /path/to/assets, follow the path.
Requires ImageMagick's import, xwininfo, and Xvfb (system or tools/xvfb).
EOF
  exit 0
fi

output="${1:-$repo/verification/screenshot.png}"
if (( $# )); then shift; fi
if [[ $output != /* ]]; then output="$PWD/$output"; fi

fail() { printf 'Screenshot failed: %s\n' "$*" >&2; exit 1; }
for dependency in import xwininfo; do
  command -v "$dependency" >/dev/null || fail "Install $dependency first."
done
[[ -x $repo/target/release/eye2 ]] || fail 'Missing target/release/eye2; provide a release executable first.'

xvfb="$(command -v Xvfb || true)"
xvfb_env=()
if [[ -z $xvfb ]]; then
  xvfb="$repo/tools/xvfb/usr/bin/Xvfb"
  [[ -x $xvfb ]] || fail 'Install Xvfb or provide tools/xvfb/usr/bin/Xvfb.'
  xvfb_env=("LD_LIBRARY_PATH=$repo/tools/xvfb/usr/lib/x86_64-linux-gnu${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}")
fi

mkdir -p -- "$(dirname -- "$output")"
work="$(mktemp -d)"
server_pid=
app_pid=
cleanup() {
  local status=$?
  trap - EXIT
  if [[ -n $app_pid ]]; then
    kill "$app_pid" 2>/dev/null || true
    wait "$app_pid" 2>/dev/null || true
  fi
  if [[ -n $server_pid ]]; then
    kill "$server_pid" 2>/dev/null || true
    wait "$server_pid" 2>/dev/null || true
  fi
  if (( status != 0 )); then
    cat "$work/xvfb.log" "$work/app.log" 2>/dev/null >&2 || true
  fi
  rm -rf -- "$work"
  exit "$status"
}
trap cleanup EXIT
trap 'exit 130' INT
trap 'exit 143' TERM

# Let Xvfb choose a free display; never reuse or stop another X server.
env "${xvfb_env[@]}" "$xvfb" -displayfd 3 -screen 0 1600x1000x24 -nolisten tcp \
  3>"$work/display" >"$work/xvfb.log" 2>&1 &
server_pid=$!
for (( attempt=0; attempt<100; attempt++ )); do
  [[ -s $work/display ]] && break
  kill -0 "$server_pid" 2>/dev/null || fail 'Xvfb exited before opening a display.'
  sleep 0.1
done
[[ -s $work/display ]] || fail 'Timed out waiting for Xvfb.'
display=":$(<"$work/display")"

cd -- "$repo"
env -u WAYLAND_DISPLAY DISPLAY="$display" WINIT_UNIX_BACKEND=x11 \
  "$repo/target/release/eye2" editor "$@" >"$work/app.log" 2>&1 &
app_pid=$!
window=
for (( attempt=0; attempt<150; attempt++ )); do
  kill -0 "$app_pid" 2>/dev/null || fail 'The editor exited before its window appeared.'
  window="$(DISPLAY="$display" xwininfo -root -tree | awk '
    /"Darkmoon Studio/ { print $1; exit }
  ')"
  [[ -n $window ]] && break
  sleep 0.1
done
[[ -n $window ]] || fail 'Timed out waiting for the editor window.'
# Allow asset loading and the first rendered frames to finish.
sleep 2
DISPLAY="$display" import -window "$window" "png:$work/screenshot.png"
cp -- "$work/screenshot.png" "$output"
cp -- "$work/screenshot.png" "$repo/resources/darkmoon-studio-screenshot.png"
printf 'Screenshot saved to %s\n' "$output"
printf 'README screenshot updated.\n'
