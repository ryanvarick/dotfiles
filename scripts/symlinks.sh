#!/usr/bin/env bash

source ~/.dotfile_base

echo '> Symlink dotfiles? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	ln -sf "${DOTFILE_BASE}/.bash_profile" ~/.bash_profile
	ln -sf "${DOTFILE_BASE}/.bash" ~/.bash
	ln -sf "${DOTFILE_BASE}/.emacs" ~/.emacs
	ln -sf "${DOTFILE_BASE}/.gitconfig" ~/.gitconfig
	ln -sf "${DOTFILE_BASE}/.gitignore_global" ~/.gitignore_global
	ln -sf "${DOTFILE_BASE}/.hgignore_global" ~/.hgignore_global
fi

echo '> Symlink dotfile base to .icloud? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	ln -sf ${DOTFILE_BASE} ~/.icloud
fi

echo '> Symlink ~/Downloads to ~/Desktop (requires admin)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	ln -sf ~/Desktop ~/Downloads
fi
