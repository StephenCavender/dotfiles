#!/bin/sh
#
# gh CLI config, and gh extensions.
# hosts.yml (auth tokens) is never linked -- run `gh auth login` on a new machine.
# gh-dash config is work-specific and stays out of this (public) repo.

set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$HOME/.config/gh"
ln -sf "$DIR/config.yml" "$HOME/.config/gh/config.yml"

if ! command -v gh > /dev/null 2>&1; then
  echo "  skipped extensions: gh not installed"
elif ! gh auth status > /dev/null 2>&1; then
  echo "  skipped extensions: run \`gh auth login\`, then re-run gh/install.sh"
else
  for ext in dlvhdr/gh-dash dlvhdr/gh-enhance; do
    gh extension list | grep -q "$ext" || gh extension install "$ext"
  done
fi

echo "  gh config linked"
