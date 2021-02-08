#!/bin/bash
#VARIABLES
URL_BREW='https://raw.githubusercontent.com/Homebrew/install/master/install
.sh'
SAFE_PACKAGES=(
	mas
	tmux
	jq
	htop
	git
	speedtest-cli
	wget
	nmap
	links
	geoiplookup
)
UNSAFE_PACKAGES=(
	recon-ng
	theharvester
)
CASK_PACKAGES=(
	google-chrome
	firefox
	virtualbox
	wireshark
	spotify
	lastpass
	gimp
	sonos
)
MAS_PACKAGES=(
	441258766 #magnet
	803453959 #Slack 
	639968404 #parcel
	491071483 #tot
	1287239339 #colourslurp
	1481302432 #instapaper save
	425424353 #the unarchiver
)
# welcome text & option selection
echo " ________________________ 
|  ____________________  |
| | Matt's macOS Setup | |
| |____________________| |
|________________________|
Welcome, please select an installation option:
0. Only configs (no packages)
1. Safe install (no sectools)
2. Safe install with GUI apps
3. Full install (everything!)"
read OPTION
re='^[0-3]+$'
if ! [[ $OPTION =~ $re ]] ; then
   echo "error: Not a number" >&2; exit 1
fi
echo "Your selection is $OPTION"
#create the temp dir to put all the install artifacts
mkdir artifacts
cd artifacts
#install xcode cli tools to enable install of most other tools
xcode-select --install

echo -n '- Installing brew ... '
echo | /usr/bin/ruby -e "$(curl -fsSL $URL_BREW)" > /dev/null
if [ $? -eq 0 ]; then echo 'OK'; else echo 'NG'; fi

#####brew packages to install
#safe tools
if [[ $OPTION != 0 ]] ; then
	brew install ${SAFE_PACKAGES[@]}
fi
if [[ $OPTION != 0 ]] || [[ $OPTION != 1 ]] ; then
	brew install ${CASK_PACKAGES[@]} --cask
	#Mac App Store installs (mas) 
	mas install ${MAS_PACKAGES[@]}
fi
#unsafe tools for secwork
if [[ $OPTION = 3 ]] ; then
	brew install ${UNSAFE_PACKAGES[@]}
fi
####VIM####
#download plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#copy my vimrc file
cp vimrc ~/.vimrc
#install plugins so they are ready to go 
vim -c 'PlugInstall | qa'
######get ohmyzsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
chmod 700 install.sh
./install.sh
#install powerline
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
