#!/usr/bin/env bash

##
# Initial setup
##

# base paths for symlinking dotfiles (use `~/Public/` for testing)
BASE="${HOME}/Dropbox/OSX"


echo '> Symlink dotfiles? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then

	# dotfiles
	ln -s "${BASE}/dotfiles/bash_profile" ~/.bash_profile
	ln -s "${BASE}/dotfiles/emacs" ~/.emacs
	ln -s "${BASE}/dotfiles/gitconfig" ~/.gitconfig
	ln -s "${BASE}/dotfiles/gitignore_global" ~/.gitignore_global
	ln -s "${BASE}/dotfiles/hgignore_global" ~/.hgignore_global

	# directories
	ln -s "${BASE}/dotfiles/atom" ~/.atom
	ln -s "${BASE}/dotfiles/ssh" ~/.ssh
fi

echo '> Symlink ~/Downloads to ~/Desktop (requires admin)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo rm -rf ~/Downloads
    ln -s ~/Desktop ~/Downloads
fi
