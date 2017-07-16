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

# golang
#GO_WORK_PATH=${HOME}/workspace/golang/code
#GO_LIB_PATH=${HOME}/workspace/golang/golib
#export GOROOT=/usr/local/Cellar/go/1.8.3/libexec
#export GOPATH=${GO_LIB_PATH}:${GO_WORK_PATH}
#export PATH="${PATH}:${GOBIN}"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

alias ll='ls -al'
alias vi='vim'
alias cls='clear'

function start_aria2 {
  aria2c --conf-path="/Users/jonas/.aria2/aria2.conf" -D
}

function vpn {
  cd ~/workspace/scripts/ptroutes
  sh vpnreset.sh
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

# add qingge word
function qglink() {
  rm -f "/Users/jonas/Library/Application Support/Qingg/Data/wb_table.txt"
  rm -f "/Users/jonas/Library/Application Support/Qingg/Data/wb_reverse_table.txt"
  rm -f "/Users/jonas/Library/Application Support/Qingg/Data/py_table.txt"
  rm -f "/Users/jonas/Library/Application Support/Qingg/Data/sp_table.txt"
  ln -s "/Users/jonas/Dropbox/config/qingge/wb_table.txt" "/Users/jonas/Library/Application Support/Qingg/Data/wb_table.txt"
  ln -s "/Users/jonas/Dropbox/config/qingge/wb_reverse_table.txt" "/Users/jonas/Library/Application Support/Qingg/Data/wb_reverse_table.txt"
  ln -s "/Users/jonas/Dropbox/config/qingge/py_table.txt" "/Users/jonas/Library/Application Support/Qingg/Data/py_table.txt"
  ln -s "/Users/jonas/Dropbox/config/qingge/sp_table.txt" "/Users/jonas/Library/Application Support/Qingg/Data/sp_table.txt"
}
function qgwb() {
  echo "\n$1 $2" >> ~/Dropbox/config/qingge/wb_table.txt
}
function qgpy() {
  echo "\n$1 $2" >> ~/Dropbox/config/qingge/py_table.txt
}

