ZSH_THEME="robbyrussell"

# Set neovim as EDITOR
export EDITOR="nvim"

if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi

if [[ $- == *i* ]] && [[ ${TERM:-} != "dumb" ]] && command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# Alias
alias vi='nvim'
alias dot='cd $HOME/Projects/dotfiles'
alias crt='cd $(git rev-parse --show-toplevel)'
alias lg='lazygit'
alias n='new_git_worktree'
alias zz='zmx-select'
