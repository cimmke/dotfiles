".vimrc
" Author: Corey Immke

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tmsvg/pear-tree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set Leader
let mapleader = " "


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme nord

set laststatus=2
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'nord',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
set backspace=indent,eol,start
set showcmd
set visualbell
set wildmenu
set number
set relativenumber
set ruler
set showmatch
set encoding=utf-8
set foldmethod=indent
set foldlevel=99

" Indent based on filetype
filetype indent plugin on

" Use 4 spaces instead of tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load local vimrc files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if getcwd() =~# '^\(/home/corey/Projects\)'
  set secure exrc
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'    " Only lint on save
let g:ale_linters = {
  \ 'python': ['flake8'],
  \ 'javascript': ['eslint'],
  \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_completion_enabled = 1

" NERDTree
" Close window if NERDTree is the last one
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uppercase entry in insert mode
inoremap <c-u> <esc>viwU<esc>ea

" Select all
noremap <silent><leader>a ggVG

" Save
noremap <silent><leader>s <esc>:w<cr>

" Move windows
noremap <silent><leader>w <c-w>

" FZF
noremap <silent><leader>f :Files<cr>
noremap <silent><leader>fh :Files ~<cr>
noremap <silent><leader>fr :Rg<cr>
noremap <silent><leader>b :Buffers<cr>

" NERDTree
noremap <silent><leader>t :NERDTreeToggle<cr>
