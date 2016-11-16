call plug#begin('~/.vim/plugged')

" Neomake, asynchronous programs
Plug 'neomake/neomake'

" Javascript syntax highlighting
Plug 'jelera/vim-javascript-syntax'

" Ctrl + P - fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'

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

" Add Ack for searching
Plug 'mileszs/ack.vim'

" Delimit Mate (auto close brackets)
Plug 'Raimondi/delimitMate'

" Syntastic - syntax checker
Plug 'scrooloose/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'

" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" Solarized color scheme
Plug 'altercation/vim-colors-solarized'

" YouCompleteMe (with post install hook to compile for JS)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" UltiSnip
Plug 'SirVer/ultisnips'

" BufOnly
Plug 'schickling/vim-bufonly'

" CSS colors
Plug 'ap/vim-css-color'

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
" Solarized
" --------------
"use F5 to toggle between solarized light and dark
call togglebg#map("<F5>")

" --------------
" Nerdtree config
" --------------

" shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" prevent buffer next, previous and delete when focused on Nerdtree
autocmd FileType nerdtree noremap <buffer> <Tab> <nop>
autocmd FileType nerdtree noremap <buffer> <S-Tab> <nop>
autocmd FileType nerdtree noremap <buffer> <C-q> <nop>

" --------------
" Airline config
" --------------
" always show airline (even without window split)
set laststatus=2

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" --------------
" Ack config
" --------------
" enable Ag (the silver searcher) when available
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
	let g:ackprg = 'ag --nogroup --nocolor --column --ignore=*min.js'
endif

" shortcut to open Ack search
nnoremap <Leader>a :Ack ""<Left>

autocmd FileType qf noremap <buffer> <Tab> <nop>
autocmd FileType qf noremap <buffer> <S-Tab> <nop>
autocmd FileType qf noremap <buffer> <C-q> <nop>
" Hide the quickfind buffer so buffer next/previous don't switch to it
autocmd FileType qf set nobuflisted

" --------------
" CTRL + P
" --------------
"define default keymapping and mode
nnoremap <Leader>p :CtrlP<CR>

" set mru files to use relative directory
let g:ctrlp_mruf_relative = 1

"exclude files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" default to regex search
let g:ctrlp_regexp = 1

" --------------
" Git Gutter
" --------------
" remap default key bindings so these don't interfere with buffer previous
nmap <Leader>gs <Plug>GitGutterStageHunk
nmap <Leader>gr <Plug>GitGutterRevertHunk
nmap <Leader>gp <Plug>GitGutterPreviewHunk

" --------------
" Syntastic
" --------------
" to use jscs you need to npm install -g jscs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" do not show syntastic error list on buffer open (open with :Errors)
" auto close the syntastic error list when no errors exist
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" open syntastic error list with Control + s
nmap <leader>e :Errors<CR>

"customise syntastic symbols
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "⚠"

" --------------
" Ultisnip
" --------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<C-s>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" --------------
" BufOnly
" --------------
" Shortcut to execute
nnoremap <leader>b :BufOnly<CR>

" -----------------
" Keyboard shortcuts
" -----------------

" Map Esc to jj in insert mode
inoremap jj <Esc>

" Insert a blank line below without entering insert mode
nnoremap <leader>o o<Esc>
" Insert a blank line above without entering insert mode
nnoremap <leader>O O<Esc>

" Save file
nnoremap <leader>w :w<CR>

" Add shortcuts to next/previous/close buffer
nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cr>
nnoremap <C-q> :bp <BAR> bd #<CR>

" Close window
nnoremap <C-x> <C-w>q

" Delete to 'black hole' register
vnoremap x "_d

" Replace text with clipboard
vnoremap p "_dP
"
" Reload .vimrc
nnoremap <leader>! :so $MYVIMRC<CR>

" Find and Replace shortcut
nnoremap <Leader>f :%s/
nnoremap <leader>r :%s/<C-r><C-w>//gc<Left><Left><Left>

" Change find word to not jump to next by default
nnoremap * *N

" Find selected text in visual moade
vnoremap * y/<C-R>"<CR>N

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

" Set colorscheme default
set background=dark
colorscheme solarized

" Default to using System Clipboard
set clipboard^=unnamed,unnamedplus

" Fix Delete key OSX
set backspace=indent,eol,start

" Add line numbers to vim
set number

" Use the same symbols as TextMate for tabstops and EOLs
if has('mac')
  set listchars=tab:▸\ ,eol:¬
  set list
endif

" Tabs are 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Show command input (shows line count in visual mode)
set showcmd

" Don't close buffer when editing another file (:e <file>)
set hidden

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Add an 121 charater length indicator
set colorcolumn=121

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
