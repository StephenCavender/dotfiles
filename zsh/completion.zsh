# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# fzf-tab: route tab completion through fzf. Must load after compinit.
if [[ -f "$BREW_PREFIX/share/fzf-tab/fzf-tab.zsh" ]]; then
  source "$BREW_PREFIX/share/fzf-tab/fzf-tab.zsh"
  # preview directories with eza when completing cd
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --level=2 --color=always --icons=auto $realpath'
fi

# syntax-highlighting must be sourced LAST (after fzf-tab) to wrap the final ZLE widgets
source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
