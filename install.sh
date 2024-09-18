#!/bin/bash

# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt update
  sudo apt install -y ripgrep xsel tmux git

  # install neovim
  if [ ! -h "$HOME/.cache/bin/nvim" ]; then
    mkdir -p $HOME/.cache/bin
    curl -L -o $HOME/.cache/nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    rm -rf $HOME/.cache/nvim-linux64
    tar -C $HOME/.cache -xzf $HOME/.cache/nvim-linux64.tar.gz
    ln -s $HOME/.cache/nvim-linux64/bin/nvim $HOME/.cache/bin/nvim
  fi
  # install starship
  if [ ! -f $HOME/.cache/bin/starship ]; then
    curl -sS https://starship.rs/install.sh | sh -s -- -b $HOME/.cache/bin -f
  fi
  # install asdf
  if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.14.0
  fi
  # install fzf
  if [ ! -d "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    $HOME/.fzf/install --no-bash --no-zsh --no-fish --completion --key-bindings
  fi

# OSX
elif [[ "$OSTYPE" == "darwin"* ]]; then

  # Install Homebrew if not exists
  if [ ! -f /opt/homebrew/bin/brew ]; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
  fi
  brew update
  brew install neovim tmux ripgrep starship asdf fzf
fi

# Link config files
ln -s ./config/git/gitconfig $HOME/.gitconfig
ln -s ./config/git/gitignore $HOME/.gitignore
ln -s ./config/zsh/zshenv $HOME/.zshenv
ln -s ./config/zsh $XDG_CONFIG_HOME/zsh
ln -s ./config/tmux/tmux.conf $HOME/.tmux.conf
ln -s ./config/asdf/asdfrc $HOME/.asdfrc
ln -s ./config/asdf/tool-versions $HOME/.tool-versions

# Install tpm
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  mkdir -p $HOME/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi
