#!/usr/bin/env bash

set -e

SRC="$(dirname "$0")/settings.json"

if [ ! -f "$SRC" ]; then
    echo "zed/settings.json not found, skipping" >&2
    exit 1
fi

mkdir -p ~/.config/zed
cp "$SRC" ~/.config/zed/settings.json
echo "› zed settings installed"
