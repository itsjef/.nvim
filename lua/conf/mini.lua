local api = vim.api

require('mini.ai').setup()
require('mini.bracketed').setup()
require('mini.bufremove').setup()
require('mini.comment').setup()
require('mini.completion').setup()
require('mini.trailspace').setup()

local formatAugroup = api.nvim_create_augroup("FormatAutogroup", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  group = formatAugroup,
  callback = function()
    MiniTrailspace.trim()
    MiniTrailspace.trim_last_lines()
  end,
})
