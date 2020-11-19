set nocompatible
syntax on
filetype plugin on
set number
set relativenumber
set shiftwidth=4
set tabstop=4
set expandtab
set smartindent
set wrapscan
set ignorecase

" Spelling and language
"set spell
"set spelllang=nb,en_us

let mapleader = " "

filetype plugin on

set nolist
set listchars=nbsp:‰

" vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'lervag/vimtex'
Plugin 'vimwiki/vimwiki'
Plugin 'sirver/ultisnips'
Plugin 'ycm-core/youcompleteme'

call vundle#end()
filetype plugin indent on

" Live-Preview-conf
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-lualatex',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
    endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" VimWiki
let g:vimwiki_list = [{'path': '~/Documents', 'syntax': 'markdown'}]

" ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardsTrigger = '<s-tab>'

"{{{ keybinding
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"}}}
