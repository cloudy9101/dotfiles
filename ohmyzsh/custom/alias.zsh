# neovim
alias vi="nvim"
# git
alias gu="git pull"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gst="git status"
alias gco="git checkout"
alias gp="git push"
alias grt='cd "$(git rev-parse --show-toplevel)"' # goto project root
alias main='gco "$(git symbolic-ref refs/remotes/origin/HEAD | cut -d'/' -f4)"'
# tmux
alias tls="tmux ls"
alias tas="tmux attach -t"
alias tns="tmux new-session -s"
alias tks="tmux kill-session -t"
