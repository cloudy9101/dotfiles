#!/bin/sh

. ./helper.sh

sudo apt-get update
sudo apt-get install -y build-essential procps curl file git

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

link_config_files

install_ohmyzsh
