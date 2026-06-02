fpath+=("$BREW_PREFIX/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# Fish-style inline suggestions from history. Load before syntax-highlighting.
source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"