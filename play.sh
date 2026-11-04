#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if [[ ! -f assets/manifest.json ]]; then
  cargo run --locked -- extract --source "${EYE2_SOURCE:-/home/dcoulombe/Games/DOS/EYE2}"
fi
exec cargo run --locked -- play "$@"
