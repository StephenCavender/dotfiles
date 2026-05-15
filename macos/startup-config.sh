#!/usr/bin/env sh

# Startup configuration for sketchybar and borders
# This script configures launch agents to start the applications on login
# Aerospace uses its own start-at-login setting

LAUNCH_AGENTS_DIR="$HOME/Library/LaunchAgents"

# Create launch agents directory if it doesn't exist
mkdir -p "$LAUNCH_AGENTS_DIR"

# Sketchybar launch agent
cat > "$LAUNCH_AGENTS_DIR/com.felixkratz.sketchybar.plist" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.felixkratz.sketchybar</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/bin/sketchybar</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
EOF

# Borders launch agent
cat > "$LAUNCH_AGENTS_DIR/com.felixkratz.borders.plist" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.felixkratz.borders</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/bin/borders</string>
        <string>active_color=0xff89b4fa</string>
        <string>inactive_color=0xff313244</string>
        <string>width=2.0</string>
        <string>style=round</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
EOF

# Load the launch agents
launchctl load "$LAUNCH_AGENTS_DIR/com.felixkratz.sketchybar.plist"
launchctl load "$LAUNCH_AGENTS_DIR/com.felixkratz.borders.plist"

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

launchctl load "$LAUNCH_AGENTS_DIR/com.steve.fastmail-sync.plist"

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

launchctl load "$LAUNCH_AGENTS_DIR/com.steve.vdirsyncer.plist"

echo "Startup configuration complete. Applications will launch on next login."