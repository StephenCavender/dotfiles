fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# Fish-style inline suggestions from history. Load before syntax-highlighting.
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"