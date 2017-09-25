# Puddletown environment with one command for multiple OSs (Mac, Linux)

Depending on your OS



## [Mac](https://github.com/PuddletownDesign/config-installer/tree/mac) or [Linux](https://github.com/PuddletownDesign/config-installer/tree/linux)


Download the correct branch for your system and then run it with

```shell
$ ./install.sh
```

You will be prompted for your password to install some of the tools.


# Detailed Instruction

## How to back up, restore and share dev configurations on github

We want to back up our development config so that we can back them up and collaborate on them at the same time.

We will be publishing items on github and using forks for personal customizations and pull requests for sharing modifications with each other.

One thing to be aware of is to not publish any personal or unneeded information in files so we will partial commit some of the files.

## For more than one machine

We will create a branch for each machine that we use these configs on. For example `mac` and `ubuntu`. This way we start with our base set up and then make slight modifications for each machine in a new branch.

In the last part we will create a shell script that will auto install everything on a new machine that we will test out using a VM.

## Making the repositories

We want to create one repo for each set of configurations. So atom configs will have it's own repo, zsh will have it's own, zsh themes,

One problem we have right away is that most of these files are probably  littered inside your home directory and there's no solid way to make more than one git repos in a single directory.

### Setting up folders for each repository

We want to copy the needed files for each repo into their own folder.

Something like this:

```
└── Configs
  ├── Atom
  ├── Git
  ├── Linters
  ├── Vim
  ├── ZSH
  ├── ZSH-Theme
  └── iTerm2
```

I suggest putting the Configs directory someplace that's convenient to access so you can make quick edits to the files and they will be accessible to run git commands.

I'll put mine in `~/Dev/Config/`

*I generally use my `Documents` directory to hold configuration files since so a lot of other applications take the liberty of doing so.*

**Make sure to keep a list of the terminal commands that you use setting up this process. We will actually be reusing them again later.**

## Creating the first repo

The first repo we will create will be the easiest because there will be no partially added files.

Let's start with the Atom directory


### Backing up atom configurations

#### Make a list of atoms installed packages

```
$ apm list --installed --bare > ~/.atom/packages.list
```

#### Copy the `.atom` folder contents

Copy the contents of the `~/.atom` directory to the Atom configurations folder (mine is `~/Dev/Config/Atom`). Make sure to get the hidden `.` files as well. Then navigate to that folder in terminal.

#### Initialize a new git repo

Initialize a repo in the configuration folder containing Atom (`~/Dev/Config/Atom`).

```
$  git init
```

#### Modify the `.gitignore` file in the directory

When you run `git status` you'll see all of the files in the directory

```
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.gitignore
	config.cson
	init.coffee
	keymap.cson
	linter-config.json
	package-deps-state.json
	packages.list
	packages/
	snippets.cson
	styles.less
```

You need to back up the following ones

```
.gitignore
config.cson
init.coffee
keymap.cson
linter-config.json
package-deps-state.json
packages.list
snippets.cson
styles.less
```

Add these to the `.gitignore` file:

```
packages/
```

Make sure only `.less`, `.cson`, `.json`, `.coffee`, `.gitignore` and the `.list` file we created are being tracked. **No directories should be tracked**.

#### Add the files and run a commit

```
$ git add .
$ git commit -m "Initial commit"
```

#### Create a github repo named `Atom` and add and push the local repo

```
$ git remote add origin git@github.com:PuddletownDesign/Atom.git
$ git push -u origin master
```

#### Delete the original `.atom` directory and replace it with a symlink

Symlinks are just like aliases in finder. They are a pointer to a file. The computer generally assumes that the symlink is the file itself and treats it the same.

First delete the original `~/atom` folder. Then create the symlink with:

```
$  ln -s ~/Dev/Config/Atom ~/.atom
```

#### Restart atom

Restart atom and make sure everything is running correctly. If so it's now running it's configs out of the custom repo you made!

### Forking a repo and using it as you're own

Perhaps you'd like to use my atom configuration or someone elses?

Go to github and fork the repo that you want to use. *Make sure that it's contents are in order*

Then clone it to the desired location.

Temporarily back up you're existing atom directory by copying it to the desktop for safe keeping.

Delete the default `~/.atom` folder.

```
$ trash ~/.atom
```

Then symlink it to the correct location

```
$  ln -s ~/Your/Atom/Repo ~/.atom
```

Restart atom and you're done!

## Getting back your configuration on a new machine

Set up your directory to hold configs and clone atom there. My atom config will be in `~/Dev/Config/Atom`

```
$ take ~/Dev/Config
```

Clone your github repo. Mine is:

```
$ git clone https://github.com/PuddletownDesign/Atom
```

now install atom application either in finder or through brew

```
$ brew cask install atom
```

Then create the symlink

```
$  ln -s ~/Dev/Config/Atom ~/.atom
```

Install all of the packages

```
$ apm install --packages-file Atom/packages.list
```

Retart Atom. Your configuration will be the same as the last time you commited it!

## Lets Automate it

Let's build two scripts will handle backing up atom and publishing changes and another that will restore your settings on a new machine. You will put the recovery script on github as well. When you need to restore you will simply clone the recovery script and run it. Atom will be downloaded to the new machine with all of your configurations restored.

### Script 1: Backup

We will want to create a shell script that will be run whenever we make changes to our atom config. it will add the changes, commit them and push them to github.

`~/Dev/Config/Atom/backup.sh`
```
cd ~/Dev/Config/Atom
git add .
git commit -m "updated atom preferences"
git push origin master
```

### Script 2: Restore

`~/Dev/Config/Atom/restore.sh`
```
take ~/Dev/Config
git clone https://github.com/PuddletownDesign/Atom
ln -s ~/Dev/Config/Atom/ ~/.atom
brew cask install atom
apm install --packages-file Atom/packages.list
```



## Creating a repo with files that contain personal information

We will have to do partial adds of files called `hunks` so as not to upload lines to the public that might be sensitive. Sure, we could create a private repository at bitbucket or similar but what's the fun in that? Share you're tools with the public so that they might improve upon them.

Let's work with git next....


### Backing up Git settings

You'll want to back up two files in this repository.

```
.gitconfig
.gitignore_global
```

`.gitconfig` holds all of the configuration options for you including name, email, repo and all of your aliases.

`.gitignore_global` holds all of the file types and directories to ignore by default.

As we start using more tools and refining existing ones these files will grow larger and need to be updated.

First Create a Directory that will be our repo to for the two files.

I'll create mine at `~/Dev/Config/Git`. *Replace this path with your own path in the following examples*

```
$ take ~/Dev/Config/Git
```

Add a `README.md`

```
touch README.md
```

Now copy the `.gitignore_global` and `.gitconfig` from your `~` directory.

Then Initialize a repository there with `git init` and delete the `.gitignore` file that was created. **Not the `gitignore_global` file**

```
$ rm .gitignore
```

Running `git status` you should see:

```
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.gitconfig
	.gitignore_global
	README.md
```

Before adding these files to be staged. The `.gitconfig` contains some personal information that would be good to add for our own back up, but we might not want to share to the public.

Namely this stuff
```
[user]
    name = Brent
    username = PuddletownDesign
    email = puddletowndesign@gmail.com
[core]
    excludesfile = /Users/Brent/.gitignore_global
    editor = "atom -w"
```

We want to exclude only these lines from being added for staging. So we will use only partial commits.

See this stackoverflow thread for more information: <http://stackoverflow.com/questions/1085162/commit-only-part-of-a-file-in-git>

#### Adding only part of a file to git staging

`$ git add -p .gitconfig`
