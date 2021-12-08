local opts =  {noremap = true, silent = true}

-- Map leader key
vim.g.mapleader = ','

-- Buffer navigation & manipulation
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>bd', ':bp|bd#<CR>', opts)

-- Quickly open/reload nvimrc
-- vim.api.nvim_set_keymap('n', '<leader>sv', ':luafile ' .. G.path.init .. '<cr>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>ev', ':e ' .. G.path.init .. '<cr>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>eb', ':e ' .. G.path.basic .. '<cr>', opts)

-- Quick shortcut for splittling
vim.api.nvim_set_keymap('n', '<C-W>-', ':split<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-W>\\', ':vsplit<CR>', opts)

-- Break undo sequence to smaller chunks
vim.api.nvim_set_keymap('i', '.', '.<C-g>u', opts)
vim.api.nvim_set_keymap('i', '?', '?<C-g>u', opts)
vim.api.nvim_set_keymap('i', '!', '!<C-g>u', opts)
vim.api.nvim_set_keymap('i', ',', ',<C-g>u', opts)

-- Moving between windows
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', opts)

-- Clear highlighted search result
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<CR><ESC>', opts)
