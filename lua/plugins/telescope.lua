vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>/', '<cmd>Telescope live_grep<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>*', '<cmd>Telescope grep_string<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true, silent = true})

local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          ["<esc>"] = actions.close,
          ["<CR>"] = actions.select_default + actions.center
      },
      n = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      }
    }
  }
}
