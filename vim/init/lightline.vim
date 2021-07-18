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

