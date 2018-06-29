#!/usr/bin/env bash

echo '> Configure apps? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then

    ##
    # iTunes
    ##

    # Prevent iTunes from opening when iDevices are connected
    defaults write com.apple.iTunes dontAutomaticallySyncIPods -bool true

    # TODO: iTunes - Disable notification on song change
    # TODO: iTunes - Disable copy files and keep iTunes media folder organized

    ##
    # Messages
    ##

    # TODO: Messages - Disable automatic status updates
    # TODO: Messages - Disable groups

    ##
    # Mail
    ##

    # Do not automatically loading remote content
    defaults write com.apple.mail-shared DisableURLLoading -bool true

    # FIXME: Mail - Disable inline attachments (does not work in Yosemite)
    # defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

    # FIXME: Mail - Customize toolbar (add Read/Unread buttons)
    #  - Can't use defaults because it is a complex dict
    #  - Can't use Plistbuddy because it is not a "real" plist file
    # defaults write com.apple.mail "NSToolbar Configuration MainWindow":"TB Item Identifiers" -dict-add(8) -string "unread_read"

    # TODO: Mail - Use port 993 for Dreamhost email
    # TODO: Mail - Disable junk mail filtering

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

    # Update extensions automatically
    defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

    # Enable developer menu
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

    # Add a context menu item for showing the Web Inspector in web views
    defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

    # Show status bar
    defaults write com.apple.Safari ShowStatusBar -bool true

    # TODO: Mail - Turn off sidebar icon, move 1PW icon to the right of the address field

    ##
    # Terminal
    ##

    # Install custom theme
    open -g "${DOTFILE_BASE}/terminal/Custom Black.terminal"
    sleep 1

    # Customize default theme
    defaults write com.apple.Terminal "Default Window Settings" -string "Custom Black"
    defaults write com.apple.Terminal "Startup Window Settings" -string "Custom Black"

    # TODO: Terminal - Startup window group

    ##
    # Apply changes
    ##

    for app in Dock Finder iTunes Mail Safari SystemUIServer; do killall "$app" > /dev/null 2>&1; done

fi
