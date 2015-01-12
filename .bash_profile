export PATH=/usr/local/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Reload .bash_profile
alias reload="source ~/.bash_profile"

# update .bash_profile from github and reload
alias updatebashprofile="curl https://raw.githubusercontent.com/s-taylor/dotfiles/master/.bash_profile > ~/.bash_profile && reload"

# update .vimrc from github
alias updatevimrc="curl https://raw.githubusercontent.com/s-taylor/dotfiles/master/.vimrc > ~/.vimrc"

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

### Git - Log
# decorate = show current commit for head / branch
alias gl="git log --graph --oneline --decorate"

### Git - Current Branch
cb () { 
  branch="$(git symbolic-ref --short -q HEAD)"
  echo "${branch}"
}

### Git - Unmerged Commits on Current Branch
gum () { 
  echo "Unmerged commits on branch \"$(cb)\"...";
  git log $(cb)^..origin/$(cb) --oneline --decorate;
}
