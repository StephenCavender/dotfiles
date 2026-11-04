#!/bin/sh
#
# mise global config (runtime versions). Symlinked so `mise use -g` edits land in the repo.

set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$HOME/.config/mise"
ln -sf "$DIR/config.toml" "$HOME/.config/mise/config.toml"

if command -v mise > /dev/null 2>&1; then
  mise install
fi

echo "  mise config linked"
