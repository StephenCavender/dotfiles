export PATH="/opt/homebrew/bin:$PATH"

# Homebrew prefix on Apple Silicon. Exported here (a path.zsh file, loaded
# first) so later zsh files can use $BREW_PREFIX instead of spawning
# `brew --prefix` repeatedly at startup.
export BREW_PREFIX="/opt/homebrew"