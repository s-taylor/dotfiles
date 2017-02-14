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

## Update Vim (requires homebrew)

1. [Install Brew](http://brew.sh/)
1. brew install mercurial
1. brew install the_silver_searcher 

## Update Git (requires homebrew)

1. brew install git

## Install Tmux

1. brew install tmux
1. brew install reattach-to-user-namespace

see [https://superuser.com/questions/397076/tmux-exits-with-exited-on-mac-os-x](https://superuser.com/questions/397076/tmux-exits-with-exited-on-mac-os-x)

## Install Fuzzy Finder

1. brew install fzf

---

# Mac App Store

## Install

1. brew install mas

## Install Apps

1. mas_install (see bin/mas_install)

---

# Git Setup

## Symlink config files

1. `ln -s [DOTFILES_PATH]/.gitignore ~/.gitignore`
1. `ln -s [DOTFILES_PATH]/.gitconfig ~/.gitconfig`


## Link to github

1. Generate an ssh key, [see here](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
1. Add this to your github account, [see here](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

---

# Tmux Setup

## Install Tmux Plugin Manager

1. git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
1. symlink the tmux.conf file `ln -s [DOTFILES_PATH]/.tmux.conf ~/.tmux.conf`

## Install Tmux Plugins

1. Run `tmux`
1. Use shortcut `control + a` + `I` (note: Capital Letter)

---

# Vim Setup

Setup Neovim first!

## Setup

1. Install [vim-plug](https://github.com/junegunn/vim-plug)
1. Symlink the .vimrc file `ln -s [DOTFILES_PATH]/.vimrc ~/.vimrc`
1. Create the folder /.vim/tmp (to store vim swap and backup files)
1. Install Plugins - Open Vim > ":PluginInstall"


---

# Neovim

## Install

1. `brew install neovim/neovim/neovim`

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

1. `pip install --upgrade pip`
1. `sudo pip2 install --upgrade neovim`
1. `brew install python3`
1. `sudo pip3 install --upgrade neovim`

Refer [here](https://neovim.io/doc/user/provider.html#provider-python)

## Keyboard ctrl + h doesn't work

Refer [here](https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work)
And [here](https://github.com/neovim/neovim/issues/2048)

## Install Ruby Gem

`gem install neovim`

## Confirm all is OK

1. `nvim`
1. `:CheckHealth`


## YouCompleteMe

**NOTE:** This is probably now redundant since Plug performs the compile step?

1. `brew install cmake`
1. `cd ~/.vim/plugged/YouCompleteMe`
1. `./install.py --tern-completer`

--tern-completer is for javascript support see https://github.com/Valloric/YouCompleteMe

You must also configure a .tern-project file in each directory or ~/.tern-config
Refer https://github.com/Valloric/YouCompleteMe#configuring-tern-for-node-support

Snippets are saved in the dotfiles repo, so you should create a symlink for this
`ln -s [DOTFILES_PATH]/UltiSnips ~/.vim/UltiSnips`

---

# Node / NVM

1. Install nvm, [see here](https://github.com/creationix/nvm).
1. Tmux forgets your current nvm version when opening new sessions, set this with the command: `nvm alias default [VERSION]`

---

# Atom

## Create snippets symlink

1. `cd /Users/[USERNAME]/.atom`
1. `ln -s [DOTFILES_PATH]/snippets.cson ./`
