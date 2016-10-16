# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# autojump
#[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
# z
. `brew --prefix`/etc/profile.d/z.sh

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

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
  aria2c --conf-path="/Users/bindiry/.aria2/aria2.conf" -D
}

function vpn {
  cd ~/workspace/scripts/chnroutes
  bash vpnreset.sh
  exit
}

function restart_network {
    sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
    sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
    sudo killall -9 networkd
    sudo brew services restart dnsmasq
}

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

proxy () {
  export http_proxy="http://127.0.0.1:8888"
  export https_proxy="http://127.0.0.1:8888"
  echo "HTTP Proxy on"
}

noproxy () {
  unset http_proxy
  unset https_proxy
  echo "HTTP Proxy off"
}
