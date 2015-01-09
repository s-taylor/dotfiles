set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" Javascript syntax highlighting
Plugin 'pangloss/vim-javascript'

" Jade syntax highlighting
Plugin 'digitaltoad/vim-jade'

" Monokai colour scheme
Plugin 'sickill/vim-monokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" Non-Vundle Stuffs
"

" Fix Delete key OSX
:set backspace=indent,eol,start

" Add line numbers to vim
:set number

" Required for Solarized colour scheme
syntax enable
colorscheme monokai
