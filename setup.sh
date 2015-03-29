#!/usr/bin/env bash

# base path for scripts
DOTFILE_BASE="/Users/rvarick/Public/dotfiles"
#DOTFILE_BASE="${HOME}/Dropbox/dotfiles"
export DOTFILE_BASE

clear

# run scripts
sh "${DOTFILE_BASE}/scripts/bash.sh"
sh "${DOTFILE_BASE}/scripts/hostname.sh"
sh "${DOTFILE_BASE}/scripts/symlinks.sh"
sh "${DOTFILE_BASE}/scripts/ssh.sh"

# OSX configuration scripts
sh "${DOTFILE_BASE}/scripts/color_palettes.sh"

# TODO: Install fonts
# TODO: Install scripts

echo '> Configure OSX defaults? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then

	sh "${DOTFILE_BASE}/scripts/defaults.sh"
	sh "${DOTFILE_BASE}/scripts/defaults_manual.sh"

	echo '> Some changes are not applied instantly. Log out now? (y/n)'
	read response
	if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
		# FIXME: Auto-logout hangs if single user logged in?
		osascript -e 'tell application "loginwindow" to «event aevtrlgo»'
	fi
fi
