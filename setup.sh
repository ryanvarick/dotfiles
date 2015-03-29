#!/usr/bin/env bash

# Based on `~/.osx`  — https://mths.be/osx

##
# Initial setup
##

clear

# base paths for symlinking dotfiles (use `~/Public/` for testing)
BASE="${HOME}/Dropbox/OSX"

echo '> Symlink dotfiles? (y/n)'
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then

	# dotfiles
	ln -s "${BASE}/dotfiles/bash_profile" ~/.bash_profile
	ln -s "${BASE}/dotfiles/emacs" ~/.emacs
	ln -s "${BASE}/dotfiles/gitconfig" ~/.gitconfig
	ln -s "${BASE}/dotfiles/gitignore_global" ~/.gitignore_global
	ln -s "${BASE}/dotfiles/hgignore_global" ~/.hgignore_global

	# directories
	ln -s "${BASE}/dotfiles/atom" ~/.atom
	ln -s "${BASE}/dotfiles/ssh" ~/.ssh
fi

# configure bash
source ~/.bash_profile

echo '> Symlink ~/Downloads to ~/Desktop (requires admin)? (y/n)'
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo rm -rf ~/Downloads
    ln -s ~/Desktop ~/Downloads
fi

echo '> Open a color picker so you can manually import *.clr files? (y/n)'
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	osascript -e 'tell application "terminal" to choose color' > /dev/null
fi

# TODO: Copy fonts
# TODO: Copy scripts



##
# Date & Time (System Preferences → Date & Time → Clock)
##

defaults write com.apple.menuextra.clock DateFormat -string 'MMM d h:mm a'
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
defaults write com.apple.menuextra.clock IsAnalog -bool false



##
# Dock (System Preferences → Dock)
##

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string 'right'
defaults write com.apple.dock tilesize -int 40

echo '> Remove all icons from the dock? (y/n)'
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	defaults write com.apple.dock persistent-apps -array
	defaults write com.apple.dock persistent-others -array

	# TODO: Populate desired icon layout
	# See https://github.com/luanmuniz/dotfiles/blob/c1eaf3c74aa7b9c41304f2419cb29c94c00002ef/functions
fi



##
# Energy (System Preferences → Energy)
# - Taken from https://github.com/luanmuniz/dotfiles/blob/master/install/osx
##

echo '> Configure energy settings (requires admin + restart)? (y/n)'
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then

	# Display sleep (battery: 30m, power: 1hr)
	sudo pmset -b displaysleep 30
	sudo pmset -c displaysleep 60

	# Disk sleep (battery: 30m, power: 1hr)
	sudo pmset -b disksleep 30
	sudo pmset -c disksleep 60

	# Computer sleep (battery: 2hr, power: never)
	sudo pmset -b sleep 120
	sudo pmset -c sleep 0

	# Dimming (never adjust automatically, dim before sleeping)
	sudo pmset -b lessbright 0
	sudo pmset -c lessbright 0
	sudo pmset -b halfdim 1
	sudo pmset -c halfdim 1

	# Power Nap, wake on network access (enable all)
	sudo pmset -b darkwakes 1
	sudo pmset -c darkwakes 1
	sudo pmset -c womp 1
fi



##
# Finder
##

# Avoid creating .DS_Store files for the current user from now on
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

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

# TODO: Sidebar customization
# - Home, Desktop, Documents, AirDrop, All My Files, Applications, iCloud Drive

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Enable text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Expand the save and print panels by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# Show all filename extensions
defaults write -g AppleShowAllExtensions -bool true

# Show library (see `showlibrary` alias in .bash_profile)
chflags nohidden ~/Library/

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable screenshot shadow
defaults write com.apple.screencapture disable-shadow -bool true



##
# Input
##

# FIXME: Click to tap and three finger drag settings do not work for Yosemite
# FIXME: Attempted 0 2 2 (Default) → 1 0 0 (Three finger drag enabled)
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
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

# Enable keyboard access for all controls (System Preferences → Keyboard → Keyboard Shortcuts)
defaults write -g AppleKeyboardUIMode -int 3

# Map "Paste and Match Style" to ⌘+Shift+V (System Preferences → Keyboard → Shortcuts → App Shortcuts)
# - Note: Single quotes are required for modifiers to work properly
defaults write -g NSUserKeyEquivalents -dict-add "Paste and Match Style" -string '@$v'

# Enable audio feedback for the keyboard volume buttons (applied on next login)
defaults write -g com.apple.sound.beep.feedback -int 1

# Disable power button sleep
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool false

echo '> Disable ambient light adjustments (requires admin + restart)? (y/n)'
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false
	sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool false
fi



##
# Mission Control
##

# Disable "Automatically rearrange Spaces" (System Preferences → Mission Control)
defaults write com.apple.dock mru-spaces -bool false



##
# Notification Center
##

# TODO: Widget order (Date, summary, reminders, calendar)
# TODO: Disable Reminder notifications, etc.



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

echo '> Permanently delete dumb screen savers for ALL users (requires admin)? (y/n)'
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	sudo rm -rf "/System/Library/Screen Savers/FloatingMessage.saver"
	sudo rm -rf "/System/Library/Screen Savers/iTunes Artwork.saver"
	sudo rm -rf "/System/Library/Screen Savers/Word of the Day.qtz"
fi



##
# iTunes
##

# Prevent iTunes from opening when iDevices are connected
defaults write com.apple.iTunes dontAutomaticallySyncIPods -bool true

# TODO: Disable notification on song change
# TODO: Disable copy files and keep iTunes media folder organized



##
# Mail
##

# Do not automatically loading remote content
defaults write com.apple.mail-shared DisableURLLoading -bool true

# FIXME (broken for Yosemite): Disable inline attachments (just show the icons)
# defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# FIXME Customize toolbar (add Read/Unread buttons)
#  - Can't use defaults because it is a complex dict
#  - Can't use Plistbuddy because it is not a "real" plist file
# defaults write com.apple.mail "NSToolbar Configuration MainWindow":"TB Item Identifiers" -dict-add(8) -string "unread_read"

# TODO: Use port 993 for Dreamhost email
# TODO: Disable junk mail filtering



##
# Safari
##

# Disable auto fill
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false

# Restore sessions
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool true
defaults write com.apple.Safari OpenPrivateWindowWhenNotRestoringSessionAtLaunch -bool false

# Tweak security and privacy
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Enable developer menu
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

# Show status bar
defaults write com.apple.Safari ShowStatusBar -bool true

# TODO: Turn off sidebar icon, move 1PW icon to the right of the address field



##
# Terminal
##

# Install custom theme
open -g "${BASE}/terminal/Custom Black.terminal"
sleep 1

# Customize default theme
defaults write com.apple.Terminal "Default Window Settings" -string "Custom Black"
defaults write com.apple.Terminal "Startup Window Settings" -string "Custom Black"

# TODO: Startup window group



##
# Apply changes
##

for app in Dock Finder iTunes Mail Safari SystemUIServer; do killall "$app" > /dev/null 2>&1; done

echo
echo 'All done!'
echo
echo 'Perform the following changes manually:'
echo
echo '- Verify FileVault is enabled in System Preferences → Security & Privacy'
echo '- Configure VPN settings in System Preferences → Network'
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
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	# FIXME: Crashes if single user logged in?
	osascript -e 'tell application "loginwindow" to «event aevtrlgo»'
fi
