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

