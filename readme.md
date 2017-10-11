# System Preferences

## Change Caps Lock to Control

1. System Preferences > Keyboard
1. Modifier Keys... button
1. Change 'Caps Lock' to 'Control'

---

# Configure iTerm2

## Fix Alt Key in Vim

1. iTerm > Preferences
1. Profiles
1. Keys
1. Left option key acts as `+Esc`

## Set Font

1. Copy `/fonts/Monaco for Powerline.ttf` to `~/Library/Fonts`
1. iTerm > Preferences
1. Profiles
1. Text
1. Change Font
1. Set Family to "Monaco for Powerline"

---

# Homebrew

1. [Install Brew](http://brew.sh/)
1. run `install` script

---

# Mac App Store

## Install

1. brew install mas
1. run `mas_install` script

---

# Prezto

1. go to https://github.com/s-taylor/prezto
1. follow installation instructions

---

# Git Setup

1. Generate an ssh key, [see here](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
1. Add this to your github account, [see here](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

---

# Symlink files

1. create `~/Projects/personal` folder and cd into it
1. git clone https://github.com/s-taylor/dotfiles
1. cd dotfiles
1. run `symlink` script (MUST BE RUN FROM DOTFILES ROOT, NOT `.bin`! DUE TO `PWD`)

---

# Tmux Setup

## Install Tmux Plugin Manager

1. git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
1. symlink the tmux.conf file `ln -s [DOTFILES_PATH]/.tmux.conf ~/.tmux.conf`

## Install Tmux Plugins

1. Run `tmux`
1. Use shortcut `control + a` + `I` (note: Capital Letter)

---

# Neovim Setup

## Setup

1. Install [vim-plug](https://github.com/junegunn/vim-plug)
1. Install Plugins - Open Vim > ":PlugInstall"

## Allow Python 2/3 Plugins

1. `sudo pip2 install --upgrade neovim`
1. `brew install python3`
1. `sudo pip3 install --upgrade neovim`

Refer [here](https://neovim.io/doc/user/provider.html#provider-python)

## Keyboard ctrl + h doesn't work

Run the commands
```
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
$TERM.ti
```

Refer [here](https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work)
And [here](https://github.com/neovim/neovim/issues/2048)

## Install Ruby Gem

`gem install neovim`

## Confirm all is OK

1. nvim -u NORC
1. :CheckHealth

## YouCompleteMe

**NOTE:** This is only necessary if PlugInstall post install hook fails

1. `brew install cmake`
1. `cd ~/.vim/plugged/YouCompleteMe`
1. `./install.py --tern-completer`

--tern-completer is for javascript support see https://github.com/Valloric/YouCompleteMe

You must also configure a .tern-project file in each directory or ~/.tern-config
Refer https://github.com/Valloric/YouCompleteMe#configuring-tern-for-node-support

Snippets are saved in the dotfiles repo, so you should create a symlink for this
`ln -s [DOTFILES_PATH]/UltiSnips ~/.vim/UltiSnips`

Getting this error `YouCompleteme unavailable : no module named future` ?
[Github Issue Link](https://github.com/Valloric/YouCompleteMe/issues/2271)

---

# Node / NVM

1. Install nvm, [see here](https://github.com/creationix/nvm).
1. Tmux forgets your current nvm version when opening new sessions, set this with the command: `nvm alias default [VERSION]`

## Install Modules

1. yarn global add eslint
1. yarn global add np
1. yarn global add git-open

---

# Manual Install (not on App Store)

1. Atom
1. Tower 2
1. Dash
1. Sketch
1. Slack
1. Spotify

---

# Atom

## Create snippets symlink

1. `cd /Users/[USERNAME]/.atom`
1. `ln -s [DOTFILES_PATH]/snippets.cson ./`

---
