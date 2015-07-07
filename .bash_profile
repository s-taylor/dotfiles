# /usr/local/bin - brew installs / node modules
# ~/bin - custom shell scripts (i.e. git-open)
export PATH=/usr/local/bin:~/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Add Git Branch Name Auto Completion
# copy .git-completion.bash to ~/
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

### Reload .bash_profile
alias reload="source ~/.bash_profile"

# update .bash_profile from github and reload
alias updatebashprofile="curl https://raw.githubusercontent.com/s-taylor/dotfiles/master/.bash_profile > ~/.bash_profile && reload"

# update .vimrc from github
alias updatevimrc="curl https://raw.githubusercontent.com/s-taylor/dotfiles/master/.vimrc > ~/.vimrc"

# update .gitconfig from github
alias updategitconfig="curl https://raw.githubusercontent.com/s-taylor/dotfiles/master/.gitconfig > ~/.gitconfig"

# Launch PathFinder from current folder
alias pf="open -a /Applications/Path\ Finder.app/ ."

### Custom "ls"
# G = inhibit display of group information
# F = append indicator (one of */=@|) to entries
# l = use a long listing format
# a = do not hide entries starting with .
# s = print size of each file, in blocks
# h = print sizes in human readable format (e.g., 1K 234M 2G)
alias ls="ls -GFlash"

### Additional cd aliases
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels

### Clear screen
alias c='clear' 

### NPM install AU
alias npmau="npm install --registryhttp://registry.npmjs.org.au"

### Show SSH Config
alias sshconf="less ~/.ssh/config"

### Git - Current Branch
cb () { 
  branch="$(git symbolic-ref --short -q HEAD)"
  echo "${branch}"
}

### Git - Unmerged Commits on Current Branch
gum () { 
  echo "Unmerged commits on branch \"$(cb)\"...";
  git log $(cb)..origin/$(cb) --oneline --decorate;
}

### Heroku - Add Remote - Input = Branch Name, App Name
har () {
  git remote add "$1" git@heroku.com:"$2".git;
}
