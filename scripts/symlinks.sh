#!/usr/bin/env bash

echo '> Symlink dotfiles? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then

	# dotfiles
	ln -s "${DOTFILE_BASE}/.bash_profile" ~/.bash_profile
	ln -s "${DOTFILE_BASE}/.emacs" ~/.emacs
	ln -s "${DOTFILE_BASE}/.gitconfig" ~/.gitconfig
	ln -s "${DOTFILE_BASE}/.gitignore_global" ~/.gitignore_global
	ln -s "${DOTFILE_BASE}/.hgignore_global" ~/.hgignore_global

	# directories
	ln -s "${DOTFILE_BASE}/.atom" ~/.atom
fi

echo '> Symlink ~/Downloads to ~/Desktop (requires admin)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo rm -rf ~/Downloads
    ln -s ~/Desktop ~/Downloads
fi
