call plug#begin('~/.vim/plugged')

" Ale, Asynchronous lint engine
Plug 'w0rp/ale'

" Add polyglot
" Plug 'sheerun/vim-polyglot'

" " Javascript syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" " Typescript
Plug 'HerringtonDarkholme/yats.vim'

" " Styled Components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Graph QL
Plug 'jparise/vim-graphql'

" " Vim Markdown
" Plug 'godlygeek/tabular', { 'for': 'markdown' }
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Editor config for vim
Plug 'editorconfig/editorconfig-vim'

" Nerdtree File Browser
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

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

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
" > Too slow at the moment!
" Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}

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

" Set python path
if has('mac')
  let g:python_host_prog = '/usr/local/bin/python2'
  let g:python3_host_prog = '/usr/local/bin/python3'
else
  let g:python_host_prog  = '/usr/bin/python2'
  let g:python3_host_prog = '/usr/bin/python3'
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
\  'javascript': ['eslint'],
\  'javascript.jsx': ['eslint'],
\  'typescript': ['eslint'],
\  'typescriptreact': ['eslint']
\}

let g:ale_linters_ignore = {
\  'javascript': ['tsserver'],
\  'javascript.jsx': ['tsserver'],
\}

let g:ale_fix_on_save = 1

" --------------
" vim-javascript
" --------------
let g:javascript_plugin_flow = 1 " Enable flow support

" --------------
" vim-jsx
" --------------
let g:jsx_ext_required = 0 " Don't require .jsx extension

" --------------
" Markdown
" --------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['js=javascript']

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

" ----
" Conquer of Completion (coc.vim)
" ----
let g:coc_node_path = '/home/staylor/.nvm/versions/node/v14.15.0/bin/node'

" Install these plugins
" :CocInstall coc-tsserver
" :CocInstall coc-snippets

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" " Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" " Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')

" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" --------------------------------
" Conquer of Completion - Snippets
" --------------------------------

" Use <C-s> for trigger snippet expand.
imap <C-s> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-s> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" --------------------------------
" Conquer of Completion - Typescript
" --------------------------------
autocmd FileType typescript,typescript.tsx nnoremap <leader>r :CocCommand tsserver.restart<CR>

" --------------------------------
" Conquer of Completion - explorer
" --------------------------------
" nnoremap <C-n> :CocCommand explorer<CR>

" -----------------
" Keyboard shortcuts
" -----------------

" https://stackoverflow.com/questions/16359878/vim-how-to-map-shift-enter
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

"auto-center on movement commands
" nmap G Gzz
" nmap n nzz
" nmap N Nzz
" nmap } }zz
" nmap { {zz
" nmap <C-d> <C-d>zz
" nmap <C-u> <C-u>zz

" Insert a blank line above without entering insert mode
nnoremap <S-Enter> O<Esc>
" Insert a blank line below without entering insert mode
nnoremap <CR> o<Esc>

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

" Insert single character
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>
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

" toggle between relative and absolute line numbers
" nnoremap <leader>r :set rnu!<CR>


