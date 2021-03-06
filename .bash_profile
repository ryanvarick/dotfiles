# Used by dotfile scripts
source ~/.dotfile_base

# Bash prompt - Git
export GITAWAREPROMPT="${DOTFILE_BASE}/.bash/git-aware-prompt"
source "${GITAWAREPROMPT}/main.sh"

# Bash prompt - Terminal colors
export LSCOLORS="ExbxcxdxDxegedabagacad"

# Bash prompt - Prompt and host name
if [[ $HOSTNAME == "home.ryanvarick.com" ]]; then
	export PS1="\u@\[\033[1;33m\h\033[0m\]:\w\$ "
else
	# export PS1="\u@\[\033[1;32m\h\033[0m\]:\w\$ "
	export PS1="\u@\[$bldgrn\]\h\[$txtrst\] \w \[$txtgrn\]\$git_branch\[$txtwht\]\$git_dirty\[$txtrst\]\$ "
fi

# Local configuration
source ~/.bash_local

# VS Code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Fix Node global modules
# - See: https://docs.npmjs.com/getting-started/fixing-npm-permissions (Option 2)
npm config set prefix "~/.npm-global"
export PATH="~/.npm-global/bin:$PATH"

# My aliases
alias finder="open ."
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias ls="ls -Gph"
alias screenshare="open vnc://home"
alias st="open -a SourceTree ."
alias showlibrary="chflags nohidden ~/Library/"
alias simulator="open /Applications/Xcode.app/Contents/Developer/Applications/iOS\ Simulator.app"

# dangerous/complicated aliases
alias rmall="echo 'find . [-type d] -name 'index.*' -print -exec rm {} \;'"
alias spider="echo 'wget -r --user= --password= --no-parent'"

# Dev aliases
alias jingo="clear && ./jingo -c config.yaml"
alias pmwiki="clear && php -S 0.0.0.0:8080"
alias server="clear && node server.js"

# Other aliases
# - see: https://github.com/mathiasbynens/dotfiles/

# Get week number
alias week="date +%V"

# Stopwatch
alias timer="echo \"Timer started. Stop with Ctrl-D.\" && date && time cat && date"

# IP addresses
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias myip="ipconfig getifaddr en0"
alias ips="echo 'INTERNAL' && myip && echo 'PUBLIC' && pubip"
alias allips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Rebuild Launch Services database to de-dupe Open With submenu.
# http://www.leancrew.com/all-this/2013/02/getting-rid-of-open-with-duplicates/
alias fixopenwith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"

# Recursively delete `.DS_Store` files
alias killds="find . -type f -name '*.DS_Store' -ls -delete"

# ROT13-encode text. Works for decoding, too! ;)
alias rot13="tr a-zA-Z n-za-mN-ZA-M"
