#!/bin/bash
#
# Symlink starship config so edits land in the repo.

set -e

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
dst="$HOME/.config/starship.toml"

mkdir -p "$HOME/.config"
# Preserve a pre-existing real file once before replacing it with the link
if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mv "$dst" "$dst.bak.$(date +%Y%m%d%H%M%S)"
fi
ln -sfn "$SOURCE_DIR/starship.toml" "$dst"

echo "› starship config linked"
