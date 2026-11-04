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
# Installs pi itself via the official installer when it is missing (see bottom).

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

# pi ships via its own installer (managed install: own dir, independent of the
# mise node version). Piped through cat so stdout isn't a TTY and the
# installer skips its "Start pi now?" prompt mid-install.
if command -v pi > /dev/null 2>&1; then
  echo "   Binary:   $(command -v pi)"
else
  echo "› Installing pi"
  if command -v mise > /dev/null 2>&1; then
    curl -fsSL https://pi.dev/install.sh | mise exec node@lts -- sh | cat
  else
    curl -fsSL https://pi.dev/install.sh | sh | cat
  fi
fi
