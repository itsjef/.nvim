return require'packer'.startup({function()
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}

  -- Linting
  use {'dense-analysis/ale'}
  use {'nathunsmitty/nvim-ale-diagnostic'}

  -- File explorer
  use {'kyazdani42/nvim-tree.lua'}

  -- Git
  use {'tpope/vim-fugitive'}

  -- LSP
  use {'kabouzeid/nvim-lspinstall'}
  use {'neovim/nvim-lspconfig'}

  -- Autocompletion & snippets
  use {'hrsh7th/nvim-compe'}
  use {'hrsh7th/vim-vsnip'}
  use {'hrsh7th/vim-vsnip-integ'}
  use {'mattn/emmet-vim'}
  use {'rafamadriz/friendly-snippets'}

  -- Icons
  use {'kyazdani42/nvim-web-devicons'}

  -- Colorscheme & Syntax Highlighting
  use {'akinsho/nvim-bufferline.lua'}
  -- use 'joshdick/onedark.vim'
  use {'ful1e5/onedark.nvim'}
  use {'hoob3rt/lualine.nvim'}
  use {'kshenoy/vim-signature'}
  use {'luochen1990/rainbow'}
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use {'lukas-reineke/indent-blankline.nvim'}
  use {'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate'}

  -- Navigation
  use {'easymotion/vim-easymotion'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lua/popup.nvim'}
  use {'nvim-telescope/telescope.nvim'}

  -- Utils & Helpers
  use {'jiangmiao/auto-pairs'}
  use {'junegunn/vim-easy-align'}
  use {'machakann/vim-sandwich'}
  use {'tpope/vim-commentary'}
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})
