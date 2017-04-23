#!/bin/bash

echo moving to configuration directory
mkdir ~/Documents/Dev/
cd ~/Documents/Dev/

echo "Installing brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

echo "downloading brew packages"
git clone https://github.com/PuddletownDesign/Brew
cd ~/Documents/Dev/Brew
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
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "Installing bin...."
git clone https://github.com/PuddletownDesign/bin

echo "Installing zshrc and theme...."
git clone https://github.com/PuddletownDesign/ZSH
cd ~/Documents/Dev/ZSH
git pull origin mac
git checkout mac
./install.sh
cd ~/Documents/Dev/

echo "Installing Launchd hourly github backups for configuration"
git clone https://github.com/PuddletownDesign/launchd LaunchAgents
ln -s ~/Documents/Dev/LaunchAgents/com.puddletowndesign.backup.plist ~/Library/LaunchAgents/com.puddletowndesign.backup.plist
ln -s ~/Documents/Dev/LaunchAgents/com.puddletowndesign.update.plist ~/Library/LaunchAgents/com.puddletowndesign.update.plist
launchctl load ~/Library/LaunchAgents/com.puddletowndesign.backup.plist
launchctl load ~/Library/LaunchAgents/com.puddletowndesign.update.plist
cd ~/Documents/Dev/

echo "downloading zsh configuration"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

chsh -s /bin/zsh
echo "Reloading configuration"
. ~/.zshrc
