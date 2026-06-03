# Homebrew prefix detection: Apple Silicon → /opt/homebrew, Intel → /usr/local.
# Set here (a path.zsh file, loaded first) so later zsh files can use
# $BREW_PREFIX instead of spawning `brew --prefix` repeatedly at startup.
if [[ -x /opt/homebrew/bin/brew ]]; then
  export BREW_PREFIX="/opt/homebrew"
elif [[ -x /usr/local/bin/brew ]]; then
  export BREW_PREFIX="/usr/local"
fi
export PATH="$BREW_PREFIX/bin:$PATH"