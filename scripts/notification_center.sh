#!/usr/bin/env bash

## WORK IN PROGRESS, need "guided access" in Xcode

osascript <<EOD
    tell application "System Events" to tell process "Notification Center"
        click menu bar item 2 of 2
    end tell
EOD
