#!/usr/bin/env zsh

# DON'T MAKE CHANGES TO THIS FILE. If you want to customize the install, add
# your changes to personal/install.sh. Modifying this file is likely to take
# you off the upgrade path.

# Create common color functions.
autoload -U colors
colors

# Create an unversioned script for scripts that are specific to this local environment
# and that you don't want to follow you across environments.
touch ~/extra.zsh

DOTFILES_DIRECTORY_NAME=$(pwd)
ZSH_HOST_OS=$(uname | awk '{print tolower($0)}')

case $ZSH_HOST_OS in
  darwin*)

  BREW_EXECUTABLE=/opt/homebrew/bin/brew

  $BREW_EXECUTABLE shellenv > $HOME/.dotfile_brew_setup
  $BREW_EXECUTABLE install coreutils
;;
esac

# Symlink core configs

# Link in the custom gitconfig. This has to happen after we rename to .gitconfig.local
ln -vsfn $DOTFILES_DIRECTORY_NAME/core/configs/.gitconfig ~/.gitconfig
ln -vsfn $DOTFILES_DIRECTORY_NAME/core/configs/.gitignore_global ~/.gitignore_global

# Symlink this repo's .zshrc to ~/.zshrc. Using a symlink ensures that when the repo is
# updated, the terminal will pick up the new version on reload without having to run
# install again. This will overwrite any existing .zshrc.
ln -vsfn $DOTFILES_DIRECTORY_NAME/.zshrc ~/.zshrc

# Vim
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/backups
ln -vsfn ~/dotfiles/personal/.vimrc ~/.vimrc
if [ ! -d ~"/.vim/bundle/Vundle.vim" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

# Tmux
ln -vsfn ~/dotfiles/personal/.tmux.conf ~/.tmux.conf
