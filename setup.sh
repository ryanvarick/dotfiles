#!/usr/bin/env bash

##
# Interactive blah balh
##

clear

echo '> Set up bash? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	scripts/bash.sh
fi

echo '> Set up hostname (requires admin)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	scripts/bash.sh
fi

echo '> Symlink files (requires admin)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	scripts/symlinks.sh
fi

echo '> Set up SSH (requires admin and 1PM)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	scripts/ssh.sh
fi

echo '> Set OSX defaults? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	scripts/defaults.sh
fi



echo '> Open a color picker so you can manually import *.clr files? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	osascript -e 'tell application "terminal" to choose color' > /dev/null
fi

# TODO: Copy fonts
# TODO: Copy scripts







echo
echo 'All done!'
echo
echo 'Perform the following changes manually:'
echo
echo '- Verify FileVault is enabled in System Preferences → Security & Privacy'
echo '- Configure VPN settings in System Preferences → Network'
echo '- Disable guest user account in System Preferences → Users & Groups'
echo
echo '- Enable "Change Picture" in System Preferences → Desktop & Screensaver'
echo '- Enable "Tap to Click" in System Preferences → Trackpad → Point & Click'
echo '- Enable "Three finger drag" in System Preferences → Trackpad → Point & Click'
echo '- Disable "When song changes" in iTunes Preferences → General'
echo '- Disable "Keep iTunes Media folder organized" in iTunes Preferences → Advanced'
echo '- Disable "Copy files..." in iTunes Preferences → Advanced'
echo
echo 'Install the following apps from the App Store:'
echo
echo '- 1Password, Clear, iA Writer Pro'
echo '- Moneywell, Pixelmator, Sketch, Transmit'
echo '- Number, iPhoto, Xcode'
echo
echo 'Install the following apps from the web:'
echo
echo '- Dropbox, Crashplan'
echo '- Chrome, Firefox'
echo '- Atom, io.js, SourceTree'
echo '- Bartender, Fantastical, iStatsMenu (restore plist files)'
echo '- Omnigraffle 5'
echo
echo '> Some changes are not applied instantly. Log out now? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	# FIXME: Crashes if single user logged in?
	osascript -e 'tell application "loginwindow" to «event aevtrlgo»'
fi
