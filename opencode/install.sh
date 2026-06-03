#!/bin/bash
set -e

# Install OpenCode commands, skills, and universal rules to ~/.config/opencode/

OPENCODE_DIR="$(dirname "$0")"
CONFIG_DIR="$HOME/.config/opencode"

mkdir -p "$CONFIG_DIR"

# Install commands
echo "› Installing commands"
rm -rf "$CONFIG_DIR/commands"
ln -sf "$(cd "$OPENCODE_DIR" && pwd)/command" "$CONFIG_DIR/commands"

# Install skills
echo "› Installing skills"
rm -rf "$CONFIG_DIR/skills"
ln -sf "$(cd "$OPENCODE_DIR" && pwd)/skills" "$CONFIG_DIR/skills"

# Install universal rules (loaded in every project)
if [ -f "$OPENCODE_DIR/AGENTS.universal.md" ]; then
  echo "› Installing universal rules"
  ln -sf "$(cd "$OPENCODE_DIR" && pwd)/AGENTS.universal.md" "$CONFIG_DIR/AGENTS.md"
fi

echo "✅ OpenCode configured"
echo "   Commands: $CONFIG_DIR/commands/"
echo "   Skills:  $CONFIG_DIR/skills/"
echo "   Rules:   $CONFIG_DIR/AGENTS.md"
