set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" Javascript syntax highlighting
Plugin 'jelera/vim-javascript-syntax'

" Jade syntax highlighting
Plugin 'digitaltoad/vim-jade'

" Monokai colour scheme
Plugin 'sickill/vim-monokai'

" Ctrl + P - fuzzy file search
Plugin 'kien/ctrlp.vim'

" Editor config for vim
Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Required for monokai colour scheme
syntax enable
colorscheme monokai

"
" Non-Vundle Stuffs
"

" Fix Delete key OSX
set backspace=indent,eol,start

" Add line numbers to vim
set number

" Use the same symbols as TextMate for tabstops and EOLs
if has('mac')
	set listchars=tab:▸\ ,eol:¬
	set list
endif

" Display tabs as 2 space width
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Remap leader key to ;
:let mapleader = ";"

" Add shortcuts to next/previous/close buffer
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bd<cr>
