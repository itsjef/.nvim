-- ALE options
vim.g.ale_disable_lsp = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_text_changed = 0
vim.g.ale_maximum_file_size = 500000 -- Don't lint large files (> 500KB), it can slow things down

-- ALE fixers
local ale_fixers = {
  ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
  python = {'black', 'isort'}
}
vim.g.ale_fixers = ale_fixers
