#!/bin/bash


git remote add upstream https://github.com/PuddletownDesign/Installer

echo moving to configuration directory
mkdir ~/Dev/Config/
cd ~/Dev/Config/

echo "Installing brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

echo "downloading brew packages"
git clone https://github.com/PuddletownDesign/Brew
cd ~/Dev/Config/Brew
./install.sh
cd ~/Dev/Config/

echo "Installing Git"
git clone https://github.com/PuddletownDesign/Git
cd ~/Dev/Config/Git
git pull origin mac
git checkout mac
./install.sh
cd ~/Dev/Config/

echo "Setting up iterm"
git clone https://github.com/PuddletownDesign/iTerm
cd ~/Dev/Config/iTerm
git pull origin mac
git checkout mac
./install.sh
cd ~/Dev/Config/


echo "Installing Atom"
git clone https://github.com/PuddletownDesign/Atom
cd ~/Dev/Config/Atom
git pull origin mac
git checkout mac
./install.sh
cd ~/Dev/Config/

echo "downloading oh-my-zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "Installing bin...."
git clone https://github.com/PuddletownDesign/bin

echo "Installing zshrc and theme...."
git clone https://github.com/PuddletownDesign/ZSH
cd ~/Dev/Config/ZSH
git pull origin mac
git checkout mac
./install.sh
cd ~/Dev/Config/

echo "Installing Launchd hourly github backups for configuration"
git clone https://github.com/PuddletownDesign/launchd LaunchAgents
ln -s ~/Dev/Config/LaunchAgents/com.puddletowndesign.backup.plist ~/Library/LaunchAgents/com.puddletowndesign.backup.plist
ln -s ~/Dev/Config/LaunchAgents/com.puddletowndesign.update.plist ~/Library/LaunchAgents/com.puddletowndesign.update.plist
launchctl load ~/Library/LaunchAgents/com.puddletowndesign.backup.plist
launchctl load ~/Library/LaunchAgents/com.puddletowndesign.update.plist
cd ~/Dev/Config/

echo "downloading zsh configuration"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

chsh -s /bin/zsh
echo "Reloading configuration"
. ~/.zshrc
