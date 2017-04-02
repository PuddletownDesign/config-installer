#!/bin/bash

echo moving to configuration directory
mkdir ~/Documents/Dev/
cd ~/Documents/Dev/

echo "Installing brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

echo "downloading brew packages"
cd ~/Documents/Dev/Brew
git clone https://github.com/PuddletownDesign/Brew
./install.sh
cd ~/Documents/Dev/

echo "Installing Git"
git clone https://github.com/PuddletownDesign/Git
cd ~/Documents/Dev/Git
git pull origin mac
git checkout mac
./install.sh
cd ~/Documents/Dev/

echo "Setting up iterm"
git clone https://github.com/PuddletownDesign/iTerm
cd ~/Documents/Dev/iTerm
git pull origin mac
git checkout mac
./install.sh
cd ~/Documents/Dev/


echo "Installing Atom"
git clone https://github.com/PuddletownDesign/Atom
cd ~/Documents/Dev/Atom
git pull origin mac
git checkout mac
./install.sh
cd ~/Documents/Dev/

echo "downloading oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing zshrc and theme...."
git clone https://github.com/PuddletownDesign/ZSH
cd ~/Documents/Dev/ZSH
git pull origin mac
git checkout mac
./install.sh
cd ~/Documents/Dev/

echo "downloading zsh configuration"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Reloading configuration"
. ~/.zshrc
