set background=dark
set number
set relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smarttab
set nohlsearch
set hidden
set noerrorbells
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set mouse=a

call plug#begin()

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'https://github.com/ap/vim-css-color'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }

Plug 'ayu-theme/ayu-vim'

Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

set termguicolors
let ayucolor="dark"
colorscheme ayu
let g:airline_theme='ayu_dark'

let mapleader = " "
nnoremap <leader>b :NvimTreeFocus<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
  require'nvim-treesitter.configs'.setup{
	  highlight = {
	    enable = true,
	  },
	}
  require'nvim-tree'.setup {
    view = { side = 'left' },
    filters = { custom = { "^.git$" } }
  }
  require('telescope').setup{
    pickers = {
        find_files = {
          theme = "dropdown",
        },
        live_grep = {
          theme = "dropdown",
        }
    }
  }
EOF
