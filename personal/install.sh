# Custom actions to take on initial install of dotfiles.
# This runs after default install actions, so you can overwrite changes it makes if you want.

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