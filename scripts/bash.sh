#!/usr/bin/env bash

echo '> Configure bash? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then

    # Create a directory for NPM global modules
    mkdir ~/.npm-global

    # Source latest .bash_profile
    source "${DOTFILE_BASE}/.bash_profile"
fi
