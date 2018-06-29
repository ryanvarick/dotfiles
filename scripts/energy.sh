#!/usr/bin/env bash

# Taken from https://github.com/luanmuniz/dotfiles/blob/master/install/osx

echo '> Configure energy settings (System Preferences → Energy)? (y/n)'
read response
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
