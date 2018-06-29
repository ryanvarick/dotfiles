#!/usr/bin/env bash

echo '> Configure macOS defaults? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then

		##
		# Finder
		##

		# Avoid creating .DS_Store files for the current user from now on
		defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
		defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

		# Search the current folder by default
		defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

		# List view by default
		defaults write com.apple.Finder FXPreferredViewStyle -string "Nlsv"

		# Snap to grid (applied on next login)
		/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
		/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

		# Set home directory as the default location for new Finder windows
		# For other paths, use `PfLo` and `file:///full/path/here/`
		defaults write com.apple.finder NewWindowTarget -string "PfLo"
		defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

		# Hide tags in sidebar
		defaults write com.apple.finder ShowRecentTags -bool false

		# TODO: Finder - Customize sidebar (Home, Desktop, Documents, AirDrop, All My Files, Applications, iCloud Drive)

		# Display full POSIX path as Finder window title
		defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

		# Keep folders on top when sorting by name
		defaults write com.apple.finder _FXSortFoldersFirst -bool true

		# When performing a search, search the current folder by default
		defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

		# Enable text selection in Quick Look
		defaults write com.apple.finder QLEnableTextSelection -bool true

		# Expand the save and print panels by default
		defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
		defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true
		defaults write -g PMPrintingExpandedStateForPrint -bool true
		defaults write -g PMPrintingExpandedStateForPrint2 -bool true

		# Show all filename extensions
		defaults write -g AppleShowAllExtensions -bool true

		# Show library (see `showlibrary` alias in .bash_profile)
		chflags nohidden ~/Library/

		# Automatically quit printer app once the print jobs complete
		defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

		# Save screenshots to the desktop
		defaults write com.apple.screencapture location -string "${HOME}/Desktop"

		# Disable screenshot shadow
		defaults write com.apple.screencapture disable-shadow -bool true

		# Restart automatically if the computer freezes
		sudo systemsetup -setrestartfreeze on



		##
		# Input
		##

		# Trackpad: enable tap to click for this user and for the login screen
		defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
		defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
		defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

		# FIXME: Trackpad - Three finger drag settings do not work for Yosemite
		# - Attempted 0 2 2 (Default) → 1 0 0 (Three finger drag enabled)
		# defaults -currentHost write "com.apple.trackpad.threeFingerDragGesture" -int 1
		# defaults -currentHost write "com.apple.trackpad.threeFingerHorizSwipeGesture" -int 0
		# defaults -currentHost write "com.apple.trackpad.threeFingerVertSwipeGesture" -int 0
		# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
		# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
		# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
		# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1
		# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0
		# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 0

		# Enable four finger swipe down for app exposé (System Preferences → Trackpad → More Gestures)
		# defaults write com.apple.dock showAppExposeGestureEnabled -bool true

		# Enable keyboard access for all controls (System Preferences → Keyboard → Keyboard Shortcuts)
		defaults write -g AppleKeyboardUIMode -int 3

		# Map "Paste and Match Style" to ⌘+Shift+V (System Preferences → Keyboard → Shortcuts → App Shortcuts)
		# - Note: Single quotes are required for modifiers to work properly
		defaults write -g NSUserKeyEquivalents -dict-add "Paste and Match Style" -string '@$v'

		# Enable audio feedback for the keyboard volume buttons (applied on next login)
		defaults write -g com.apple.sound.beep.feedback -int 1

		# Disable power button sleep
		defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool false

		# Disable ambient light adjustment
		sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false
		sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool false



		##
		# Mission Control
		##

		# Disable "Automatically rearrange Spaces" (System Preferences → Mission Control)
		defaults write com.apple.dock mru-spaces -bool false



		##
		# Notification Center
		##

		# TODO: Notification Center - Set widget order (Date, summary, reminders, calendar)
		# TODO: Notification Center - Disable Reminder sounds, banners



		##
		# Screensaver
		##

		# Set screen saver to random (System Preferences → Desktop & Screensaver)
		defaults -currentHost write com.apple.screensaver moduleDict -dict \
			moduleName -string "Random" \
			path -string "/System/Library/Screen Savers/Random.saver" \
			type -int 8

		# Start screensaver after 10 minutes
		defaults -currentHost write com.apple.screensaver idleTime -int 600
		defaults write com.apple.screensaver idleTime -int 600

		# Require password 5 seconds after the screensaver starts
		defaults write com.apple.screensaver askForPassword -int 1
		defaults write com.apple.screensaver askForPasswordDelay -float 5

		# Remove dumb screensavers
		sudo rm -rf "/System/Library/Screen Savers/FloatingMessage.saver"
		sudo rm -rf "/System/Library/Screen Savers/iTunes Artwork.saver"
		sudo rm -rf "/System/Library/Screen Savers/Word of the Day.qtz"

fi
