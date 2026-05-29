#!/bin/bash
set -e

# Install OpenCode commands and skills
# Usage: opencode/install.sh [--mode personal|work]
#
# Modes:
#   personal  — shared commands only (side projects)
#   work      — shared commands + work skills (otto, TeleVet)
#
# Default: personal

MODE="personal"
for arg in "$@"; do
  case "$arg" in
    --mode) shift; MODE="$1"; shift ;;
    personal|work) MODE="$arg"; shift ;;
  esac
done

OPENCODE_DIR="$(dirname "$0")"
CONFIG_DIR="$HOME/.config/opencode"

mkdir -p "$CONFIG_DIR/skills"

# Install commands
echo "› Installing commands"
rm -rf "$CONFIG_DIR/commands"
cp -r "$OPENCODE_DIR/command" "$CONFIG_DIR/commands"

# Install skills based on mode
echo "› Installing skills (mode: $MODE)"
rm -rf "$CONFIG_DIR/skills"
mkdir -p "$CONFIG_DIR/skills"

# Shared skills (always)
if [ -d "$OPENCODE_DIR/skills/shared" ]; then
  for skill in "$OPENCODE_DIR/skills/shared"/*/; do
    [ -d "$skill" ] && cp -r "$skill" "$CONFIG_DIR/skills/"
  done
fi

# Mode-specific skills
if [ -d "$OPENCODE_DIR/skills/$MODE" ]; then
  for skill in "$OPENCODE_DIR/skills/$MODE"/*/; do
    [ -d "$skill" ] && cp -r "$skill" "$CONFIG_DIR/skills/"
  done
fi

# Write current mode to a state file for reference
echo "$MODE" > "$CONFIG_DIR/.mode"

echo "✅ OpenCode configured (mode: $MODE)"
echo "   Commands: $CONFIG_DIR/commands/"
echo "   Skills:  $CONFIG_DIR/skills/"
