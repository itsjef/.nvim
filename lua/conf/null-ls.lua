local nls = require("null-ls")
local builtins = nls.builtins
local sources = {
  builtins.diagnostics.flake8,
  builtins.formatting.gofmt,
  builtins.formatting.trim_newlines,
  builtins.formatting.trim_whitespace,
}
local on_attach = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

nls.setup({
  sources = sources,
  on_attach = on_attach,
})
