local dap = require('dap')
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<F5>', dap.continue, opts)
vim.keymap.set('n', '<F10>', dap.step_over, opts)
vim.keymap.set('n', '<F11>', dap.step_into, opts)
vim.keymap.set('n', '<F12>', dap.step_out, opts)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, opts)
vim.keymap.set('n', '<leader>dB', function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, opts)
vim.keymap.set('n', '<leader>dlp', function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, opts)
vim.keymap.set('n', '<leader>dr', dap.repl.open, opts)
vim.keymap.set('n', '<leader>dl', dap.run_last, opts)

-- Telescope DAP
local telescope = require('telescope')
telescope.load_extension('dap')

vim.keymap.set('n', '<leader>dcc', '<cmd>Telescope dap commands<cr>', opts)
vim.keymap.set('n', '<leader>dco', '<cmd>Telescope dap configurations<cr>', opts)
vim.keymap.set('n', '<leader>dlb', '<cmd>Telescope dap list_breakpoints<cr>', opts)
vim.keymap.set('n', '<leader>dv', '<cmd>Telescope dap variables<cr>', opts)
vim.keymap.set('n', '<leader>df', '<cmd>Telescope dap frames<cr>', opts)

-- DAP UI
local dapui = require('dapui')
dapui.setup()
vim.keymap.set('v', '<M-k>', dapui.eval, opts)

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

-- Other extensions
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('nvim-dap-virtual-text').setup()
