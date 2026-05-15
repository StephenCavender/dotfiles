#!/bin/sh
#
# Create directories neomutt needs at runtime.
# hcache/mcache are excluded from the repo (see .gitignore).
#

set -e

mkdir -p "$HOME/.mutt/hcache"
mkdir -p "$HOME/.mutt/mcache"

ln -sf "$DOTFILES_ROOT/mutt/dracula.muttrc" "$HOME/.mutt/dracula.muttrc"

# Create a minimal mailcap if one doesn't exist.
# text/html entry renders HTML email via bat (fallback: cat).
MAILCAP="$HOME/.mailcap"
if [ ! -f "$MAILCAP" ]; then
  if command -v bat >/dev/null 2>&1; then
    echo 'text/html; bat --language=html --style=plain %s; copiousoutput' > "$MAILCAP"
  else
    echo 'text/html; cat %s; copiousoutput' > "$MAILCAP"
  fi
  echo "  Created $MAILCAP"
fi

echo "  neomutt directories ready"
