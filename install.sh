#!/bin/bash

echo moving to configuration directory
mkdir ~/Config/
cd ~/Config/

echo "upgrading apt-get"
sudo apt-get update

echo "downloading apt-get packages"
# try to do this from a generated list in the brew folder
sudo apt-get install -y software-properties-common zsh curl tree git
sudo apt-add-repository ppa:webupd8team/atom
sudo apt-get update


sudo apt-get install atom


echo "downloading oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "downloading zsh configuration"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting



git clone https://github.com/PuddletownDesign/Git
git clone https://github.com/PuddletownDesign/Atom
git clone https://github.com/PuddletownDesign/ZSH

echo "Installing Git Configs"
./Git/install.sh


# check to see if there are any needed casks for install

echo "Installing Atom"
cd ~/Config/Atom
git reset --hard origin/linux
git checkout linux
./Atom/install.sh
cd ~/Config/

#download zsh and zsh theme
echo "setting shell as zsh"
chsh -s /usr/bin/zsh
