#!/bin/sh

set -e

mkdir -p "$HOME/.config/vdirsyncer"
mkdir -p "$HOME/.config/khal"
mkdir -p "$HOME/.local/share/vdirsyncer"
mkdir -p "$HOME/.local/share/vdir/fastmail/calendar/bd75bc44-4cba-48f9-9124-1dbe3b7e8d31"
mkdir -p "$HOME/.local/share/vdir/fastmail/calendar/a9bcf6d6-06a5-4070-85d3-583784323dec"
mkdir -p "$HOME/.local/share/vdir/google/calendar"
mkdir -p "$HOME/.local/share/khal"

DOTFILES_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

ln -sf "$DOTFILES_ROOT/calendar/vdirsyncer/config" "$HOME/.config/vdirsyncer/config"
ln -sf "$DOTFILES_ROOT/calendar/khal/config"       "$HOME/.config/khal/config"

echo "  calendar directories and config symlinks ready"
echo ""
echo "  Next steps:"
echo "  1. Encrypt your Google OAuth credentials:"
echo "     echo -n 'CLIENT_ID'     | gpg --encrypt -r steve@cavender.io > ~/.config/vdirsyncer/google_client_id.gpg"
echo "     echo -n 'CLIENT_SECRET' | gpg --encrypt -r steve@cavender.io > ~/.config/vdirsyncer/google_client_secret.gpg"
echo "  2. Run: vdirsyncer discover"
echo "  3. Run: vdirsyncer sync"
