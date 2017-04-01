#!/bin/bash

echo moving to configuration directory
mkdir ~/Config/
cd ~/Config/

echo "upgrading apt-get"
sudo apt-get update

echo "downloading apt-get packages"
# try to do this from a generated list in the brew folder
sudo apt-get install -f zsh curl tree git gconf2 gconf-service libgtk2.0-0 libnotify4 libxtst6 libnss3 gvfs-bin xdg-utils

echo "downloading oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "downloading zsh configuration"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# download zsh and zsh theme





# check to see if there are any needed casks for install

echo "Installing Atom"
./Atom/install.sh

echo "setting shell as zsh"
chsh -s /usr/bin/zsh
