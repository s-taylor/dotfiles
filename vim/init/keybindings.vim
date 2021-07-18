" switch to visual block mode
" nnoremap <C-q> <c-v>

autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" https://stackoverflow.com/questions/16359878/vim-how-to-map-shift-enter
" Insert a blank line above without entering insert mode
nnoremap <C-Enter> O<Esc>
" Insert a blank line below without entering insert mode
nnoremap <CR> o<Esc>

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

" Replace selected text
vnoremap <leader>f "fy:%sno/<C-R>f/<C-R>f/gc<Left><Left><Left>

" toggle between relative and absolute line numbers
" nnoremap <leader>r :set rnu!<CR>
