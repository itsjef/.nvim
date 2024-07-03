return {
  'echasnovski/mini.nvim',
  config = function()
    local api = vim.api

    require('mini.ai').setup()
    require('mini.bracketed').setup({
      buffer     = { suffix = 'b', options = {} },
      comment    = { suffix = 'c', options = {} },
      conflict   = { suffix = 'x', options = {} },
      -- diagnostic = { suffix = 'd', options = {} },  -- default in Neovim 0.10
      file       = { suffix = 'f', options = {} },
      indent     = { suffix = 'i', options = {} },
      jump       = { suffix = 'j', options = {} },
      location   = { suffix = 'l', options = {} },
      oldfile    = { suffix = 'o', options = {} },
      quickfix   = { suffix = 'q', options = {} },
      treesitter = { suffix = 't', options = {} },
      undo       = { suffix = 'u', options = {} },
      window     = { suffix = 'w', options = {} },
      yank       = { suffix = 'y', options = {} },
    })
    require('mini.bufremove').setup()
    require('mini.comment').setup()
    require('mini.trailspace').setup()

    local formatAugroup = api.nvim_create_augroup("FormatAutogroup", { clear = true })
    api.nvim_create_autocmd("BufWritePre", {
      group = formatAugroup,
      callback = function()
        MiniTrailspace.trim()
        MiniTrailspace.trim_last_lines()
      end,
    })
  end,
}
