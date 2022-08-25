" Settings
set nocompatible
set t_Co=256
set number

"" Indentation
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smartindent
filetype plugin indent on

"" Colorscheme
colorscheme industry
highlight Visual cterm=reverse ctermbg=NONE
hi MatchParen cterm=bold ctermbg=none ctermfg=red

set wrapscan
set ignorecase
set textwidth=80

set wildmenu
set wildmode=longest:full,full

syntax on
filetype plugin on

"{{{ Plugins
call plug#begin()
Plug 'williamboman/mason'
Plug 'neovim/nvim-lspconfig'
Plug 'fatih/vim-go'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } " < lazy loaded
call plug#end()
"}}}

" Goloang LSP settings
let g:go_gopls_enabled = 0

" Rust

" Keybinds

"" Set spacebar as leader key
noremap <SPACE> <Nop>
let mapleader = " "

"" Exit insert mode with ii
:inoremap ii <ESC>

""{{{ Arrowkeys are for scrubs
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
""}}}

""{{{ NERDTree

""}}}
