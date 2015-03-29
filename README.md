# Dotfiles, etc.

I keep my configuration files on Dropbox, since it is usually one of the first apps I install on a new computer. If I tweak something on one computer, Dropbox pushes it to any other computers I use, making it easy to keep things in sync. Originally inspired by [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles), with a lot of copy and pasting from Google.

## Usage

* For a new computer, install Dropbox and run `setup.sh`
* For subsequent changes, run scripts manually or cherry-pick changes

## Layout

    dotfiles/

        setup.sh - Interactive script to set up OSX the way I like it

        applescript/
        colors/ - Color palettes (must be install manually)
        fonts/ - Useful fonts (not under source control)
        launchagents/ - OSX's replacement for crontab
        scripts/
            bash.sh - Setup bash
            color_palettes.sh - Import colors
            dotfiles.sh - Symlink dotfiles
            defaults.sh - OSX-specific hacks
            post-defaults.sh - List of tasks to perform manually
            ssh.sh - Setup SSH
        terminal/ - Terminal themes
