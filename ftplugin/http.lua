local kulala = require('kulala')
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-h>", kulala.toggle_view, opts)
vim.keymap.set("n", "<C-k>", kulala.jump_prev, opts)
vim.keymap.set("n", "<C-j>", kulala.jump_next, opts)
vim.keymap.set("n", "<C-l>", kulala.run, opts)
