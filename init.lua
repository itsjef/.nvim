vim.g.python_host_prog = '/home/adrian/.pyenv/versions/pynvim/bin/python'
vim.g.python3_host_prog = '/home/adrian/.pyenv/versions/py3nvim/bin/python'

vim.api.nvim_exec([[
  source /home/adrian/.config/nvim/vimrcs/basic.vim
  source /home/adrian/.config/nvim/vimrcs/plugins.vim
  source /home/adrian/.config/nvim/vimrcs/filetype.vim

  try
    source vimrcs/custom.vim
  catch
  endtry
]], true)

vim.api.nvim_command('colorscheme onedark')
