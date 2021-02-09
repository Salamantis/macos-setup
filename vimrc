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
set cursorline 
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'itchyny/lightline.vim'
Plug 'itchyny/landscape.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'frazrepo/vim-rainbow'
Plug 'arcticicestudio/nord-vim'
" Initialize plugin system
call plug#end()
" The configuration options should be placed before `colorscheme sonokai`.
let g:rainbow_active = 1 
let g:enable_bold_font = 1
let g:enable_italic_font = 1
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
set background=dark
colorscheme nord
