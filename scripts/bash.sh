#!/usr/bin/env bash

echo '> Configure bash? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then

    # Create a directory for NPM global modules
    mkdir ~/.npm-global

    # Persist dotfile base path for future use
    echo "export DOTFILE_BASE=\"${DOTFILE_BASE}\"" > ~/.dotfile_base

    # Source latest .bash_profile
    source "${DOTFILE_BASE}/.bash_profile"
fi
