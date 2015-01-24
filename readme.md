#Configure iTerm2

##Set Alt + Arrow Key to skip words

* iTerm > Preferences
* Profiles
* Keys
* Find the key binding alt + arrow and double click
* Action: send escape sequence
* Value: f / b (for forward / backwards)

#Update Vim (requires homebrew)

1. Install Brew
2. brew install mercurial
3. brew install vim

#Update Git (requires homebrew)

1. brew install git

#Vim Config (requires git)

2. git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
3. Save .vimrc to ~/
4. Install Plugins - Open Vim > ":BundleInstall"
