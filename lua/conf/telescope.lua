function nnoremap(key, command)
  vim.keymap.set('n', key, command, {noremap = true, silent = true})
end

nnoremap('<C-p>', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>/', '<cmd>Telescope live_grep<cr>')
nnoremap('<leader>*', '<cmd>Telescope grep_string<cr>')
nnoremap('<leader>tT', '<cmd>Telescope tags<cr>')
nnoremap('<leader>tb', '<cmd>Telescope buffers<cr>')
nnoremap('<leader>th', '<cmd>Telescope help_tags<cr>')
nnoremap('<leader>tr', '<cmd>Telescope resume<cr>')
nnoremap('<leader>tt', '<cmd>Telescope current_buffer_tags<cr>')
nnoremap('<leader>tf', '<cmd>Telescope oldfiles<cr>')

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
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')
