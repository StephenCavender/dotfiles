#!/bin/sh
#
# Remote bootstrap — fetch and run from a fresh machine:
#
#   curl -fsSL https://raw.githubusercontent.com/StephenCavender/dotfiles/master/install.sh | sh

set -e

DOTFILES_REPO="https://github.com/StephenCavender/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

# Ensure Xcode Command Line Tools are installed (provides git on macOS)
if ! xcode-select -p > /dev/null 2>&1; then
  echo "  [!!] Xcode Command Line Tools not found."
  echo "       Triggering install prompt — re-run this script once it completes."
  xcode-select --install
  exit 1
fi

# Clone or update the repo
if [ -d "$DOTFILES_DIR/.git" ]; then
  echo "  [..] ~/.dotfiles already exists — pulling latest"
  git -C "$DOTFILES_DIR" pull --rebase
else
  echo "  [..] Cloning dotfiles into ~/.dotfiles"
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"
./script/bootstrap
