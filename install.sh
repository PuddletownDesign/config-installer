#!/bin/bash

echo moving to configuration directory
mkdir ~/Config/
cd ~/Config/

echo "upgrading apt-get"
sudo apt-get update

echo "downloading apt-get packages"
# try to do this from a generated list in the brew folder
sudo apt-get install software-properties-common fonts-inconsolata zsh curl tree -y


echo "downloading oh-my-zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "downloading zsh configuration"
git clone https://github.com/PuddletownDesign/ZSH
cd ~/Config/ZSH
git checkout linux

./install.sh
cd ~/Config/

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing Git Configs"
git clone https://github.com/PuddletownDesign/Git
cd ~/Config/Git
git checkout linux
./install.sh

#download zsh and zsh theme
echo "setting shell as zsh"
cd ~
chsh -s /bin/zsh
