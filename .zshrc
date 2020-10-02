# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias ll='ls -al'
alias vi='vim'
alias cls='clear'
alias rn='react-native'
alias vim='nvim'

function gost_ss {
  cd ~/apps
  ./gost -L ss://aes-128-cfb:google21@:1984 -F 'https://wakanda4ever:Google21@wakanda.yridnib.com:443'
  cd -
}

function start_aria2 {
  aria2c --conf-path="/Users/jonas/.aria2/aria2.conf" -D
}

function addotherssh {
  ssh-add ~/Dropbox/config/ssh_other/*_id_rsa
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
#alias setproxy="export http_proxy=socks5://127.0.0.1:1086; export https_proxy=$http_proxy; echo 'HTTP Proxy on';"
#alias unsetproxy="unset http_proxy; unset https_proxy; echo 'HTTP Proxy off';"
# Git proxy
#alias gitproxy="git config --global --replace-all https.proxy 'socks5://127.0.0.1:1086'; git config --global --replace-all http.proxy 'socks5://127.0.0.1:1086'; echo 'GIT proxy on'"
#alias unsetgitproxy="git config --global --replace-all http.proxy ''; git config --global --replace-all https.proxy ''; echo 'GIT proxy off'"
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# node
export PATH="/usr/local/opt/node@12/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
