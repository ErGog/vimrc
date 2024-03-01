" extensions config
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_extensions = ['branch', 'tabline', 'lsp', 'bufferline']
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.linenr = ' :'
let g:airline#extensions#lsp#error_symbol = 'E:'
let g:airline#extensions#lsp#warning_symbol = 'W:'
let g:airline#extensions#lsp#show_line_numbers = 1
let g:airline#extensions#lsp#open_lnum_symbol = '(L'
let g:airline#extensions#lsp#close_lnum_symbol = ')'
let g:airline#extensions#lsp#progress_skip_time = 0.3

" theme config
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline_theme='deus'
" let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

set background=dark
:hi Pmenu term=standout ctermbg=NONE ctermfg=NONE guibg=black guifg=white
