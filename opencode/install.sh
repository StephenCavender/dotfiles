#!/bin/bash
set -e

# Install OpenCode commands, skills, and universal rules to ~/.config/opencode/

OPENCODE_DIR="$(dirname "$0")"
CONFIG_DIR="$HOME/.config/opencode"

mkdir -p "$CONFIG_DIR"

# Install commands
echo "› Installing commands"
rm -rf "$CONFIG_DIR/commands"
cp -r "$OPENCODE_DIR/command" "$CONFIG_DIR/commands"

# Install skills
echo "› Installing skills"
rm -rf "$CONFIG_DIR/skills"
mkdir -p "$CONFIG_DIR/skills"
for skill in "$OPENCODE_DIR/skills"/*/; do
  [ -d "$skill" ] && cp -r "$skill" "$CONFIG_DIR/skills/$(basename "$skill")"
done

# Install universal rules (loaded in every project)
if [ -f "$OPENCODE_DIR/AGENTS.universal.md" ]; then
  echo "› Installing universal rules"
  ln -sf "$(cd "$OPENCODE_DIR" && pwd)/AGENTS.universal.md" "$CONFIG_DIR/AGENTS.md"
fi

echo "✅ OpenCode configured"
echo "   Commands: $CONFIG_DIR/commands/"
echo "   Skills:  $CONFIG_DIR/skills/"
echo "   Rules:   $CONFIG_DIR/AGENTS.md"
