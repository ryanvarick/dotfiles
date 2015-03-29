#!/usr/bin/env bash

echo '> Open a color picker so you can manually import *.clr files? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	osascript -e 'tell application "terminal" to choose color' > /dev/null
fi
