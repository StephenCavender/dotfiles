#!/bin/bash
#
# Symlink ghostty config + themes so edits land in the repo.

set -e

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.config/ghostty"

mkdir -p "$TARGET_DIR"

for name in config themes; do
    dst="$TARGET_DIR/$name"
    # Preserve a pre-existing real file/dir once before replacing it with the link
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        mv "$dst" "$dst.bak.$(date +%Y%m%d%H%M%S)"
    fi
    ln -sfn "$SOURCE_DIR/$name" "$dst"
done

echo "› ghostty config linked"
