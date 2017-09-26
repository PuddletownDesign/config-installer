# Puddletown environment with one command for multiple OSs (Mac, Linux)

Depending on your OS

## [Mac](https://github.com/PuddletownDesign/config-installer/tree/mac) or [Linux](https://github.com/PuddletownDesign/config-installer/tree/linux)

# Mac Install Instruction

## Fork the following repos on github

We will do this so that you will have your own editable copy of your configs, but you can still get updates from me.

Make sure all of these are forked before running install script

1.  <https://github.com/PuddletownDesign/Brew>
2.  <https://github.com/PuddletownDesign/ZSH>
3.  <https://github.com/PuddletownDesign/Atom>
4.  <https://github.com/PuddletownDesign/iTerm>
5.  <https://github.com/PuddletownDesign/Git>
6.  <https://github.com/PuddletownDesign/launchd>
7.  <https://github.com/PuddletownDesign/bin>

## Create your install directory and clone this repo

```bash
mkdir ~/Dev && mkdir ~/Dev/Config && cd ~/Dev/Config

git clone https://github.com/PuddletownDesign/config-installer

cd config-installer
```

Open the `install.sh` file.

Now find and replace all references to `PuddletownDesign` with `your-git-hub-user-name`

## Install all presets

```bash
./install.sh
```

You may need to enter your username and password to proceed.

_Sit back relax while the script installs all my development presets_

## Backing up your changes to github

You can backup all of them at once by running

```bash
backupconfig
```

or individual ones by running:

```bash
backupzsh # backs up zsh
backupgit # backs up git
backupiterm # backs up iterm
backupatom # backs up atom 
backupbin # backs up custom binaries
```
