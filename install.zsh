#!/bin/bash
#VARIABLES

# welcome text & option selection
echo " ________________________ 
|  ____________________  |
| | Matt's macOS Setup | |
| |____________________| |
|________________________|
0. Only configs (no packages)
1. Safe install (no sectools)
2. Safe install with GUI apps
3. Full install (everything!)"
#create the temp dir to put all the install artifacts
echo -n '############### Installing brew ... #################### '
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
if [ $? -eq 0 ]; then echo 'OK'; else echo 'NG'; fi
wait
#####brew packages to install
brew bundle
wait
####VIM####
#download plugin manager
echo -n '############### Installing VIM plugin Manager ############## '
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wait
#copy my vimrc file
echo -n '############### Copying VIM config ############## '
cp vimrc ~/.vimrc
#install plugins so they are ready to go 
wait
echo -n '############### Installing VIM plugins ############## '
vim -c 'PlugInstall | qa'
######get ohmyzsh
wait
echo -n '############### Getting OhMyZsh ############## '
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
wait
echo -n '############### Installing OhMyZsh ############## '
chmod 700 install.sh
./install.sh
#install powerline
wait
echo -n '############### Getting Powerlevel10k ############## '
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo -n '############### Copying zsh config file ############## '
cp zshrc ~/.zshrc
