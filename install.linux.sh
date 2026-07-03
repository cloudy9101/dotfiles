#!/bin/sh

. ./helper.sh

sudo apt-get update
sudo apt-get install -y build-essential procps curl file git

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "brew install"
brew bundle check --file ./config/Brewfile || brew bundle install --file ./config/Brewfile

link_config_files

install_ohmyzsh
