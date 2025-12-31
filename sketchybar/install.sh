#!/usr/bin/env sh

# SketchyBar installation script
# This script copies SketchyBar configuration files to ~/.config/sketchybar/

# Set source directory
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.config/sketchybar"

echo "Installing SketchyBar configuration..."

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"
mkdir -p "$TARGET_DIR/plugins"

# Copy sketchybarrc file
if [ -f "$SOURCE_DIR/sketchybarrc" ]; then
    echo "Copying sketchybarrc to $TARGET_DIR/"
    cp "$SOURCE_DIR/sketchybarrc" "$TARGET_DIR/"
fi

# Copy plugins directory
if [ -d "$SOURCE_DIR/plugins" ]; then
    echo "Copying plugin files to $TARGET_DIR/plugins/"
    cp -R "$SOURCE_DIR/plugins/"* "$TARGET_DIR/plugins/"
fi

echo "SketchyBar configuration installed successfully!"
