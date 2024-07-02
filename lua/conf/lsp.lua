local border = 'rounded'
vim.diagnostic.config({ float = { border = border } })

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
-- replaced with mini.bracketed
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

local on_attach = function(_, bufnr)
  --Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders)) end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<leader>=', vim.lsp.buf.formatting, bufopts)
end

local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local handle_lsp_border = {
  ["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, { border = border }
  ),
  ["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, { border = border }
  ),
}

local default_handler = function(server_name)
  lspconfig[server_name].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handle_lsp_border,
  }
end

local handlers = {
  default_handler,

  ['basedpyright'] = function()
    lspconfig['basedpyright'].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handle_lsp_border,
      settings = {
        basedpyright = {
          disableOrganizeImports = true,
          typeCheckingMode = 'strict',
          -- analysis = {
          --   ignore = { '*' }, -- Ignore all files for analysis to exclusively use Ruff for linting
          -- },
        },
      },
    }
  end,

  ['ruff_lsp'] = function()
    lspconfig['ruff_lsp'].setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.hoverProvider = false
        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
      handlers = handle_lsp_border,
    }
  end,

  ['docker_ls'] = nil,
  ['lua_ls'] = nil,
}

local ensure_installed = {}
for server, _ in ipairs(handlers) do
  if type(server) == "string" then
    table.insert(ensure_installed, server)
  end
end

mason.setup()
mason_lspconfig.setup({
  ensure_installed = ensure_installed,
  handlers = handlers
})
