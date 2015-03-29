#!/usr/bin/env bash

echo '> Symlink ~/.ssh? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    ln -s "${DOTFILE_BASE}/.ssh" ~/.ssh
fi

echo '> Drop all SSH identities? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    ssh-add -D
fi

echo '> Unlock private key (requires 1Pw)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    ssh-add -K ~/.ssh/id_rsa
fi

echo '> Unlock Github private key (requires 1Pw)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    ssh-add -K ~/.ssh/github_rsa
fi
