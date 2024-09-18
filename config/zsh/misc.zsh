#!/bin/zsh

# starship
STARSHIP_LOG=error
eval "$(starship init zsh)"

# fzf
eval "$(fzf --zsh)"

# opts
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# bindkey
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey -e
