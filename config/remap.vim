" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker:

" basic {{
  inoremap hh <Esc>
  xnoremap J :m '>+1<CR>gv=gv
  xnoremap K :m '<-2<CR>gv=gv
  nnoremap Q <Nop>
  xnoremap < <gv
  xnoremap > >gv
  inoremap <C-v> <C-o>"+]p
  xnoremap <C-c> "+y
  nnoremap <expr> n  'Nn'[v:searchforward]
  nnoremap <expr> N  'nN'[v:searchforward]
  nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
  nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
  nnoremap <space>rl :source ~/.vim/vimrc<CR>
  nnoremap Y y$
  " no overwrite paste
  xnoremap p "_dP
  " clear highlight update diff
  nnoremap <silent> <C-l> :let @/=''<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>
  " some shortcut for git
  " nnoremap gci :Gcommit -v<CR>
  " nnoremap gca :Gcommit -a -v<CR>
  " nnoremap gcc :Gcommit -v -- <C-R>=expand('%')<CR><CR>
  nnoremap gP :CocCommand git.push<CR>
  nnoremap gh :CocCommand clangd.switchSourceHeader<CR>
  nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" }}

" insert keymap like emacs {{
  "inoremap <C-w> <C-[>diwa
  inoremap <C-h> <BS>
  inoremap <C-d> <Del>
  inoremap <C-b> <Left>
  inoremap <C-f> <Right>
  inoremap <C-u> <C-G>u<C-U>
  inoremap <C-a> <Home>
  inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"

" command line alias {{
  cnoremap w!! w !sudo tee % >/dev/null
  cnoremap <C-p> <Up>
  cnoremap <C-n> <Down>
  cnoremap <C-j> <Left>
  cnoremap <C-k> <Right>
  cnoremap <C-b> <S-Left>
  cnoremap <C-f> <S-Right>
  cnoremap <C-a> <Home>
  cnoremap <C-e> <End>
  cnoremap <C-d> <Del>
  cnoremap <C-h> <BS>
  cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>
" }}

" meta keys {{
  vnoremap <M-c> "+y
  inoremap <M-v> <C-o>"+]p
  nnoremap <M-q> :qa!<cr>
  nnoremap <M-s> :silent! wa<cr>
  inoremap <M-s> <C-o>:w<cr>
  nnoremap <M-1> 1gt
  nnoremap <M-2> 2gt
  nnoremap <M-3> 3gt
  nnoremap <M-4> 4gt
  nnoremap <M-5> 5gt
  inoremap <M-1> <C-o>1gt
  inoremap <M-2> <C-o>2gt
  inoremap <M-3> <C-o>3gt
  inoremap <M-4> <C-o>4gt
  inoremap <M-5> <C-o>5gt
" }}

" plugins {{
  " buftabline
  nnoremap <leader>1 1gt
  nnoremap <leader>2 2gt
  nnoremap <leader>3 3gt
  nnoremap <leader>4 4gt
  nnoremap <leader>5 5gt
  nnoremap <leader>6 6gt
  nnoremap <leader>7 7gt
  nnoremap <leader>8 8gt

  " vim-exchange
  "xmap gx <Plug>(Exchange)

" visual search {{
  "  In visual mode when you press * or # to search for the current selection
  xnoremap    <silent> * :call <SID>visualSearch('f')<CR>
  xnoremap    <silent> # :call <SID>visualSearch('b')<CR>
" }}

" functions {{
function! s:visualSearch(direction)
  let       l:saved_reg = @"
  execute   'normal! vgvy'
  let       l:pattern = escape(@", '\\/.*$^~[]')
  let       l:pattern = substitute(l:pattern, "\n$", '', '')
  if        a:direction ==# 'b'
    execute 'normal! ?' . l:pattern . "\<cr>"
  elseif    a:direction ==# 'f'
    execute 'normal! /' . l:pattern . '^M'
  endif
  let       @/ = l:pattern
let       @" = l:saved_reg
endfunction
" }}

" fzf.vim {{
nnoremap <silent><nowait> <space><space>  :Files<cr>
nnoremap <silent><nowait> <space>g :GFiles<cr>
nnoremap <silent><nowait> <space>b :Buffers<cr>
nnoremap <silent><nowait> <space>h :History<cr>
nnoremap <silent><nowait> <space>m :Maps<cr>
nnoremap <silent><nowait> <space>o :Rg<space>
nnoremap <silent><nowait> <space>a :Ag<space>
nnoremap <silent><nowait> <space>t :Tags<cr>
nnoremap <silent><nowait> <space>y :Lines<cr>
nnoremap <silent><nowait> <space>z :Locate<cr>
nnoremap <silent><nowait> <space>/ :BLines<cr>
nnoremap <silent><nowait> <space>? :BCommits<cr>
nnoremap <silent><nowait> <space>q :Commits<cr>
nnoremap <silent><nowait> <space>l :BCommits<cr>
"}}
"
" snippets{{
let g:UltiSnipsExpandTrigger="<c-9>"
" }}

" debug {{

let g:is_debug_mode = 0
map <expr> <F2> <SID>toggle_debug_mode()
autocmd! User VimspectorUICreated call s:setup_mappings()
autocmd! User VimspectorDebugEnded call s:setdown_mappings()

function s:toggle_debug_mode()
  let g:is_debug_mode = !g:is_debug_mode
  if g:is_debug_mode
    echo "enable debug mode"
    call s:setup_mappings()
  else
    echo "disable debug mode"
    call s:setdown_mappings()
  endif
endfunction

function s:setup_mappings()
  let g:is_debug_mode = 1
  nmap c         <Plug>VimspectorContinue
  nmap b         <Plug>VimspectorToggleBreakpoint
  nmap B <Plug>VimspectorToggleConditionalBreakpoint
  nmap <C-b>         <Plug>VimspectorAddFunctionBreakpoint
  nmap <C-r> <Plug>VimspectorRunToCursor
  nmap n        <Plug>VimspectorStepOver
  nmap s       <Plug>VimspectorStepInto
  nmap o       <Plug>VimspectorStepOut
  nmap <silent> q :<C-u>VimspectorReset<Cr>
endfunction

function s:setdown_mappings()
  let g:is_debug_mode = 0
  unmap c
  unmap b
  unmap B
  unmap <C-b>
  unmap <C-r>
  unmap n
  unmap s
  unmap o
  unmap q
endfunction
" }}
" gdb {{
au User TermdebugStartPost call s:setup_gdb_mappings()
au User TermdebugStopPre  call s:setdown_gdb_mappings()

let g:is_gdb_mode = 0
map <expr> <F4> <SID>toggle_gdb_mode()

function s:toggle_gdb_mode()
  let g:is_gdb_mode = !g:is_gdb_mode
  if g:is_gdb_mode
    echo "enable gdb mode"
    call s:setup_gdb_mappings()
  else
    echo "disable gdb mode"
    call s:setdown_gdb_mappings()
  endif
endfunction

function s:setup_gdb_mappings()
  let g:is_gdb_mode = 1
  map <C-_> :<C-u>Gdb<CR>
  tmap <C-_> <Cmd>Source<CR>
endfunction

function s:setdown_gdb_mappings()
  let g:is_gdb_mode = 0
  unmap <C-_>
  tunmap <C-_>
endfunction
" }}
"
" bracket {{
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha
" }}
