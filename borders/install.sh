#!/usr/bin/env bash

# Borders configuration for use with Aerospace
# This config provides window borders that work well with the Aerospace tiling window manager

# Set source directory
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"

# Set target directory and file
TARGET_DIR="$HOME/.config/borders"
CONFIG_FILE="$TARGET_DIR/bordersrc"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

echo "Installing borders configuration..."

# Copy the bordersrc file to the config directory
if [ -f "$SOURCE_DIR/bordersrc" ]; then
    cp "$SOURCE_DIR/bordersrc" "$CONFIG_FILE"
    echo "✅ Borders configuration copied to $CONFIG_FILE"
else
    echo "❌ bordersrc file not found in $SOURCE_DIR"
    exit 1
fi

# Make the configuration executable
chmod +x "$CONFIG_FILE"

# Start borders with the configuration
echo "Starting borders..."
$CONFIG_FILE