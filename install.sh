#!/bin/bash

echo moving to configuration directory
mkdir ~/Documents/Dev/
cd ~/Documents/Dev/

echo "downloading oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "downloading zsh configuration"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# download zsh and zsh theme

echo "upgrading brew"
brew update

echo "downloading brew packages"
# try to do this from a generated list in the brew folder
brew install thefuck tree

# check to see if there are any needed casks for install

echo "Cloning Atom Configs"
git clone https://github.com/PuddletownDesign/Atom
git pull origin linux
git checkout linux

echo "Installing Atom"
./Atom/install.sh

echo "setting shell as zsh"
sudo chsh -s /usr/bin/zsh
