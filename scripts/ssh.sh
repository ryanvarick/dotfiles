#!/usr/bin/env bash

echo '> Symlink SSH config? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	mkdir ~/.ssh
	ln -sf "${DOTFILE_BASE}/.ssh/config" ~/.ssh/config
fi

echo '> Drop all SSH identities (must be run locally)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	ssh-add -D
fi

echo '> Unlock private key (must be run locally, requires 1Pw)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	ssh-add -K ~/.ssh/id_rsa
fi

echo '> Unlock Github private key (must be run locally, requires 1Pw)? (y/n)'
read response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	ssh-add -K ~/.ssh/github_rsa
fi
