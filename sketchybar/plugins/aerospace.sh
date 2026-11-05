#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

# FOCUSED_WORKSPACE is only passed on aerospace_workspace_change; query otherwise.
FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"
WINDOWS="$(aerospace list-windows --workspace "$1" --count 2>/dev/null)"

if [ "${WINDOWS:-0}" -gt 0 ]; then
  ICON_COLOR=$FG
else
  ICON_COLOR=$COMMENT
fi

if [ "$1" = "$FOCUSED" ]; then
  sketchybar --set $NAME \
    icon.color=$ICON_COLOR \
    background.drawing=on \
    background.color=$FG \
    background.corner_radius=0 \
    background.height=16
else
  sketchybar --set $NAME \
    icon.color=$ICON_COLOR \
    background.drawing=off
fi
