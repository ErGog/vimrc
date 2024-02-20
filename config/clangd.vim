if executable('clangd')
  au User lsp_setup call lsp#register_server({
        \   'name': 'C/CXX Language Server',
        \   'cmd': {server_info->['clangd']},
        \   'whitelist': ['c','cxx'],
        \ })
endif
