local g = vim.g

g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ':t'
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

require'nvim-tree'.setup {
  view = {
    side = 'right',
  },
  git = {
    ignore = true
  }
}

vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
