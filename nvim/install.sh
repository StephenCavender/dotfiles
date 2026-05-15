#!/usr/bin/env bash
set -e

DOTFILES_NVIM="$(cd "$(dirname "$0")" && pwd)"
NVIM_CONFIG_DIR="$HOME/.config/nvim"

# Bootstrap: clone LazyVim starter if nvim config doesn't exist yet
if [ ! -d "$NVIM_CONFIG_DIR" ]; then
  echo "Installing LazyVim starter..."
  git clone https://github.com/LazyVim/starter "$NVIM_CONFIG_DIR"
  rm -rf "$NVIM_CONFIG_DIR/.git"
fi

link_file() {
  local src="$1"
  local dst="$2"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    return 0
  fi
  if [ -f "$dst" ] && [ ! -L "$dst" ]; then
    echo "  backing up $dst -> $dst.backup"
    mv "$dst" "$dst.backup"
  fi
  ln -sf "$src" "$dst"
  echo "  linked $dst"
}

mkdir -p "$NVIM_CONFIG_DIR/lua/config" "$NVIM_CONFIG_DIR/lua/plugins"

# Root config files
link_file "$DOTFILES_NVIM/init.lua"       "$NVIM_CONFIG_DIR/init.lua"
link_file "$DOTFILES_NVIM/lazyvim.json"   "$NVIM_CONFIG_DIR/lazyvim.json"
link_file "$DOTFILES_NVIM/stylua.toml"    "$NVIM_CONFIG_DIR/stylua.toml"

# lua/config/
for f in "$DOTFILES_NVIM/lua/config/"*.lua; do
  link_file "$f" "$NVIM_CONFIG_DIR/lua/config/$(basename "$f")"
done

# lua/plugins/
for f in "$DOTFILES_NVIM/lua/plugins/"*.lua; do
  link_file "$f" "$NVIM_CONFIG_DIR/lua/plugins/$(basename "$f")"
done

echo "Neovim config symlinked. Run 'nvim' to install plugins."
