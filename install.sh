#!/bin/bash

echo moving to configuration directory
mkdir ~/Config/
cd ~/Config/

echo "upgrading apt-get"
sudo apt-get update

echo "downloading apt-get packages"
# try to do this from a generated list in the brew folder
sudo apt-get install software-properties-common fonts-inconsolata zsh curl tree git python3-dev python-pip python3-pip  -y
pip install --upgrade pip
pip3 install --user thefuck



echo "downloading oh-my-zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "downloading zsh configuration"
git clone https://github.com/PuddletownDesign/ZSH
cd ~/Config/ZSH

./install.sh
cd ~/Config/


git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


echo "Installing Git Configs"
git clone https://github.com/PuddletownDesign/Git

cd ~/Config/Git
./install.sh

mkdir ~/Config/temp
cd ~/Config/temp/

# check to see if there are any needed casks for install
echo "Installing Atom"
wget https://atom.io/download/deb -O atom.deb
sudo dpkg -i atom.deb

cd ~/Config/
git clone https://github.com/PuddletownDesign/Atom
cd ~/Config/Atom
./Atom/install.sh
cd ~/Config/

#download zsh and zsh theme
echo "setting shell as zsh"
chsh -s $(which zsh)
