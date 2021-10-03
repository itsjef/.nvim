local g = vim.g

g.nvim_tree_ignore = {'.git', 'node_modules', '.cache', '__pycache__'}
g.nvim_tree_gitignore = 1
g.nvim_tree_indent_markers = 1
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
  }
}

vim.api.nvim_set_keymap('n', '<leader>nn', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
