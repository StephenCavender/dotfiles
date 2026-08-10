#!/bin/bash
set -e

# Install OpenCode commands and skills to ~/.config/opencode/
#
# Skills live in the harness-neutral ~/.dotfiles/.agents/ directory so opencode,
# pi, and caveman can all share one source of truth. Commands stay
# opencode-specific (their format is not portable).
#
# Universal rules are NOT wired here — .agents/install.sh owns that for every
# harness, so the symlink logic lives in one place instead of four.

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


echo "✅ OpenCode configured"
echo "   Commands: $CONFIG_DIR/commands/  (opencode-specific)"
echo "   Skills:   $CONFIG_DIR/skills/    -> .agents/skills (shared)"
echo "   Rules:    handled by .agents/install.sh (shared)"
