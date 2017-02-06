call plug#begin('~/.vim/plugged')

" Neomake, asynchronous programs
Plug 'neomake/neomake'

" Javascript syntax highlighting
Plug 'jelera/vim-javascript-syntax'

" Pug (formerly Jade) syntax highlighting
Plug 'https://github.com/digitaltoad/vim-pug'

" FZF - fuzzy file search
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" Indent Guidelines ( <leader>ig )
Plug 'nathanaelkane/vim-indent-guides'

" Editor config for vim
Plug 'editorconfig/editorconfig-vim'

" Nerdtree File Browser
Plug 'scrooloose/nerdtree'

" Nerd Commenter
Plug 'scrooloose/nerdcommenter'

" Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" fugitive (git for Vim)
Plug 'tpope/vim-fugitive'

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Delimit Mate (auto close brackets)
Plug 'Raimondi/delimitMate'

" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" gruvbox color scheme
Plug 'morhetz/gruvbox'

" YouCompleteMe (with post install hook to compile for JS)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" UltiSnip
Plug 'SirVer/ultisnips'

" CSS colors
Plug 'ap/vim-css-color'

" Bbye (Buffer Bye)
Plug 'moll/vim-bbye'

" vim-node
Plug 'moll/vim-node'

" Surround
Plug 'tpope/vim-surround'

" Add plugins to &runtimepath
call plug#end()

" This is required for control + q shortcuts to work
silent !stty -ixon > /dev/null 2>/dev/null

" Enable Ctrl + Arrow Keys in Vim when using Tmux
" https://superuser.com/questions/401926/how-to-get-shiftarrows-and-ctrlarrows-working-in-vim-in-tmux
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Link python executables
" https://github.com/neovim/neovim/issues/4535
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" --------------
" Remap leader key to ;
" --------------
let mapleader = "\<Space>"

" --------------
" Neomake
" --------------
autocmd! BufWritePost,BufEnter * Neomake

" use neomake for eslint
let g:neomake_javascript_enabled_makers = ['eslint']

" --------------
" Nerdtree config
" --------------

" shortcut to open NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Close after opening a file
let NERDTreeQuitOnOpen = 1

augroup nerdtree_bindings
  autocmd! 

  " close vim if the only window left open is a NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " prevent buffer next, previous and delete when focused on Nerdtree
  autocmd FileType nerdtree nnoremap <buffer> <Tab> <nop>
  autocmd FileType nerdtree nnoremap <buffer> <S-Tab> <nop>
  autocmd FileType nerdtree nnoremap <buffer> <C-p> <nop>
  autocmd FileType nerdtree nnoremap <buffer> <Leader>p <nop>

  " exit nerd tree with control + q
  autocmd FileType nerdtree nnoremap <buffer> <C-q> :NERDTreeToggle<CR>
augroup END

" --------------
" Airline config
" --------------
" always show airline (even without window split)
set laststatus=2

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Use powerline fonts
let g:airline_powerline_fonts = 1

" --------------
" Fuzzy Finder (FZF)
" --------------
" File search
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>b :Buffers<CR>

" --------------
" Git Gutter
" --------------
" unmap these bindings
let g:gitgutter_map_keys = 0

" --------------
" Ultisnip
" --------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<C-s>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" -----------------
" Keyboard shortcuts
" -----------------

" Insert a blank line below without entering insert mode
nnoremap <leader>o o<Esc>
" Insert a blank line above without entering insert mode
nnoremap <leader>O O<Esc>

" Save file
nnoremap <leader>w :w<CR>

" Add shortcuts to next/previous/close buffer
nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cr>
nnoremap <C-q> :Bdelete<CR>

" Close window
nnoremap <C-x> <C-w>q

" Delete to 'black hole' register
nnoremap x "_x
vnoremap x "_d

" Replace text with clipboard
vnoremap p "_dP
"
" Reload .vimrc
nnoremap <leader>1 :so $MYVIMRC<CR>
nnoremap <leader>! :so $MYVIMRC<CR>

" Find selected word (But don't skip to next)
nnoremap * *N

" Split Window
nnoremap \ :vsplit<CR>
nnoremap - :split<CR>

" Find selected text in visual moade
" copy text to the "y" register, then perform find for "y", jump back one result so cursor does not move
vnoremap * "fy/<C-R>f<CR>N

" Replace selected text
vnoremap <leader>f "fy:%sno/<C-R>f/<C-R>f/gc<Left><Left><Left>

" provide hjkl movements in Command-line mode via the <Alt> modifier key
cnoremap <M-h> <Left>
cnoremap <M-j> <Down>
cnoremap <M-k> <Up>
cnoremap <M-l> <Right>

" Map Esc to jj in insert mode
inoremap jj <Esc>

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <M-h> <C-o>h
inoremap <M-j> <C-o>j
inoremap <M-k> <C-o>k
inoremap <M-l> <C-o>l

" toggle between relative and absolute line numbers
nnoremap <leader>r :set rnu!<CR>

" ------------
" Backup Files
" ------------
" No backups
set nobackup
set noswapfile
set nowb

" -----------------
" Config
" -----------------
" Enable true colour in vim
if has("termguicolors")
  set termguicolors
endif

" Resolve issue with <C-h>
" see https://github.com/neovim/neovim/issues/2048
if has('nvim')
  nmap <BS> <C-W>h
endif

" Set colorscheme default
colorscheme gruvbox
set background=dark

" Default to using System Clipboard
set clipboard^=unnamed,unnamedplus

" Fix Delete key OSX
set backspace=indent,eol,start

" Enable syntax highlighting
syntax enable

" Use the same symbols as TextMate for tabstops and EOLs
if has('mac')
  set listchars=tab:▸\ ,eol:¬
  set list
endif

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" -----------------
" Preferences
" -----------------
" Add line numbers to vim
set number

" Set line numbers to relative
set rnu

" Tabs are 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Show command input (shows line count in visual mode)
set showcmd

" Don't close buffer when editing another file (:e <file>)
set hidden

" Add an 121 charater length indicator
set colorcolumn=121

"testing stuff from - http://nvie.com/posts/how-i-boosted-my-vim/
set nowrap          " don't wrap lines
set autoindent      " always set autoindenting on
set copyindent      " copy the previous indentation on autoindenting
set showmatch       " set show matching parenthesis
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch        " highlight search terms
set incsearch       " show search matches as you type
set history=1000    " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title           " change the terminal's title
set visualbell      " don't beep
set noerrorbells    " don't beep
