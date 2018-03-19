call plug#begin('~/.vim/plugged')

" Ale, Asynchronous lint engine
Plug 'w0rp/ale'

" Javascript syntax highlighting
Plug 'othree/yajs.vim', { 'tag': '1.6', 'for': 'javascript' }

" Typescript
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'Shougo/vimproc.vim', { 'for': 'typescript', 'do': 'make -f make_mac.mak' } "required by tsuquyomi

" Styled Components
Plug 'styled-components/vim-styled-components'

" Vim Markdown
Plug 'godlygeek/tabular', { 'for': 'markdown' }

" Editor config for vim
Plug 'editorconfig/editorconfig-vim'

" Nerdtree File Browser
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Nerd Commenter
Plug 'scrooloose/nerdcommenter'

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'

" fugitive (git for Vim)
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " Required to facilitate :Gbrowse

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Delimit Mate (auto close brackets)
Plug 'Raimondi/delimitMate'

" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" gruvbox color scheme
Plug 'morhetz/gruvbox'

" YouCompleteMe (with post install hook to compile for JS)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

" UltiSnip
Plug 'SirVer/ultisnips'

" CSS colors
Plug 'ap/vim-css-color'

" Bbye (Buffer Bye)
Plug 'moll/vim-bbye'

" vim-node
Plug 'moll/vim-node', { 'for': 'javascript' }

" Surround
Plug 'tpope/vim-surround'

" FZF - fuzzy file search
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

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
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" fix YouCompleteMe python path issue
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" --------------
" Remap leader key to ;
" --------------
let mapleader = "\<Space>"

" --------------
" YATS (typescript syntax)
" --------------
" Set .tsx files to typescript filetype (YATS doesn't officially support .tsx)
augroup filetypedetect
    au BufRead,BufNewFile *.tsx set filetype=typescript
augroup END

" --------------
" Ale
" --------------
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight link ALEErrorSign GruvboxRedSign
highlight link ALEWarningSign GruvboxYellowSign

" Don't lint on text change (only lint on save)
let g:ale_lint_on_text_changed = 'never'

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint', 'eslint']
\}

let g:ale_fix_on_save = 1

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

" ---------
" Lightline
" ---------
set noshowmode " Hide --INSERT-- since Lightline shows mode

let g:lightline = {
  \   'colorscheme': 'gruvbox',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch' ], 
  \              [ 'readonly', 'relativepath', 'modified' ]
  \     ],
  \     'right': [ [ 'filetype' ] ]
  \   },
  \   'inactive': {
  \     'left':[ [ 'readonly', 'relativepath', 'modified' ] ],
  \     'right': [ [ 'filetype' ] ]
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.separator = {
  \   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
  \   'left': '', 'right': '' 
  \}

" ----------------------
" Lightline - bufferline
" ----------------------
set showtabline=2 " Show tabline
let g:lightline#bufferline#show_number = 2 " Show ordinal numbers
let g:lightline#bufferline#unicode_symbols = 1 " Use unicode symbols
let g:lightline#bufferline#filename_modifier = ':t' "Show filename only

let g:lightline.tabline = { 'left': [ ['buffers'] ], 'right': [ ['close'] ] }
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" jump to buffer using ordinal numbers
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" --------------
" Fuzzy Finder (FZF)
" --------------
" File search (excluding git ignore)
nnoremap <Leader>p :GFiles<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Ag 

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

" --------
" vim-bbye
" --------
nnoremap <C-q> :Bdelete<CR>

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
"nnoremap <C-q> :bd<CR>

" Close window
nnoremap <C-x> <C-w>q

" Delete to 'black hole' register
nnoremap x "_x
vnoremap x "_d

" Replace text with clipboard
vnoremap p "_dP
"
" Reload .vimrc
nnoremap <leader>! :so $MYVIMRC<CR>

" Find selected word (But don't skip to next)
nnoremap * *N

" Split Window
nnoremap \ :vsplit<CR>
nnoremap - :split<CR>

" Copy relative path to clipboard
nnoremap <leader>yr :let @+=expand('%')<CR>
" Copy full path to clipboard
nnoremap <leader>yp :let @+=expand('%:p')<CR>

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
  set listchars=tab:▸\ ,eol:¬,trail:·
  set list
endif

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" -----------------
" Preferences
" -----------------
" No backups
set nobackup
set noswapfile
set nowb

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

" Add mouse support in neovim
set mouse=a

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
