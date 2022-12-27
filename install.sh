#!/bin/bash

# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

########## Variables

dir=`dirname $(realpath "$0")` # current dir
echo "Current dir is $dir"
bak_dir=$dir/bak-files
echo $bak_dir

##########

move_to_bak_dir()
{
  file=$1

  if [ -e $file ]
  then
    echo "Moving old file $file to $bak_dir"
    mv $file $bak_dir/
  fi
}

# create dotfiles_old in homedir
echo "Creating $bak_dir for backup of any existing dotfiles in ~"
rm -rf $bak_dir
mkdir -p $bak_dir
echo "...done"

# Backup
bak_files=".gitignore .gitconfig"
for file in $bak_files; do
  old_file=$HOME/$file
  move_to_bak_dir $old_file
done

if [ -d $HOME/.oh-my-zsh ]
then
  mv $HOME/.oh-my-zsh $bak_dir/
fi

# Git
ln -s $dir/gitignore $HOME/.gitignore
ln -s $dir/gitconfig $HOME/.gitconfig

# Zsh
# Install ohmyzsh and plugins
if [ -d $HOME/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

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

ln -s $dir/zshrc $HOME/.zshrc

# Rbenv
if [ ! -n rbenv ]; then
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | zsh
fi

# Tmux
if [ ! -n $(which tmux) ]; then
  brew install -q tmux
fi

move_to_bak_dir $HOME/.tmux.conf
if [ -d $HOME/.tmux ]
then
  mv $HOME/.tmux $bak_dir/
fi

mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $dir/tmux.conf $HOME/.tmux.conf
$HOME/.tmux/plugins/tpm/bin/install_plugins # install tpm plugins

# Neovim
NVIM_PATH=$HOME/.config/nvim
if [ ! -n $(which nvim) ]; then
  brew install -q neovim
fi
if [ -d $NVIM_PATH ]
then
  mv $NVIM_PATH $bak_dir/
fi
mkdir -p $NVIM_PATH

if [ ! -d $dir/kickstart.nvim ]; then
  git clone git@github.com:nvim-lua/kickstart.nvim.git $dir/kickstart.nvim
fi
ln -s $dir/kickstart.nvim/init.lua $NVIM_PATH/init.lua
ln -s $dir/nvim/lua $NVIM_PATH/lua
ln -s $dir/nvim/after $NVIM_PATH/after
