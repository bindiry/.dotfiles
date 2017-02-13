# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# autojump
#[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
# z
#. `brew --prefix`/etc/profile.d/z.sh
# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

alias ll='ls -al'
alias vi='vim'
alias cls='clear'

function start_lantern {
    export http_proxy=http://127.0.0.1:8787
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    export rsync_proxy=$http_proxy
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
}

function stop_lantern {
    export http_proxy=
    export https_proxy=
    export ftp_proxy=
    export rsync_proxy=
    export no_proxy=
    sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
    sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
    sudo killall -9 networkd
}

function start_aria2 {
  aria2c --conf-path="/Users/jonas/.aria2/aria2.conf" -D
}

function vpn {
  cd ~/workspace/scripts/chnroutes
  bash vpnreset.sh
  #bash phasevpn.sh
  exit
}

function restart_network {
    sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
    sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
    sudo killall -9 networkd
    sudo brew services restart dnsmasq
}

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# proxy
alias setproxy="export http_proxy=socks5://127.0.0.1:1080; export https_proxy=$http_proxy; echo 'HTTP Proxy on';"
alias unsetproxy="unset http_proxy; unset https_proxy; echo 'HTTP Proxy off';"
# Git proxy
alias gitproxy="git config —global —replace-all https.proxy 'socks5://127.0.0.1:1080'; git config —global —replace-all http.proxy 'socks5://127.0.0.1:1080'; echo 'GIT proxy on'"
alias unsetgitproxy="git config —global —replace-all http.proxy ''; git config —global —replace-all https.proxy ''; echo 'GIT proxy off'"
