-- Bootstrapping, ensure that packer.nvim is installed
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/lazy/lazy.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    install_path,
  })
end
vim.opt.rtp:prepend(install_path)

-- Install plugins
local opts = {}
require('lazy').setup('plugins', opts)

-- Load configs
-- LSPs
require('conf.lsp')

-- DAP
-- require('conf.dap')

-- Other conf
require('conf.autocomplete')
require('conf.hop')
require('conf.mini')
require('conf.telescope')
