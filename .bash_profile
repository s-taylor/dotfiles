export PATH=/usr/local/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Reload .bash_profile
alias reload="source ~/.bash_profile"

# grabs the latest .bash_profile file and reloads the prompt
alias updatebashprofile="curl https://raw.github.com/s-taylor/dotfiles/master/.bash_profile > ~/.bash_profile && reload"

### Custom "ls"
# G = inhibit display of group information
# F = append indicator (one of */=@|) to entries
# l = use a long listing format
# a = do not hide entries starting with .
# s = print size of each file, in blocks
# h = print sizes in human readable format (e.g., 1K 234M 2G)
alias ls="ls -GFlash"

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
  git log $(cb)..origin/$(cb) --oneline --decorate; 
}