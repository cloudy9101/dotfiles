#!/bin/bash

### Variables

dir=$HOME/dotfiles
echo "Current dir is $dir"
bak_dir=$dir/.bak-files
echo "Backup dir is $bak_dir"

### END Variables


### Functions

move_to_bak_dir()
{
  file=$1

  if [ -e "$file" ]
  then
    echo "Moving old file $file to $bak_dir"
    mv "$file" "$bak_dir/"
  fi
}

### END Functions

### Prescript

# create backup dir
echo "Creating $bak_dir for backup of any existing dotfiles in ~"
rm -rf "$bak_dir"
mkdir -p "$bak_dir"
echo "...done"

# Backup
bak_files=".gitignore .gitconfig"
for file in $bak_files; do
  old_file=$HOME/$file
  move_to_bak_dir "$old_file"
done

if [ -d "$HOME/.oh-my-zsh" ]
then
  mv "$HOME/.oh-my-zsh" "$bak_dir/"
fi

### END Prescript

###### Configurations

### Git

ln -s "$dir/gitignore" "$HOME/.gitignore"
ln -s "$dir/gitconfig" "$HOME/.gitconfig"

### END Git

### Zsh

# Install ohmyzsh and plugins
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

if [ -e "$HOME/.zshrc" ]
then
  echo "Remove oh-my-zsh default .zshrc"
  rm "$HOME/.zshrc"
fi

export ZSH_CUSTOM="$dir/ohmyzsh/custom"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# powerlevel10k
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

ln -s "$dir/zshrc" "$HOME/.zshrc"

### END Zsh

### rbenv

if [ -z "$(which rbenv)" ]; then
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | zsh
fi

### END rbenv

### Tmux

if [ -z "$(which tmux)" ]; then
  brew install -q tmux
fi

move_to_bak_dir "$HOME/.tmux.conf"
if [ -d "$HOME/.tmux" ]
then
  mv "$HOME/.tmux" "$bak_dir/"
fi

mkdir -p "$HOME/.tmux/plugins"
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
ln -s "$dir/tmux.conf" "$HOME/.tmux.conf"
"$HOME/.tmux/plugins/tpm/bin/install_plugins" # install tpm plugins

### END Tmux

### Neovim

NVIM_PATH=$HOME/.config/nvim
if [ -z "$(which nvim)" ]; then
  brew install -q neovim
fi
if [ -d "$NVIM_PATH" ]
then
  mv "$NVIM_PATH" "$bak_dir/"
fi

if [ -z "$(which rg)" ]; then
  brew install ripgrep
fi
ln -s "$dir/nvim" "$NVIM_PATH"

### END Neovim

