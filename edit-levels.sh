#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if [[ -x target/release/eye2 ]]; then
  exec target/release/eye2 editor "$@"
fi
exec cargo run --locked -- editor "$@"
