#!/usr/bin/env bash
#
# Install Tmux Plugin Manager (TPM)
# https://github.com/tmux-plugins/tpm

set -e

TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ -d "$TPM_DIR" ]; then
  echo "  [tmux] TPM already installed, updating..."
  git -C "$TPM_DIR" pull --quiet
else
  echo "  [tmux] Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
  echo "  [tmux] TPM installed to $TPM_DIR"
fi

echo "  [tmux] Done. Open tmux and press prefix + I to install plugins."
