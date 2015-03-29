# Dotfiles, etc.

I keep my configuration files on Dropbox, since it is usually one of the first apps I install on a new computer. If I tweak something on one computer, Dropbox pushes it to any other computers I use, making it easy to keep things in sync. Originally inspired by [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles), with a lot of copy and pasting from Google.

## Usage

* For a new computer, install Dropbox and run `setup.sh`
* For subsequent changes, manually `source` or cherry-pick changes

## Layout

* `setup.sh` - Interactive script to set up OSX the way I like it
* `colors/` - My color palettes, which must be installed manually
* `dotfiles/` - My dotfiles, symlinked to `~` by `setup.sh`
* `fonts/` - Installed via Font Book, not tracked by source control
* `scripts/` - Little scripts
    * `balance.applescript` - OSX sometimes randomly changes audio balance, argh
    * `com.ryanvarick.dh-dns-update.plist` - LaunchAgent to update DNS records, see [DH-DNS-Update](https://github.com/ryanvarick/dh-dns-update)
* `terminal/` - Terminal themes
