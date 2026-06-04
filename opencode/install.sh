#!/bin/bash
set -e

# Install OpenCode commands, skills, and universal rules to ~/.config/opencode/
#
# Skills and universal rules now live in the harness-neutral ~/.dotfiles/.agents/
# directory so opencode, pi, and caveman can all share one source of truth.
# Commands stay opencode-specific (their format is not portable).

OPENCODE_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_ROOT="$(cd "$OPENCODE_DIR/.." && pwd)"
AGENTS_DIR="$DOTFILES_ROOT/.agents"
CONFIG_DIR="$HOME/.config/opencode"

mkdir -p "$CONFIG_DIR"

# Install commands (opencode-specific format)
echo "› Installing commands"
rm -rf "$CONFIG_DIR/commands"
ln -sf "$OPENCODE_DIR/command" "$CONFIG_DIR/commands"

# Install shared skills (from .agents/, shared across harnesses)
echo "› Installing skills (shared from .agents/)"
rm -rf "$CONFIG_DIR/skills"
ln -sf "$AGENTS_DIR/skills" "$CONFIG_DIR/skills"

# Install universal rules (loaded in every project)
if [ -f "$AGENTS_DIR/AGENTS.universal.md" ]; then
  echo "› Installing universal rules"
  ln -sf "$AGENTS_DIR/AGENTS.universal.md" "$CONFIG_DIR/AGENTS.md"
fi

echo "✅ OpenCode configured"
echo "   Commands: $CONFIG_DIR/commands/  (opencode-specific)"
echo "   Skills:   $CONFIG_DIR/skills/    -> .agents/skills (shared)"
echo "   Rules:    $CONFIG_DIR/AGENTS.md  -> .agents/AGENTS.universal.md (shared)"
