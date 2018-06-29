#!/usr/bin/env bash

echo '> Configure dock (System Preferences → Dock)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock orientation -string 'right'
    defaults write com.apple.dock tilesize -int 40
fi

echo '> Remove all icons from the dock? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  	defaults write com.apple.dock persistent-apps -array
  	defaults write com.apple.dock persistent-others -array
fi

# TODO: Dock - Populate desired icon layout
# See https://github.com/luanmuniz/dotfiles/blob/c1eaf3c74aa7b9c41304f2419cb29c94c00002ef/functions
