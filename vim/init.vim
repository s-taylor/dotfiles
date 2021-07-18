call plug#begin('~/.vim/plugged')

" Ale, Asynchronous lint engine
Plug 'w0rp/ale'

" nvim-treesitter
" source: https://github.com/nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Editor config for vim
Plug 'editorconfig/editorconfig-vim'

" Nerdtree File Browser
" Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Nerd Commenter
Plug 'preservim/nerdcommenter'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

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

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

" Nvim Colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Bbye (Buffer Bye)
Plug 'moll/vim-bbye'

" Surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' " Allows repeating surround commands

" FZF - fuzzy file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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

" Set python path (python 2 is EOL)
if has('mac')
  " let g:python_host_prog = '/usr/local/bin/python2'
  let g:python3_host_prog = '/usr/local/bin/python3'
else
  " let g:python_host_prog  = '/usr/bin/python2'
  let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
endif

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
let g:gruvbox_contrast_dark='hard'

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
" Performance Tweaks
" -----------------
set lazyredraw
set nocursorline

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

" set indentation based on filetype
filetype plugin indent on

" --------------
" Remap leader key to ;
" --------------
let mapleader = "\<Space>"

" -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
" PLUGINS
" -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

" ---------
" nvim-tree
" ---------
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }

" --------------
" Fuzzy Finder (FZF)
" --------------
" File search (excluding git ignore)
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>t :Rg 

" --------------
" Nerd Commenter
" --------------
" Add spaces after comment delimiters by default
 let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" --------------
" Git Gutter
" --------------
" unmap these bindings
let g:gitgutter_map_keys = 0

" --------
" vim-bbye
" --------
nnoremap <C-q> :Bdelete<CR>

" --------------
" Nvim Colorizer
" --------------
lua require'colorizer'.setup()

" --------------
" Plugin configs
" --------------
" how to split your .vimrc https://vi.stackexchange.com/a/24984
source <sfile>:h/init/ale.vim
source <sfile>:h/init/coc.vim
source <sfile>:h/init/lightline.vim
" source <sfile>:h/init/nerdtree.vim

" --------------
" Keybindings
" --------------
source <sfile>:h/init/keybindings.vim
