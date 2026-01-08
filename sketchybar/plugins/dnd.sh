#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

DND_ENABLED=$(defaults read com.apple.controlcenter "NSStatusItem Visible FocusModes" 2>/dev/null)
DND_STATE=$(plutil -extract dnd.enabled raw ~/Library/DoNotDisturb/DB/Assertions.json 2>/dev/null || echo "0")

get_dnd_status() {
  if defaults read ~/Library/Preferences/com.apple.ncprefs.plist dnd_prefs 2>/dev/null | grep -q "userPref = 1"; then
    echo "on"
  else
    FOCUS_STATE=$(defaults read com.apple.controlcenter "NSStatusItem Visible FocusModes" 2>/dev/null)
    shortcuts run "Get Focus Mode" 2>/dev/null | grep -qi "on" && echo "on" || echo "off"
  fi
}

toggle_dnd() {
  osascript -e 'tell application "System Events" to keystroke "d" using {control down, option down, command down}' 2>/dev/null || \
  shortcuts run "Toggle Focus" 2>/dev/null || \
  open "x-apple.systempreferences:com.apple.Focus"
}

update_icon() {
  STATUS=$(get_dnd_status)
  
  if [ "$STATUS" = "on" ]; then
    sketchybar --set $NAME \
      icon=󰂛 \
      icon.color=$RED
  else
    sketchybar --set $NAME \
      icon=󰂚 \
      icon.color=$PURPLE
  fi
}

case "$1" in
"toggle")
  toggle_dnd
  sleep 0.5
  update_icon
  ;;
*)
  update_icon
  ;;
esac
