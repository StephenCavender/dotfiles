#!/bin/bash
set -e

# Install OpenCode agents, commands, and skills
# Usage: opencode/install.sh [--mode personal|work]
#
# Modes:
#   personal  — shared agents/commands only (side projects, simpledex)
#   work      — shared agents/commands + work skills (otto, TeleVet)
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

mkdir -p "$CONFIG_DIR/agents"
mkdir -p "$CONFIG_DIR/skills"

# Always install shared agents and commands
echo "› Installing shared agents"
rm -rf "$CONFIG_DIR/agents"
cp -r "$OPENCODE_DIR/agent" "$CONFIG_DIR/agents"

echo "› Installing shared commands"
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
echo "   Agents:   $CONFIG_DIR/agents/"
echo "   Commands:  $CONFIG_DIR/commands/"
echo "   Skills:   $CONFIG_DIR/skills/"
