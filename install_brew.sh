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
vim +PlugInstall +qall
brew instal dnsmasq
#cp /usr/local/opt/dnsmasq/dnsmasq.conf.example /usr/local/etc/dnsmasq.conf
#sudo brew services start dnsmasq
# install mpv
brew install mpv --with-bundle
brew linkapps mpv
EXTS=( 3GP ASF AVI FLV M4V MKV MOV MP4 MPEG MPG MPG2 MPG4 RMVB WMV MTS )
brew install duti
for ext in ${EXTS[@]}
do
	lower=$(echo $ext | awk '{print tolower($0)}')
	duti -s io.mpv $ext all
	duti -s io.mpv $lower all
done

# install apps
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
