#!/usr/bin/env bash

echo '> Configure Node? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	mkdir ~/.npm-global # Create a directory for NPM global modules
fi
