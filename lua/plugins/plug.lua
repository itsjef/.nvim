vim.api.nvim_exec(
[[
call plug#begin($HOME.'/.config/nvim/bundle')

" Linting
Plug 'dense-analysis/ale'
Plug 'nathunsmitty/nvim-ale-diagnostic'

" File explorer
Plug 'kyazdani42/nvim-tree.lua'

" LSP
Plug 'kabouzeid/nvim-lspinstall'
Plug 'neovim/nvim-lspconfig'

" Autocompletion & snippets
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'mattn/emmet-vim'
Plug 'rafamadriz/friendly-snippets'

" Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Colorscheme & Syntax Highlighting
Plug 'akinsho/nvim-bufferline.lua'
" Plug 'joshdick/onedark.vim'
Plug 'ful1e5/onedark.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kshenoy/vim-signature'
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
Plug 'luochen1990/rainbow'
Plug 'mhinz/vim-signify'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sheerun/vim-polyglot'

" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Utils & Helpers
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'

call plug#end()
]],
false)
