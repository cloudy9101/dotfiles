#!/bin/sh

echo "Include $HOME/.bin into path"
mkdir -p $HOME/.bin
export PATH="$PATH:$HOME/.bin"

echo "Install dependencies"

arch="x86_64"

a=$(uname -m)
if [[ "$a" == "aarch64" || "$a" == "arm64" ]]; then
  echo "This is an ARM64 system."
  arch="arm64"
fi

echo "Install neovim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${arch}.tar.gz
tar -C $XDG_CACHE_HOME -xzf nvim-linux-${arch}.tar.gz
cp $XDG_CACHE_HOME/nvim-linux-${arch}/bin/nvim $HOME/.bin/nvim

echo "Install starship"
BIN_DIR=$HOME/.bin curl -sS https://starship.rs/install.sh | sh

echo "Install ohmyzsh"
echo "export ZDOTDIR=$XDG_CONFIG_HOME/zsh" > $HOME/.zshenv
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
echo "export XTERM=xterm-256color" >>$HOME/.zshenv
export KEEP_ZSHRC=yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Install ohmyzsh plugins"
export ZSH_CUSTOM=$ZDOTDIR/ohmyzsh-custom
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/wintermi/zsh-mise ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-mise
