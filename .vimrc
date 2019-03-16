filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'elixir-editors/vim-elixir'
Plugin 'https://gitlab.com/code-stats/code-stats-vim.git'
Plugin 'slashmili/alchemist.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'jacoborus/tender.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'sodapopcan/vim-twiggy'
Plugin 'elmcast/elm-vim'
Plugin 'sjl/badwolf'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-rails'
Plugin 'dikiaap/minimalist'
Plugin 'szorfein/darkest-space'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'wavded/vim-stylus'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-airline/vim-ariline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

call vundle#end()

set laststatus=2

set noshowmode
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set mouse=a
set cm=blowfish2

if !has('gui_running')
  set t_Co=256
endif

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme tender

let g:airline_theme='simple'
let g:airline_powerline_fonts = 1
let g:ariline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:prettier#exec_cmd_async = 1
let g:prettier#config#single_quote = 'true'
autocmd BufWritePost * Prettier

let g:lightline = {
      \ 'colorscheme': 'tender',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'codestats' ] ]
      \ },
      \ 'component_function': {
      \   'codestats': 'CodeStatsXp'
      \ },
      \ }

filetype plugin indent on    " requiredet enc=utf8
filetype plugin on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml,eelixr,htmleex setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
au FileType css setl ofu=csscomplete#CompleteCSS
