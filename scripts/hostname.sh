#!/usr/bin/env bash

# Taken from https://gist.github.com/brandonb927/3195465

echo '> Set hostname (requires admin)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	echo "> To?"
	read COMPUTER_NAME

	sudo scutil --set ComputerName $COMPUTER_NAME
	sudo scutil --set HostName $COMPUTER_NAME
	sudo scutil --set LocalHostName $COMPUTER_NAME
	sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME
fi
