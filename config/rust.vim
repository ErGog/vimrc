if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'priority': 2,
        \   'whitelist': ['rust'],
        \   'initialization_options': {
        \     'cargo': {
        \       'buildScripts': {
        \         'enable': v:true,
        \       },
        \     },
        \     'rust-analyzer.cargo.runBuildScriptsCommand': [
        \       'cargo',
        \       'check',
        \       '--quiet',
        \       '--message-format=json'
        \     ],
        \     'procMacro': {
        \       'enable': v:true,
        \     },
        \     'rust-analyzer.disable-cargo-workspace-and-only-use-its-glob-result-as-linkedProjects-input':'true',
        \     'checkOnSave': {
        \       'command': 'clippy',
        \     },
        \   },
        \ })
endif


" \     'workspace.ignoredFolders': [
" \       '.git',
" \       'target',
" \       '$HOME/.rustup/**',
" \       '$HOME/.cargo/**',
" \       '$HOME'
" \     ],
" " Check filetype.
" autocmd VimEnter * call CheckCargoToml()

" function! CheckCargoToml()
"   let l:cargo_toml = expand('Cargo.toml')
"   if filereadable(l:cargo_toml)
"     setfiletype rust
"   endif
" endfunction
