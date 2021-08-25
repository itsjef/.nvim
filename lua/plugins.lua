-- Bootstrapping, ensure that packer.nvim is installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Install plugins
require('packer').startup({function()
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
  use {'mattn/emmet-vim'}
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  use {
    'L3MON4D3/LuaSnip',
    requires = {'rafamadriz/friendly-snippets'}
  }

  -- Icons
  use {'kyazdani42/nvim-web-devicons'}

  -- Colorscheme & Syntax Highlighting
  use {
    'akinsho/nvim-bufferline.lua',
    config = function()
      require('bufferline').setup()
    end
  }
  use {'monsonjeremy/onedark.nvim'}
  use {'hoob3rt/lualine.nvim'}
  use {'kshenoy/vim-signature'}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns').setup()
    end
  }
  use {'lukas-reineke/indent-blankline.nvim'}
  use {'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate'}
  use {'nvim-treesitter/nvim-treesitter-textobjects', branch = '0.5-compat'}
  use {'onsails/lspkind-nvim'}

  -- Navigation
  use {'easymotion/vim-easymotion'}
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

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

-- LSPs
require('conf.lsp')

-- Other conf
require('conf.ale')
require('conf.autocomplete')
require('conf.easyalign')
require('conf.indent-blankline')
require('conf.lualine')
require('conf.nvim-tree')
require('conf.telescope')
require('conf.treesitter')
