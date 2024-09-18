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

if [ ! -d "$HOME/.cfg" ]; then
  echo "github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl" >> $HOME/.ssh/known_hosts
  echo "github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=" >> $HOME/.ssh/known_hosts
  echo "github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk=" >> $HOME/.ssh/known_hosts

  # clone dotfiles in $HOME
  git clone --bare git@github.com:cloudy9101/dotfiles.git --branch bare "$HOME/.cfg"

  function config {
    git --git-dir="$HOME/.cfg/" --work-tree="$HOME" "$@"
  }

  if config checkout; then
    echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";

    mkdir -p "$HOME/.config-backup"
    config checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv $HOME/{} $HOME/.config-backup/{}
  fi;

  config config status.showUntrackedFiles no
fi

# Install tpm
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

. $HOME/.path.zsh

# Setup nodejs/golang asdf plugin and install global version
if [ ! -d "$HOME/.asdf/plugins/nodejs" ]; then
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs 20.16.0
  asdf global nodejs 20.16.0
fi
if [ ! -d "$HOME/.asdf/plugins/golang" ]; then
  asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
  asdf install golang latest
  asdf global golang latest
fi
