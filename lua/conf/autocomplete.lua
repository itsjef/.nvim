vim.o.completeopt = 'menuone,noselect'

-- nvim-cmp setup
local fn = vim.fn
local luasnip = require 'luasnip'
local cmp = require 'cmp'
local lspkind = require 'lspkind'

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_backspace = function()
  local col = fn.col('.') - 1
  return col == 0 or fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local function tab(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
  elseif check_backspace() then
    fn.feedkeys(t('<Tab>'), 'n')
  else
    fallback()
  end
end

local function shift_tab(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
  else
    fallback()
  end
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      symbol_map = { Codeium = "", },

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      -- before = function (entry, vim_item)
      --   ...
      --   return vim_item
      -- end
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-j>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(tab, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(shift_tab, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'path' },
  }, {
    { name = 'codeium' },
    { name = 'buffer' },
  }),
}
