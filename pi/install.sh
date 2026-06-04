#!/bin/bash
set -e

# Install pi (earendil-works/pi) config to ~/.pi/agent/
#
# Shares the same .agents/skills directory as opencode and caveman.
# pi has no MCP support by design — capabilities live in skills (CLI tools +
# README), so the shared skills dir is the whole integration surface.
#
# Does NOT install pi itself. Run separately when ready (official installer —
# wraps `npm install -g --ignore-scripts @earendil-works/pi-coding-agent`):
#   curl -fsSL https://pi.dev/install.sh | sh

PI_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_ROOT="$(cd "$PI_DIR/.." && pwd)"
AGENTS_DIR="$DOTFILES_ROOT/.agents"
CONFIG_DIR="$HOME/.pi/agent"

mkdir -p "$CONFIG_DIR"

# Settings (points skills[] at the shared .agents/skills dir)
echo "› Installing pi settings"
ln -sf "$PI_DIR/settings.json" "$CONFIG_DIR/settings.json"

# Universal rules — pi auto-loads ~/.pi/agent/AGENTS.md globally
if [ -f "$AGENTS_DIR/AGENTS.universal.md" ]; then
  echo "› Installing universal rules"
  ln -sf "$AGENTS_DIR/AGENTS.universal.md" "$CONFIG_DIR/AGENTS.md"
fi

echo "✅ pi configured"
echo "   Settings: $CONFIG_DIR/settings.json -> dotfiles/pi/settings.json"
echo "   Skills:   .agents/skills (via settings skills[])"
echo "   Rules:    $CONFIG_DIR/AGENTS.md -> .agents/AGENTS.universal.md (shared)"
echo ""
echo "   pi not installed. To install:"
echo "     curl -fsSL https://pi.dev/install.sh | sh"
