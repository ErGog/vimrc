inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" vim9script
def g:ExpandSnippetOrReturn(): string
  var snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<C-Y>" # select without newline in popup
  endif
enddef

inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrReturn()<CR>" : "\<CR>"

imap <c-space> <Plug>(asyncomplete_force_refresh)
" For Vim 8 (<c-@> corresponds to <c-space>):
" imap <c-@> <Plug>(asyncomplete_force_refresh)

" Opens preview windows as floating
let g:lsp_preview_float = 1
let g:lsp_use_native_client = 1
let g:lsp_preview_keep_focus = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
" performence
let g:lsp_use_lua = has('nvim-0.4.0') || (has('lua') && has('patch-8.2.0775'))

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 1

if has('python3')
    let g:UltiSnipsExpandTrigger="<c-e>"
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'allowlist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
endif
