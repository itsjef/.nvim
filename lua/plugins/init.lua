return {
  -- LSPs: diagnostic, auto-formatting, code actions, and more.
  'echasnovski/mini.nvim',
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig'
    },
  },

  -- DAP
  -- { 'mfussenegger/nvim-dap',
  --   dependencies = {
  --     'mfussenegger/nvim-dap-python',
  --     'nvim-telescope/telescope-dap.nvim',
  --     'rcarriga/nvim-dap-ui',
  --     'theHamsta/nvim-dap-virtual-text',
  --   },
  -- },

  -- File explorer, Bufferline, Statusline
  {
    'nvim-tree/nvim-tree.lua',
    keys = {
      { '<leader>nn', '<cmd>NvimTreeToggle<CR>', desc = 'NvimTree' },
    },
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('nvim-tree').setup {
        view = {
          side = 'right',
        },
        renderer = {
          highlight_git = true,
        }
      }
    end
  },
  {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('bufferline').setup()
    end
  },
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true
  },

  -- Git
  'tpope/vim-fugitive',

  -- Autocompletion & snippets
  'mattn/emmet-vim',
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      require('luasnip.loaders.from_vscode').load()
    end
  },

  -- Colorscheme & Syntax Highlighting
  {
    'catppuccin/nvim',
    name = 'catppuccin'
  },
  'ful1e5/onedark.nvim',
  'marko-cerovac/material.nvim',
  {
    'projekt0n/github-nvim-theme',
    version = '*',
  },
  {
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup()
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'v3',
    config = function()
      require('ibl').setup({
        scope = { enabled = false },
      })
    end
  },

  -- Navigation
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
  },
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim'
    },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- Utils & Helpers
  {
    'junegunn/vim-easy-align',
    config = function()
      -- Start interactive EasyAlign in visual mode (e.g. vipga)
      vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', { silent = true })
      -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
      vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', { silent = true })
    end
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = "VeryLazy",
    config = function()
      require('nvim-surround').setup()
    end
  },
  'tpope/vim-commentary',
  {
    'luukvbaal/stabilize.nvim',
    config = function()
      require('stabilize').setup()
    end
  },

  -- AI assistants
  {
    'jcdickinson/codeium.nvim',
    event = 'InsertEnter',
    config = function()
      require('codeium').setup({})
    end
  }
}
