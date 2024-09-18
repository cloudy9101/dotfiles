#!/bin/zsh

# Reload config
alias reload_zshrc=". $HOME/.zshenv && echo 'Reloaded'"

# ls
if is_command_present eza; then
  # https://github.com/eza-community/eza
  alias ls='eza -hl --group-directories-first --sort=mod --time-style=long-iso --git --icons=auto'
else
  alias ls='ls -Failh'
fi
alias .='ls'
alias ..='cd ..'
alias ...='cd ../..'

# cat
if is_command_present bat; then
  alias cat="bat --decorations never"
fi

# additional args
alias mkdir='mkdir -pv'
alias grep='egrep -ai --color=auto'
alias df='df -h'
alias du='du -ch'

# neovim
if is_command_present nvim; then
  alias vi="nvim"
  alias vim='nvim'
fi

# git
alias gu="git pull"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gcm="git commit -m"
alias gst="git status"
alias gco="git checkout"
alias gp="git push"
alias grt='cd "$(git rev-parse --show-toplevel)"' # goto project root
alias main='gco "$(git symbolic-ref refs/remotes/origin/HEAD | cut -d'/' -f4)"'

# tmux
alias tls="tmux "
alias tls="tmux ls"
alias tas="tmux attach -t"
alias tns="tmux new-session -s"
alias tks="tmux kill-session -t"

# k8s
if is_command_present kubectl; then
  alias k="kubectl"
fi
