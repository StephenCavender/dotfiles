#!/bin/sh
#
# Create directories neomutt needs at runtime.
# hcache/mcache are excluded from the repo (see .gitignore).
#

set -e

# Remove old single-file hcache if it exists (pre-directory-cache setup)
for path in "$HOME/.mutt/hcache" "$HOME/.mutt/mcache"; do
  if [ -f "$path" ]; then
    rm -f "$path" "${path}-lock" 2>/dev/null || true
  fi
done

mkdir -p "$HOME/.mutt/hcache"
mkdir -p "$HOME/.mutt/mcache"

# Remove the link to the old Dracula theme, which no longer exists in the repo
rm -f "$HOME/.mutt/dracula.muttrc"
ln -sf "$DOTFILES_ROOT/mutt/tokyonight.muttrc" "$HOME/.mutt/tokyonight.muttrc"

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
