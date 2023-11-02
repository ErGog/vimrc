""" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0 nofen:

" python {{
  let g:pymode_python = 'python'
" }}

" startify {{
  let g:startify_change_to_dir = 0
" }}"

" vim-go {{
  let g:go_def_mapping_enabled = 0
  let g:go_doc_keywordprg_enabled = 0
  let g:go_fmt_autosave = 1
  let g:go_imports_autosave = 0
" }}"

" vim-markdown {{
  let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'typescript', 'rust']
" }}"

" vim-run {{
  let g:vim_run_command_map = {
        \'typescript': 'ts-node',
        \'javascript': 'node',
        \'python': 'python3',
        \'go': 'go run',
        \'swift': 'swift'
        \}
" }}

" echodoc {{
  let g:echodoc_enable_at_startup = 1
" }}

" plug.nvim {{
  let g:plug_rebase = 1
" }}

" vim-highlightedyank {{
  let g:highlightedyank_highlight_duration = 100
" }}

" numdo.vim {{
  let g:mundo_prefer_python3 = 1
" }}

" vim-jsx-improve {{
  let javascript_plugin_jsdoc = 1
  let javascript_plugin_flow = 1
" }}

" xml.vim {{
  let g:xml_syntax_folding = 1
" }}

" Netrw {{
  let g:netrw_chgwin = 2
  "let g:netrw_banner=0
  let g:netrw_list_hide = ',\(^\|\s\s\)\zs\.\S\+'
  let g:netrw_winsize=20
  "let g:netrw_liststyle=3
  "let g:netrw_localrmdir='rmtrash'
  "let g:netrw_bufsettings = "noma nomod nonu nobl nowrap ro nornu buftype=nofile"
" }}

" vim-gitgutter {{
  let g:gitgutter_max_signs = 999
" }}

" vim-cool {{
  let g:CoolTotalMatches = 1
" }}"

" coc.nvim {{
  if has('nvim') && !has('nvim-0.4.3')
    let g:coc_disable_startup_warning = 1
  endif
  "let g:coc_channel_timeout = 5
  "let g:coc_data_home = '~/.config/a/b/coc'
  "let g:coc_disable_startup_warning = 1
  "let g:coc_quickfix_open_command = 'copen|cfirst'
  "let g:node_client_debug = 1
  let g:coc_config_home = '~/.vim/config/'
  let $NVIM_COC_LOG_LEVEL = 'debug'
  let g:coc_global_extensions = [
        \ 'coc-word@1.2.0',
        \ 'coc-lists',
        \ 'coc-git',
        \ 'coc-sh',
        \ 'coc-marketplace',
        \ 'coc-vimlsp',
        \ 'coc-json',
        \ 'coc-tsserver',
        \ 'coc-copilot',
        \ 'coc-rust-analyzer',
        \ 'coc-snippets',
        \ 'coc-pairs'
        \ ]
  let g:coc_watch_extensions = []
  "let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
  "let g:coc_node_path = '/usr/local/bin/node'
  let g:coc_filetype_map = {
        \ 'html.swig': 'html',
        \ 'wxss': 'css',
        \ }
  "call coc#add_command('mundoToggle', 'MundoToggle', 'toggle mundo window')
  "call coc#add_command('tree', 'Vexplore', 'open netrw explorer')
  "call coc#add_command('translate', 'TranslateW', 'translate word')
" }}"

" indentLine {{
  let g:indentLine_fileTypeExclude = ['json', 'markdown']
  let g:indentLine_bufTypeExclude = ['help', 'terminal', 'nofile']
  let g:indentLine_char = '│'
" }}"

" vim-lion {{
  let g:lion_squeeze_spaces = 1
  let g:lion_create_maps = 1
" }}"

" rename.nvim {{
  let g:rename_hl_guifg = '#ffffff'
  let g:rename_hl_guibg = '#b180a4'
  let g:rename_search_execute = 'rg'
" autosave
  let g:auto_save = 1
" }}"

" codesearch {{
"  let g:codesearch_source_root = '~/Documents/work/dmpp/chromium/src'
" }}

" vimspector {{
  let g:vimspector_enable_mappings = 'HUMAN'
" }}

" vim-gutentags {{
  " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
  let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

  " 所生成的数据文件的名称
  "let g:gutentags_ctags_tagfile = '.tags'

  " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
  let s:vim_tags = expand('~/.cache/tags')
  let g:gutentags_cache_dir = s:vim_tags

  " 配置 ctags 的参数
  "let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
  "let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
  "let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

  " 检测 ~/.cache/tags 不存在就新建
  if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
  endif
" }}
"
"ultisnips{{
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsEditSplit='vertical'
"}}

"rainbow{{
let g:rainbow_active = 1
let g:rainbow_load_separately = [
                        \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
                        \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
                        \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
                        \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
                        \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
"}}
"

"Ag{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"}}
"
"vim-autoformat{{
nnoremap <C-f> :Autoformat<CR>
let g:autoformat_verbosemode=1
autocmd FileType proto au BufWrite * :Autoformat
"autocmd FileType cpp au BufWrite * :Autoformat
"}}
