set nocompatible
syntax on
set number
set linebreak
set showbreak=+++
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set undolevels=100
set laststatus=2
set noshowmode
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'itchyny/lightline.vim'
Plug 'itchyny/landscape.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
" Initialize plugin system
call plug#end()
" Important!!
if has('termguicolors')
	set termguicolors
endif
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai
