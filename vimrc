call plug#begin('~/.vim/.plugged')
"themes	
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'frazrepo/vim-rainbow'
"chinese doc support
Plug 'yianwillis/vimcdoc'
"vim languages icons
Plug 'ryanoasis/vim-devicons'
"A stupid comment plugin made for people can't remember so many mappings:)
Plug 'neoclide/mycomment.vim'
"Run a custom command in vim with current buffer and see the result side-by-side
Plug 'chemzqm/vim-run'
"Git Plugin's
Plug 'tpope/vim-fugitive' " Git plugin
Plug 'tpope/vim-rhubarb' " Hub plugin
Plug 'lambdalisue/gina.vim' " It's a plugin to asynchronously control git repositories.
Plug 'whiteinge/diffconflicts' " A better Vimdiff mergetool
"Map . command
Plug 'tpope/vim-repeat'
"Key maps
Plug 'tpope/vim-surround' " 范围选择
Plug 'tommcdo/vim-exchange' " Easy text exchange operator for Vim.
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
"Go languages support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Lion.vim is a tool for aligning text by some character.
Plug 'tommcdo/vim-lion'
"Code intent line
Plug 'Yggdroot/indentLine'
"A simple plugin to toggle zoom of current window within the current tab.
Plug 'dhruvasagar/vim-zoom'
"Vim-cool disables search highlighting when you are done searching and
"re-enables it when you search again.
Plug 'romainl/vim-cool' " search improve
"A plugin for plugin developers to get the version of Vim and
"Neovim that introduced or removed features.
Plug 'tweekmonster/helpful.vim'
"switching between a single-line statement and a multi-line one.
Plug 'AndrewRadev/splitjoin.vim'
"View undo history
Plug 'mbbill/undotree'
"automatically save changes
Plug '907th/vim-auto-save'
"vim debug plugin
Plug 'puremourning/vimspector'
"vim search plugin
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
"Code call tree plugin
Plug 'hari-rangarajan/CCTree'
"Code tags viewer
Plug 'preservim/tagbar'
"Code lsp tags viewer
Plug 'liuchengxu/vista.vim'
"Code gnu tag system plugin
Plug 'vim-scripts/gtags.vim'
"lsp pluin manager
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"fast mark and go to
Plug 'kshenoy/vim-signature'
"ultisnips
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
"comment
Plug 'tpope/vim-commentary'
"im switch
Plug 'brglng/vim-im-select'
call plug#end()

filetype plugin on
syntax on

for s:path in split(glob('~/.vim/config/*.vim'),"\n")
	exe 'source ' . s:path
endfor
