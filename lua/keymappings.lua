local opts =  {noremap = true, silent = true}

-- Map leader key
vim.g.mapleader = ','

-- Buffer navigation & manipulation
vim.keymap.set('n', '<TAB>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>bd', ':bp|bd#<CR>', opts)

-- Quickly open/reload nvimrc
-- vim.keymap.set('n', '<leader>sv', ':luafile ' .. G.path.init .. '<cr>', opts)
-- vim.keymap.set('n', '<leader>ev', ':e ' .. G.path.init .. '<cr>', opts)
-- vim.keymap.set('n', '<leader>eb', ':e ' .. G.path.basic .. '<cr>', opts)

-- Quick shortcut for splittling
vim.keymap.set('n', '<C-W>-', ':split<CR>', opts)
vim.keymap.set('n', '<C-W>\\', ':vsplit<CR>', opts)

-- Break undo sequence to smaller chunks
vim.keymap.set('i', '.', '.<C-g>u', opts)
vim.keymap.set('i', '?', '?<C-g>u', opts)
vim.keymap.set('i', '!', '!<C-g>u', opts)
vim.keymap.set('i', ',', ',<C-g>u', opts)

-- Moving between windows
vim.keymap.set('n', '<A-h>', '<C-w>h', opts)
vim.keymap.set('n', '<A-j>', '<C-w>j', opts)
vim.keymap.set('n', '<A-k>', '<C-w>k', opts)
vim.keymap.set('n', '<A-l>', '<C-w>l', opts)

-- Clear highlighted search result
vim.keymap.set('n', '<ESC>', ':noh<CR><ESC>', opts)
