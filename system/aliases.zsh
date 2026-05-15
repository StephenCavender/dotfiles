# eza — modern ls replacement
if $(eza &>/dev/null)
then
  alias ls='eza --group-directories-first --icons=auto'
  alias l='eza -l --git --group-directories-first --no-user --no-permissions --icons=auto --time-style=relative'
  alias ll='eza -l --git --icons=auto --time-style=relative'
  alias la='eza -la --git --icons=auto'
  alias lt='eza --tree --level=2 --git-ignore --icons=auto'
  alias lr='eza -l --sort=modified --icons=auto --time-style=relative'
  alias lts='eza -lh --total-size --icons=auto'
fi
