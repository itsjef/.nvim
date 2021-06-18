vim.g.mapleader = ','

-- Buffer navigation & manipulation
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bd', ':bp|bd#<CR>', {noremap = true, silent = true})

-- Quickly open/reload nvimrc
-- vim.api.nvim_set_keymap('n', '<leader>sv', ':luafile ' .. G.path.init .. '<cr>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<leader>ev', ':e ' .. G.path.init .. '<cr>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<leader>eb', ':e ' .. G.path.basic .. '<cr>', {noremap = true, silent = true})

-- Quick shortcut for splittling
vim.api.nvim_set_keymap('n', '<C-W>-', ':split<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-W>\\', ':vsplit<CR>', {noremap = true, silent = true})

-- Break undo sequence to smaller chunks
vim.api.nvim_set_keymap('i', '.', '.<C-g>u', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '?', '?<C-g>u', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '!', '!<C-g>u', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', ',', ',<C-g>u', {noremap = true, silent = true})

-- Moving between windows
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', {noremap = true, silent = true})

-- Clear highlighted search result
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<CR><ESC>', {noremap = true, silent = true})
