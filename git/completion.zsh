# Add Homebrew's zsh site-functions to fpath so compinit picks up _git automatically.
# Sourcing _git directly triggers completion-context errors; fpath registration is the correct approach.
if [[ -d "$BREW_PREFIX/share/zsh/site-functions" ]]; then
  fpath=("$BREW_PREFIX/share/zsh/site-functions" $fpath)
fi
