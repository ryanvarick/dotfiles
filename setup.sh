#!/usr/bin/env bash

# Based on `~/.osx`  — https://mths.be/osx

clear
sudo -v

# base path for scripts
#DOTFILE_BASE="/Users/rvarick/Public/dotfiles"
DOTFILE_BASE="${HOME}/Dropbox/dotfiles"
export DOTFILE_BASE

sh "${DOTFILE_BASE}/scripts/symlinks.sh"
sh "${DOTFILE_BASE}/scripts/bash.sh"

sh "${DOTFILE_BASE}/scripts/color_palettes.sh"
sh "${DOTFILE_BASE}/scripts/date_time.sh"
sh "${DOTFILE_BASE}/scripts/dock.sh"
sh "${DOTFILE_BASE}/scripts/energy.sh"
sh "${DOTFILE_BASE}/scripts/hostname.sh"
sh "${DOTFILE_BASE}/scripts/macos.sh"
sh "${DOTFILE_BASE}/scripts/apps.sh"

# TODO: Install fonts
# TODO: Install scripts

echo '> Some changes are not applied instantly. Log out now? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	# FIXME: Auto-logout hangs if single user logged in?
	osascript -e 'tell application "loginwindow" to «event aevtrlgo»'
fi
