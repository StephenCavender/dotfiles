#!/bin/bash
set -e

# Install pi (earendil-works/pi) config to ~/.pi/agent/
#
# Shares the same .agents/skills directory as opencode and caveman.
# pi has no MCP support by design — capabilities live in skills (CLI tools +
# README), so the shared skills dir is the whole integration surface.
#
# Universal rules are NOT wired here — .agents/install.sh owns that for every
# harness, so the symlink logic lives in one place instead of four.
#
# Does NOT install pi itself. Run separately when ready (official installer —
# wraps `npm install -g --ignore-scripts @earendil-works/pi-coding-agent`):
#   curl -fsSL https://pi.dev/install.sh | sh

PI_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.pi/agent"

mkdir -p "$CONFIG_DIR"

# Settings (points skills[] at the shared .agents/skills dir)
echo "› Installing pi settings"
ln -sf "$PI_DIR/settings.json" "$CONFIG_DIR/settings.json"

echo "✅ pi configured"
echo "   Settings: $CONFIG_DIR/settings.json -> dotfiles/pi/settings.json"
echo "   Skills:   .agents/skills (via settings skills[])"
echo "   Rules:    handled by .agents/install.sh (shared)"

# pi ships via its own installer, not this repo — only nudge when it is absent.
if command -v pi > /dev/null 2>&1; then
  echo "   Binary:   $(command -v pi)"
else
  echo ""
  echo "   pi not installed. To install:"
  echo "     curl -fsSL https://pi.dev/install.sh | sh"
fi
