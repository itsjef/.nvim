require('catppuccin').setup({
  custom_highlights = function(colors)
    return {
      WinSeparator = {
        bg = colors.surface0,
      },
    }
  end
})
require('github-theme').setup()
require('material').setup()
require('onedark').setup()

vim.cmd [[colo catppuccin-macchiato]]
