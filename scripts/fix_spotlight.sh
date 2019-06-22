#!/bin/bash

##
# Spotlight: Fix spotlight cpu issue
##

IFS=$'\n'
killspotlight="no"
if [ -e /Library/Managed\ Preferences/com.apple.Spotlight.plist ];
then
	echo "System: Spotlight Managed Pref Plist found.  Removing..."
	rm -rf /Library/Managed\ Preferences/com.apple.Spotlight.plist
	killspotlight="yes"
fi
for i in `ls -d /Library/Managed\ Preferences/*/`;
do
	if [ -e $i/com.apple.Spotlight.plist ];
	then
		echo "System: Spotlight Managed Pref Plist found in $i  Removing..."
		rm -f $i/com.apple.Spotlight.plist
		killspotlight="yes"
	fi
done
if [ $killspotlight == "yes" ]; then killall Spotlight; fi
