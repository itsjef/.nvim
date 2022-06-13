require'nvim-tree'.setup {
  view = {
    side = 'right',
  },
  renderer = {
    highlight_git = true,
  }
}

vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
