vim.o.clipboard = 'unnamedplus' -- copy & paste from system clipboard
vim.o.hidden = true -- hide abandoned buffer
vim.o.inccommand = 'nosplit' -- Live substitution
vim.o.mouse = 'a' -- enable mouse
vim.o.scrolloff = 999 -- Set lines to the cursor when moving around with j/k keys
vim.wo.cursorline = true -- Display the line you are in
vim.wo.number = true -- show line numbers
vim.wo.relativenumber = true -- shoe line numbers relatively

-- Indentation
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.expandtab = true

-- Line mark
vim.wo.list = true
vim.wo.listchars = 'eol:↲'

-- When searching try to be smart about cases
vim.o.ignorecase = true
vim.o.smartcase = true

-- 'Natural' splitting
vim.o.splitbelow = true
vim.o.splitright = true

-- Persistent undo - You can undo even after closing a buffer or Vim itself
vim.api.nvim_exec([[
  try
    set udir=$HOME/.config/nvim/temp_dir/undo
    set undofile
  catch
  endtry
]], false)
