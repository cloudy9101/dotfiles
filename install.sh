#!/bin/bash

# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

########## Variables

dir=`dirname $(realpath "$0")` # current dir
echo "Current dir is $dir"
bak_dir=$dir/bak-files
echo $bak_dir

##########

# create dotfiles_old in homedir
echo "Creating $bak_dir for backup of any existing dotfiles in ~"
mkdir -p $bak_dir
echo "...done"

# Backup
bak_files=".gitignore .gitconfig"
for file in $bak_files; do
  old_file=$HOME/$file
  if [ -e $old_file ]
  then
    echo "Moving old file $old_file to $bak_dir"
    mv $old_file $bak_dir/
  fi
done

if [ -d $HOME/.oh-my-zsh ]
then
  mv $HOME/.oh-my-zsh $bak_dir/
fi

# Git
ln -s $dir/gitignore ~/.gitignore
ln -s $dir/gitconfig ~/.gitconfig

# Zsh
# Install ohmyzsh and plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

if [ -e $HOME/.zshrc ]
then
  echo "Remove oh-my-zsh default .zshrc"
  rm $HOME/.zshrc
fi

export ZSH_CUSTOM="$dir/ohmyzsh/custom"
if [ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi
if [ ! -d $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

# powerlevel10k
if [ ! -d $ZSH_CUSTOM/themes/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi

ln -s $dir/zshrc ~/.zshrc

# Rbenv
if [ ! -n rbenv ]; then
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | zsh
fi

