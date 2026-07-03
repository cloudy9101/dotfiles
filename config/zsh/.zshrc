export ZSH="$ZDOTDIR/ohmyzsh"
ZSH_THEME="robbyrussell"
ZSH_CUSTOM=$ZDOTDIR/ohmyzsh-custom

# Homebrew activate
if [[ "$OSTYPE" == "linux"* ]] && [ -f "/etc/debian_version" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Include libpq bin (psql)
export PATH="$(brew --prefix)/opt/libpq/bin:$PATH"

# For Lazygit to use config file under $HOME/.config
export XDG_CONFIG_HOME="$HOME/.config"

# Set neovim as EDITOR
export EDITOR="nvim"

plugins=(
  aws
  gh
  git
  golang
  helm
  kubectl
  mise
  nats
  podman
  rails
  ruby
  ssh
  ssh-agent
  starship
  tldr
  zoxide
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Alias
alias vi='nvim'
alias dot='cd $HOME/Projects/dotfiles'
alias crt='cd $(git rev-parse --show-toplevel)'
alias lg='lazygit'
alias n='new_git_worktree'
alias zz='zmx-select'
