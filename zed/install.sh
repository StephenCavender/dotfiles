#!/usr/bin/env bash
#
# Symlink zed settings so edits made in Zed's UI land in the repo.

set -e

SRC="$(cd "$(dirname "$0")" && pwd)/settings.json"
DST="$HOME/.config/zed/settings.json"

mkdir -p "$(dirname "$DST")"

# Preserve a pre-existing real file once before replacing it with the link
if [ -f "$DST" ] && [ ! -L "$DST" ]; then
    mv "$DST" "$DST.bak.$(date +%Y%m%d%H%M%S)"
fi

ln -sfn "$SRC" "$DST"
echo "› zed settings linked"
