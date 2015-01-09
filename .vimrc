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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" Non-Vundle Stuffs
"

" Needed to default syntax highlighting to on
if has("syntax")
      syntax on
  endif

" Fix Delete key OSX
:set backspace=indent,eol,start
