set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'VundleVim/Vundle.vim'

" Javascript syntax highlighting
Plugin 'jelera/vim-javascript-syntax'

" Jade syntax highlighting
Plugin 'digitaltoad/vim-jade'

" Less syntax highlighting
Plugin 'groenewege/vim-less'

" Coffeescript syntax highlighting
Plugin 'kchmck/vim-coffee-script'

" Ctrl + P - fuzzy file search
Plugin 'ctrlpvim/ctrlp.vim'

" Indent Guidelines ( <leader>ig )
Plugin 'nathanaelkane/vim-indent-guides'

" Editor config for vim
Plugin 'editorconfig/editorconfig-vim'

" Nerdtree File Browser
Plugin 'scrooloose/nerdtree'

" Nerd Commenter
Plugin 'scrooloose/nerdcommenter'

" Airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" fugitive (git for Vim)
Plugin 'tpope/vim-fugitive'

" Git Gutter
Plugin 'airblade/vim-gitgutter'

" Add Ack for searching
Plugin 'mileszs/ack.vim'

" Delimit Mate (auto close brackets)
Plugin 'Raimondi/delimitMate'

" Syntastic - syntax checker
Plugin 'scrooloose/syntastic'

" Tmux navigator
Plugin 'christoomey/vim-tmux-navigator'

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

" Vim Multiple Cursors
Plugin 'terryma/vim-multiple-cursors'

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" UltiSnip
Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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

" --------------
" Remap leader key to ;
" --------------
let mapleader = "\<Space>"

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

autocmd FileType qf noremap <buffer> <Tab> <nop>
autocmd FileType qf noremap <buffer> <S-Tab> <nop>
autocmd FileType qf noremap <buffer> <C-q> <nop>
" Hide the quickfind buffer so buffer next/previous don't switch to it
autocmd FileType qf set nobuflisted

" --------------
" CTRL + P
" --------------
"define default keymapping and mode
let g:ctrlp_map = '<c-p>'

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
nmap <leader>s :Errors<CR>

"customise syntastic symbols
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "⚠"

" user jscs for javascript if .jscsrc file exists, else use jshint
autocmd FileType javascript let b:syntastic_checkers = findfile('.jscsrc', '.;') != '' ? ['jscs'] : ['jshint']

" enable es6 syntax for jscs
let g:syntastic_javascript_jscs_args = "--esnext"

" --------------
" Vim Multiple Cursors
" --------------
" disable default keymappings
let g:multi_cursor_use_default_mapping=0

" enable select next with ctrl + m
"let g:multi_cursor_next_key='<C-m>'

" exit multi cursor mode
let g:multi_cursor_quit_key='<Esc>'


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
nmap <leader>o o<Esc>
" Insert a blank line above without entering insert mode
nmap <leader>O O<Esc>

" Add shortcuts to next/previous/close buffer
nmap <Tab> :bn<cr>
nmap <S-Tab> :bp<cr>
nmap <C-q> :bp <BAR> bd #<CR>

" Close window
nmap <C-x> <C-w>q

" Default to using System Clipboard
set clipboard^=unnamed,unnamedplus

" Delete to 'black hole' register
vmap x "_d

" Replace text with clipboard
vmap p "_dP
"
" Reload .vimrc
nmap <leader>r :so $MYVIMRC<CR>

" ------------
" Bubble lines
" ------------
" Single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Multiple lines
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]

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

" Show command input (shows line count in visual mode)
set showcmd

" Don't close buffer when editing another file (:e <file>)
set hidden

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Add an 81 charater length indicator
set colorcolumn=81

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
