" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0:
let g:mapleader = ','

" basic {{
  " Edit file in current file folder
  nnoremap <leader>n :Lexplore<CR>
  nnoremap <leader>rn :LspRename<CR>
  nnoremap <leader>q :silent! Bdelete!<CR>
  nnoremap <leader>e :e <C-R>=substitute(expand('%:p:h').'/', getcwd().'/', '', '')<CR>
  "nnoremap <leader>e :LeaderfFile <C-R>=substitute(expand('%:p:h').'/', getcwd().'/', '', '')<CR><CR>
  nnoremap <leader>w :w<CR>
  nnoremap <leader>v :vs <C-R>=substitute(expand('%:p:h').'/', getcwd().'/', '', '')<CR>
  nnoremap <leader>t :tabe <C-R>=substitute(expand('%:p:h').'/', getcwd().'/', '', '')<CR>
  nnoremap <leader>rm :Rm <C-R>=expand('%:p:h').'/'<CR>
  nnoremap <leader>mk :Mkdir <C-R>=expand('%:p:h').'/'<CR>
  " Replace all of current word
  nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<left><left>
  " Reload vimrc file
  nnoremap <leader>rl :source ~/.vim/vimrc<CR>
  " Search with grep
  nnoremap <leader>/ :LeaderfRgInteractive<Cr>
  nnoremap <leader>* :Rg <c-r>=expand("<cword>")<cr> **<cr>
  " generate doc
  nnoremap <silent> <leader>d :<C-u>call <SID>GenDoc()<CR>
  " clean some dirty charactors
  nnoremap <silent> <leader>cl :<C-u>call <SID>Clean()<CR>
  " show vim highlight group under cursor
  nnoremap <leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
  nnoremap <silent> <leader>pp :set paste<cr>"+P:set paste!<cr>
  nnoremap <silent> <leader>o :call <SID>Open()<CR>
" }}

" setting switch {{
  nnoremap <leader>sc :setl spell!<CR>
  nnoremap <leader>pt :set paste!<CR>
  nnoremap <leader>nu :call <SID>NumberToggle()<CR>
  nnoremap <leader>bg :call <SID>ToggleBackground()<CR>
" }}

function! s:NumberToggle()
  if(&number == 1) | set nu! | set rnu! | else | set rnu | set nu | endif
endfunction

function! s:SessionReload()
  execute 'wa'
  execute 'RestartVim'
endfunction

" Simple clean utility
function! s:Clean()"{{
  let view = winsaveview()
  let ft = &filetype
  " replace tab with 2 space
  if index(['javascript', 'html', 'css', 'vim', 'php'], ft) != -1
    silent! execute "%s/\<tab>/  /g"
  endif
  " replace tailing comma
  if ft ==# 'javascript' || ft ==# 'typescript'
    silent! execute '%s/;$//'
  endif
  " remove tailing white space
  silent! execute '%s/\s\+$//'
  " remove windows `\r`
  call winrestview(view)
endfunction"}}

function! s:GenDoc()"{{
  if &ft ==# 'javascript' || &ft ==# 'typescript'
    exe "JsDoc"
  elseif &ft ==# 'css'
    let lines = ['/*', ' * ', ' */']
    exe "normal! j?{$\<CR>:noh\<CR>"
    let lnum = getpos('.')[1]
    call append(lnum - 1, lines)
    exe "normal! kk$"
    startinsert!
  elseif &ft ==# 'html'
    let lnum = getpos('.')[1]
    let ind = matchstr(getline('.'), '\v\s*')
    call append(lnum - 1, ind . '<!--  -->')
    exe "normal! k^Ell"
    startinsert
  elseif &filetype ==# 'vim'
    let lnum = getpos('.')[1]
    let ind = matchstr(getline('.'), '\v\s*')
    call append(lnum - 1, ind . '" ')
    exe "normal! k$"
    startinsert!
  else
    let lnum = getpos('.')[1]
    let ind = matchstr(getline('.'), '\v\s*')
    call append(lnum - 1, ind. '# ')
    exe "normal! k$"
    startinsert!
  endif
endfunction"}}

function! s:En2zh(mode)
  if !executable("trans")
    echoerr "trans not found"
  else
    let sentence = s:sentence_at_pointer(a:mode)
    let result = system("\\trans -b :zh \"" . sentence . "\"")
    echon result
  endif
endfunction
" }}
