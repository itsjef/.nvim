local nls = require("null-ls")
local builtins = nls.builtins
local sources = {
  builtins.diagnostics.flake8,
  builtins.formatting.gofmt,
  builtins.formatting.trim_newlines,
  builtins.formatting.trim_whitespace,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        vim.lsp.buf.formatting_sync()
      end,
    })
  end
end
-- local on_attach = function(client)
--   if client.resolved_capabilities.document_formatting then
--     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
--   end
-- end

nls.setup({
  sources = sources,
  on_attach = on_attach,
})
