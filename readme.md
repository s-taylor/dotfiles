# Configure iTerm2

## Set Alt + Arrow Key to skip words

* iTerm > Preferences
* Profiles
* Keys
* Find the key binding alt + arrow and double click
* Action: send escape sequence
* Value: f / b (for forward / backwards)

## Launch tmux when opening

* iTerm > Preferences
* Profiles
* Sent text at start
* tmux attach -t base || tmux new -s base

---

# Homebrew

## Update Vim (requires homebrew)

1. Install Brew
2. brew install mercurial
3. brew install vim

## Update Git (requires homebrew)

1. brew install git

## Install Tmux

1. brew install tmux
2. brew install reattach-to-user-namespace

see [https://superuser.com/questions/397076/tmux-exits-with-exited-on-mac-os-x](https://superuser.com/questions/397076/tmux-exits-with-exited-on-mac-os-x)

---

# Tmux

# Install Tmux Plugin Manager

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install Tmux Plugins
control+a > I

---

# Vim

## Setup

1. git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
2. Save this .vimrc to ~/
3. create the folder /.vim/tmp (to store vim swap and backup files)
4. Install Plugins - Open Vim > ":PluginInstall"

## YouCompleteMe

1. Install package via Vundle
2. brew install cmake
3. cd ~/.vim/bundle/YouCompleteMe
4. ./install.py --tern-completer 

--tern-completer is for javascript support see https://github.com/Valloric/YouCompleteMe

You must also configure a .tern-project file in each directory or ~/.tern-config
Refer https://github.com/Valloric/YouCompleteMe#configuring-tern-for-node-support

Snippets are saved in the dotfiles repo, so you should create a symlink for this
ln -s /PATH/dotfiles/UltiSnips/ /Users/Nizmox/.vim/
