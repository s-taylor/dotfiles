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
