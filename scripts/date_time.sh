#!/usr/bin/env bash

echo '> Configure clock (System Preferences → Date & Time → Clock)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	defaults write com.apple.menuextra.clock DateFormat -string 'MMM d h:mm a'
	defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
	defaults write com.apple.menuextra.clock IsAnalog -bool false
fi
