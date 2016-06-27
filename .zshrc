# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias ll='ls -al'
alias vi='vim'
alias grep='grep --color:auto'
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