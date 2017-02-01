# Configure iTerm2

## Fix Alt Key in Vim
* iTerm > Preferences
* Profiles
* Keys
* Left option key acts as `+Esc`

---

# Homebrew

## Update Vim (requires homebrew)

1. [Install Brew](http://brew.sh/)
2. brew install mercurial
3. brew install the_silver_searcher 

## Update Git (requires homebrew)

1. brew install git

## Install Tmux

1. brew install tmux
2. brew install reattach-to-user-namespace

see [https://superuser.com/questions/397076/tmux-exits-with-exited-on-mac-os-x](https://superuser.com/questions/397076/tmux-exits-with-exited-on-mac-os-x)

## Install Fuzzy Finder
1. brew install fzf

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


---

# Neovim

## Install

* `brew install neovim/neovim/neovim`

## Install Vim Plug

Refer [here](https://github.com/junegunn/vim-plug)

## Setup Config

```
mkdir ~/.config/
mkdir ~/.config/nvim
ln -s [DOTFILES]/init.vim ~/.config/nvim/init.vim
ln -s [DOTFILES]/UltiSnips ~/.config/nvim/UltiSnips
```

## Allow Python 2/3 Plugins

* `pip install --upgrade pip`
* `sudo pip2 install --upgrade neovim`
* `brew install python3`
* `sudo pip3 install --upgrade neovim`

Refer [here](https://neovim.io/doc/user/provider.html#provider-python)

## Keyboard ctrl + h doesn't work

Refer [here](https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work)
And [here](https://github.com/neovim/neovim/issues/2048)

## Install Ruby Gem

`gem install neovim`

## Confirm all is OK

* `nvim`
* `:CheckHealth`


## YouCompleteMe

**NOTE:** This is probably now redundant since Plug performs the compile step?

1. `brew install cmake`
2. `cd ~/.vim/plugged/YouCompleteMe`
3. `./install.py --tern-completer`

--tern-completer is for javascript support see https://github.com/Valloric/YouCompleteMe

You must also configure a .tern-project file in each directory or ~/.tern-config
Refer https://github.com/Valloric/YouCompleteMe#configuring-tern-for-node-support

Snippets are saved in the dotfiles repo, so you should create a symlink for this
`ln -s [DOTFILES_PATH]/UltiSnips ~/.vim/UltiSnips`

---

# Node / NVM

* Install nvm, [see here](https://github.com/creationix/nvm).
* Tmux forgets your current nvm version when opening new sessions, set this with the command: `nvm alias default [VERSION]`

---

# Atom

## Create snippets symlink

1. `cd /Users/[USERNAME]/.atom`
2. `ln -s [DOTFILES_PATH]/snippets.cson ./`
