#!/usr/bin/env bash

# Based on `~/.osx`  — https://mths.be/osx

clear
sudo -v

# base path for scripts
DOTFILE_BASE="/Users/rvarick/Library/Mobile Documents/com~apple~CloudDocs/dotfiles" # iCloud
export DOTFILE_BASE=${DOTFILE_BASE}

echo '> Write .dotfile_base? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	echo "export DOTFILE_BASE=\"${DOTFILE_BASE}\"" > ~/.dotfile_base
fi

sh "${DOTFILE_BASE}/scripts/apps.sh"
sh "${DOTFILE_BASE}/scripts/bash.sh"
sh "${DOTFILE_BASE}/scripts/color_palettes.sh"
sh "${DOTFILE_BASE}/scripts/date_time.sh"
sh "${DOTFILE_BASE}/scripts/dock.sh"
sh "${DOTFILE_BASE}/scripts/energy.sh"
sh "${DOTFILE_BASE}/scripts/hostname.sh"
sh "${DOTFILE_BASE}/scripts/macos.sh"
sh "${DOTFILE_BASE}/scripts/node.sh"
sh "${DOTFILE_BASE}/scripts/symlinks.sh"

echo '> Log out now? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	osascript -e 'tell application "loginwindow" to «event aevtrlgo»'
fi
