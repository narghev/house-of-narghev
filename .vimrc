syntax on

set noerrorbells "no error sound effects
set tabstop=4 softtabstop=4 "tab size
set shiftwidth=4 "shift width
set expandtab "convert to space
set smartindent
set nu "line numbers
set nowrap "don't wrap lines
set smartcase "case sensitive searching
set noswapfile "no vim swap files
set nobackup "no backups
set undodir=~/.vim/undodir "the undo dir
set undofile
set incsearch "incremental search

"plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'ayu-theme/ayu-vim'

call plug#end()

"theme
set termguicolors
let ayucolor="dark"
colorscheme ayu

"automatically open nerd tree
autocmd VimEnter * NERDTree | wincmd p

"enable mouse
set mouse=a
