fpath+=("$BREW_PREFIX/share/zsh/site-functions")

# Starship prompt (Omarchy). Config: starship/starship.toml -> ~/.config/starship.toml
(( $+commands[starship] )) && eval "$(starship init zsh)"

# Fish-style inline suggestions from history. Load before syntax-highlighting.
source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"