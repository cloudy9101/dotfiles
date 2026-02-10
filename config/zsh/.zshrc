export ZSH="$ZDOTDIR/ohmyzsh"
ZSH_THEME="robbyrussell"
ZSH_CUSTOM=$ZDOTDIR/ohmyzsh-custom

# Homebrew activate
if [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Path
# MacOS specific path
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Include rancher-desktop bin folder (include docker, kubectl etc.)
  export PATH="$HOME/.rd/bin:$PATH"
fi
# Include binaries installed by bun
export PATH="$HOME/.bun/bin:$PATH"
aqua_path=${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin
export PATH="$PATH:$aqua_path"
export AQUA_GLOBAL_CONFIG=$HOME/.config/aqua.yaml
export PATH="$PATH:$HOME/.local/bin"

export EDITOR="vi"

# Include rancher-desktop bin folder (docker, kubectl etc.)
export PATH="$HOME/.rd/bin:$PATH"
# Include bob (neovim version manager) bin folder
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"
# Include libpq bin (psql)
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

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

nn() {
  if [[ ! $(command -v dtach) ]]; then
    nvim "$@"
    return
  fi

  local sock="/tmp/nvim-dtach-$(echo $PWD | md5sum | cut -c1-8).sock"
  if [[ -S "$sock" ]]; then
    dtach -a "$sock"
  else
    dtach -c "$sock" nvim "$@"
  fi
}
