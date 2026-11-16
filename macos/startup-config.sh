#!/usr/bin/env bash

# Launch agents for background sync jobs (fastmail rclone, vdirsyncer).
# Sketchybar and borders are started by AeroSpace's after-startup-command,
# not launchd.

set -e

LAUNCH_AGENTS_DIR="$HOME/Library/LaunchAgents"

# (Re)load a launch agent idempotently. `launchctl load` is deprecated and errors
# if the agent is already loaded; bootout+bootstrap re-registers cleanly on reruns.
reload_agent() {
  local plist="$1"
  local domain="gui/$(id -u)"
  launchctl bootout "$domain" "$plist" 2>/dev/null || true
  launchctl bootstrap "$domain" "$plist"
}

# Create launch agents directory if it doesn't exist
mkdir -p "$LAUNCH_AGENTS_DIR"

mkdir -p "$HOME/.local/share/rclone"
cat > "$LAUNCH_AGENTS_DIR/com.steve.fastmail-sync.plist" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.steve.fastmail-sync</string>
    <key>ProgramArguments</key>
    <array>
        <string>/opt/homebrew/bin/rclone</string>
        <string>bisync</string>
        <string>fastmail:</string>
        <string>/Users/steve/fastmail-cloud</string>
        <string>--log-file</string>
        <string>/Users/steve/.local/share/rclone/fastmail-sync.log</string>
        <string>--log-level</string>
        <string>INFO</string>
    </array>
    <key>StartInterval</key>
    <integer>300</integer>
    <key>RunAtLoad</key>
    <false/>
    <key>StandardErrorPath</key>
    <string>/Users/steve/.local/share/rclone/fastmail-sync.err</string>
</dict>
</plist>
EOF

reload_agent "$LAUNCH_AGENTS_DIR/com.steve.fastmail-sync.plist"

mkdir -p "$HOME/.local/share/vdirsyncer"
cat > "$LAUNCH_AGENTS_DIR/com.steve.vdirsyncer.plist" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.steve.vdirsyncer</string>
    <key>ProgramArguments</key>
    <array>
        <string>/opt/homebrew/bin/vdirsyncer</string>
        <string>sync</string>
    </array>
    <key>StartInterval</key>
    <integer>300</integer>
    <key>RunAtLoad</key>
    <false/>
    <key>StandardOutPath</key>
    <string>/Users/steve/.local/share/vdirsyncer/sync.log</string>
    <key>StandardErrorPath</key>
    <string>/Users/steve/.local/share/vdirsyncer/sync.err</string>
</dict>
</plist>
EOF

reload_agent "$LAUNCH_AGENTS_DIR/com.steve.vdirsyncer.plist"

echo "Startup configuration complete."