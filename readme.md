# Configure iTerm2

## Set Alt + Arrow Key to skip words

* iTerm > Preferences
* Profiles
* Keys
* Find the key binding alt + arrow and double click
* Action: send escape sequence
* Value: f / b (for forward / backwards)

---

# Homebrew

## Update Vim (requires homebrew)

1. [Install Brew](http://brew.sh/)
2. brew install mercurial
3. brew install vim

## Update Git (requires homebrew)

1. brew install git

## Install Tmux

1. brew install tmux
2. brew install reattach-to-user-namespace

see [https://superuser.com/questions/397076/tmux-exits-with-exited-on-mac-os-x](https://superuser.com/questions/397076/tmux-exits-with-exited-on-mac-os-x)

---

# Node / NVM

* Install nvm, [see here](https://github.com/creationix/nvm).
* Tmux forgets your current nvm version when opening new sessions, set this with the command: `nvm alias default [VERSION]`

---

# Git Setup

## Symlink config files

* `ln -s [DOTFILES_PATH]/.gitignore ~/.gitignore`
* `ln -s [DOTFILES_PATH]/.gitconfig ~/.gitconfig`


## Link to github

* Generate an ssh key, [see here](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
* Add this to your github account, [see here](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

---

# Tmux Setup

## Install Tmux Plugin Manager

* git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
* symlink the tmux.conf file `ln -s [DOTFILES_PATH]/.tmux.conf ~/.tmux.conf`

## Install Tmux Plugins

* Run `tmux`
* Use shortcut `control + a` + `I` (note: Capital Letter)

---

# Vim Setup

Setup Neovim first!

## Setup

1. Install [vim-plug](https://github.com/junegunn/vim-plug) 
2. Symlink the .vimrc file `ln -s [DOTFILES_PATH]/.vimrc ~/.vimrc`
3. Create the folder /.vim/tmp (to store vim swap and backup files)
4. Install Plugins - Open Vim > ":PluginInstall"

## YouCompleteMe

1. Install package via Vundle
2. `brew install cmake`
3. `cd ~/.vim/plugged/YouCompleteMe`
4. `./install.py --tern-completer`

--tern-completer is for javascript support see https://github.com/Valloric/YouCompleteMe

You must also configure a .tern-project file in each directory or ~/.tern-config
Refer https://github.com/Valloric/YouCompleteMe#configuring-tern-for-node-support

Snippets are saved in the dotfiles repo, so you should create a symlink for this
`ln -s [DOTFILES_PATH]/UltiSnips ~/.vim/UltiSnips`

---

# Atom

## Create snippets symlink

1. `cd /Users/[USERNAME]/.atom`
2. `ln -s [DOTFILES_PATH]/snippets.cson ./`

---

# Neovim

## Install

* `brew install neovim/neovim/neovim`

## Setup Config

* `mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}`
* `ln -s ~/.vim $XDG_CONFIG_HOME/nvim`

Currently using a separate config file for neovim

* `ln -s [DOTFILES_PATH]/init.vim $XDG_CONFIG_HOME/nvim/init.vim`

## Allow Python 2/3 Plugins

* `sudo pip2 install --upgrade neovim`
* `brew install python3`
* `sudo pip3 install --upgrade neovim`

Refer [here](https://neovim.io/doc/user/provider.html#provider-python)

## Keyboard ctrl + h doesn't work

Refer [here](https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work)
And [here](https://github.com/neovim/neovim/issues/2048)

## Confirm all is OK

* `nvim`
* `:CheckHealth`
