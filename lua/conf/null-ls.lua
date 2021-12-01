local nls = require("null-ls")
local builtins = nls.builtins
local sources = {
  builtins.diagnostics.flake8,
  builtins.formatting.trim_newlines,
  builtins.formatting.trim_whitespace,
}

nls.config({ sources = sources })

local lspconfig = require("lspconfig")
lspconfig["null-ls"].setup({})
