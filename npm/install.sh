#!/bin/sh
#
# Global npm CLIs, installed under the mise-managed node (lts).
# Note: a node version bump via mise leaves these behind; re-run this script.

set -e

PACKAGES="greptile"

if ! command -v mise > /dev/null 2>&1; then
  echo "  skipped: mise not installed"
  exit 0
fi

for pkg in $PACKAGES; do
  if mise exec node@lts -- npm ls -g --depth=0 "$pkg" > /dev/null 2>&1; then
    echo "  $pkg already installed"
  else
    mise exec node@lts -- npm install -g "$pkg"
  fi
done
