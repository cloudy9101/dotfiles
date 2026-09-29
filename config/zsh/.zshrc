ZSH_THEME="robbyrussell"

# Define where to store the history and how much to keep
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# Share history across all open sessions instantly
setopt SHARE_HISTORY

# Additional helpful history tweaks
setopt EXTENDED_HISTORY          # Saves timestamps alongside commands
setopt HIST_IGNORE_ALL_DUPS      # Don't record duplicate entries
setopt HIST_IGNORE_SPACE         # Ignore commands starting with a space
setopt HIST_REDUCE_BLANKS        # Remove extra white spaces

# Set neovim as EDITOR
export EDITOR="nvim"

# Activate mise
if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi

# Activate starship
if [[ $- == *i* ]] && [[ ${TERM:-} != "dumb" ]] && command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# Activate fzf
if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
fi

# Alias
alias dot='cd $HOME/Projects/dotfiles'
alias crt='cd $(git rev-parse --show-toplevel)'
alias lg='lazygit'
## Git
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gl='git pull'
alias gp='git push'
