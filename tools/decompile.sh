#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
game_exe="${1:-/home/dcoulombe/Games/DOS/EYE2/start.exe}"
mkdir -p tools/ghidra-project analysis/decompiled
tools/ghidra_11.3.2_PUBLIC/support/analyzeHeadless \
  tools/ghidra-project eye2-generated \
  -import "$game_exe" -overwrite \
  -scriptPath "$PWD/tools" \
  -postScript DecompileAll.java "$PWD/analysis/decompiled" \
  -analysisTimeoutPerFile 600 -max-cpu 4
