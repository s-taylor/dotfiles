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

" Less syntax highlighting
Plugin 'groenewege/vim-less'

" Ctrl + P - fuzzy file search
Plugin 'kien/ctrlp.vim'

" Editor config for vim
Plugin 'editorconfig/editorconfig-vim'

" Nerdtree File Browser
Plugin 'scrooloose/nerdtree'

" Nerd Commenter
Plugin 'scrooloose/nerdcommenter'

" Airline
Plugin 'bling/vim-airline'

" fugitive (git for Vim)
Plugin 'tpope/vim-fugitive'

" Add Ack for searching
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" --------------
" Nerdtree config
" --------------

" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" --------------
" Airline config
" --------------

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" -----------------
" Keyboard shortcuts
" -----------------
" Remap leader key to ;
:let mapleader = ";"

" Insert a blank line below without entering insert mode
nmap <leader>o o<Esc>
" Insert a blank line above without entering insert mode
nmap <leader>O O<Esc>

" Add shortcuts to next/previous/close buffer
nmap <leader>l :bn<cr>
nmap <leader>h :bp<cr>
nmap <leader>q :bp <BAR> bd #<CR>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Copy + Paste using OSX Clipboard
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p
"
" ------------
" Bubble lines
" ------------
" Single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" ------------
" Backup Files
" ------------
" folder: ~/.vim/tmp must be created!!!

" tell vim to keep a backup file
set backup

" tell vim where to put its backup files
set backupdir=~/.vim/tmp//

" tell vim where to put swap files
set dir=~/.vim/tmp//

" -----------------
" Non-Vundle Stuffs
" -----------------

" Enable syntax highlighting
syntax enable

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

" Show command input (shows line count in visual mode)
set showcmd

" Don't close buffer when editing another file (:e <file>)
set hidden

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

"testing stuff from - http://nvie.com/posts/how-i-boosted-my-vim/
set nowrap        " don't wrap lines
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
