/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install wget
brew install curl
brew install vim --with-lua
brew install git
brew install python3
brew install macvim --with-cscope --with-lua
brew linkapps macvim
brew install ctags
brew install the_silver_searcher
brew install aria2
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
brew instal dnsmasq
cp /usr/local/opt/dnsmasq/dnsmasq.conf.example /usr/local/etc/dnsmasq.conf
sudo brew services start dnsmasq
# chnroutes https://github.com/ranmocy/chnroutes

brew tap caskroom/cask
brew cask install google-chrome
brew cask install the-unarchiver
brew cask install sublime-text
brew cask install dropbox
brew cask install karabiner
brew cask install sequel-pro
brew cask install appcleaner
brew cask install coteditor
brew cask install datagrip
brew cask install firefox
brew cask install lantern
brew cask install vlc
brew cask install youdao
brew cask install macdown
brew cask install gimp
