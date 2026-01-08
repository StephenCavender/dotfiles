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
mkdir -p "$TARGET_DIR/items"
mkdir -p "$TARGET_DIR/scripts"

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

# Copy items directory
if [ -d "$SOURCE_DIR/items" ]; then
    echo "Copying item files to $TARGET_DIR/items/"
    cp -R "$SOURCE_DIR/items/"* "$TARGET_DIR/items/"
fi

# Copy scripts directory (contains config.sh with color palette)
if [ -d "$SOURCE_DIR/scripts" ]; then
    echo "Copying script files to $TARGET_DIR/scripts/"
    cp -R "$SOURCE_DIR/scripts/"* "$TARGET_DIR/scripts/"
fi

# Set executable permissions on all shell scripts
echo "Setting executable permissions..."
find "$TARGET_DIR" -name "*.sh" -exec chmod +x {} \;
chmod +x "$TARGET_DIR/sketchybarrc"

echo "SketchyBar configuration installed successfully!"
