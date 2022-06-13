-- Bootstrapping, ensure that packer.nvim is installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Automatically run :PackerCompile whenever this file is updated
local plugins_path = fn.stdpath('config')..'/lua/plugins.lua'
vim.cmd('autocmd BufWritePost '..plugins_path..' PackerCompile')

-- Install plugins
require('packer').startup({function()
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}

  -- diagnostic, code actions, and more.
  use({ "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig"
    }
  })

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('conf.nvim-tree')
    end
  }

  -- Git
  use {'tpope/vim-fugitive'}

  -- LSP
  use {'williamboman/nvim-lsp-installer'}
  use {'neovim/nvim-lspconfig'}

  -- Autocompletion & snippets
  use {'mattn/emmet-vim'}
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  use {
    'L3MON4D3/LuaSnip',
    requires = {'rafamadriz/friendly-snippets'},
    config = function()
      require'luasnip.loaders.from_vscode'.load()
    end
  }

  -- Colorscheme & Syntax Highlighting
  use {'catppuccin/nvim', as = 'catppuccin'}
  use {'ful1e5/onedark.nvim'}
  use {'marko-cerovac/material.nvim'}
  use {'projekt0n/github-nvim-theme'}
  use {
    'akinsho/bufferline.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require('bufferline').setup{}
    end
  }
  use {'nvim-lualine/lualine.nvim'}
  use {'kshenoy/vim-signature'}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns').setup{}
    end
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.g.indent_blankline_filetype_exclude = {'help', 'nerdtree', 'defx'}
      vim.g.indent_blankline_use_treesitter = true
      -- vim.g.indent_blankline_show_current_context = true
    end
  }
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'nvim-treesitter/nvim-treesitter-textobjects' }
  use {'p00f/nvim-ts-rainbow'}
  use {'sheerun/vim-polyglot'}
  -- use {'onsails/lspkind-nvim'}

  -- Navigation
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Utils & Helpers
  use {'jiangmiao/auto-pairs'}
  use {
    'junegunn/vim-easy-align',
    config = function()
      -- Start interactive EasyAlign in visual mode (e.g. vipga)
      vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', {silent = true})
      -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
      vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', {silent = true})
    end
  }
  use {'machakann/vim-sandwich'}
  use {'tpope/vim-commentary'}
  use {
    'luukvbaal/stabilize.nvim',
    config = function()
      require('stabilize').setup{}
    end
  }

  -- PlantUML
  use {
    'weirongxu/plantuml-previewer.vim',
    requires = {'tyru/open-browser.vim'},
    ft = {'plantuml'},
    cmd = {'PlantumlOpen', 'PlantumlStart'}
  }

  -- Org Mode
  use {'nvim-orgmode/orgmode'}
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
require('conf.autocomplete')
require('conf.hop')
require('conf.lualine')
require('conf.null-ls')
require('conf.orgmode')
require('conf.telescope')
require('conf.treesitter')
