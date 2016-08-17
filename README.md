# Dotfiles, etc.

I keep my configuration files on Dropbox, since it is usually one of the first apps I install on a new computer. If I tweak something on one computer, Dropbox pushes it to any other computers I use, making it easy to keep things in sync. Originally inspired by [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles), with a lot of copy and pasting from Google.

## Usage

* For a new computer, install Dropbox and run `setup.sh`
* For subsequent changes, run scripts manually or cherry-pick changes
* For a list of TODOs, run `scripts/todo.sh`

## Layout

* `setup.sh` - Interactive script to set up OSX the way I like it
* `applescript/` - Small AppleScript hacks
    * `balance.applescript` - OSX has an annoying tendency to change audio balance :-/
* `colors/` - Color palettes (must be install manually)
* `fonts/` - Useful fonts (not under source control)
* `launchagents/` - OSX replacement for crontab
    * `dh-dns-update.plist` - Update DNS for home server, see [DH-DNS-Update](https://github.com/ryanvarick/dh-dns-update)
* `scripts/`
    * `bash.sh` - Setup bash
    * `color_palettes.sh` - Import color palettes
    * `defaults.sh` - OSX-specific hacks
    * `defaults_manual.sh` - Stuff I don't know how to automate
    * `fixspotlight.sh` - Kill runaway spotlight process (probably fixed now)
    * `hostname.sh` - Set the hostname
    * `ssh.sh` - Configure SSH
    * `symlinks.sh` - Symlink dotfiles
    * `todo.sh` - Auto-generate `TODO.md` from shell files
* `terminal/` - Terminal themes
