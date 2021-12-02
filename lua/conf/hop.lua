local set_keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
local hop_prefix = '<leader><leader>'

local HopChar1CurrentLineAC ="<cmd>HopChar1CurrentLineAC<cr>"
local HopChar1CurrentLineBC ="<cmd>HopChar1CurrentLineBC<cr>"
local HopWordCurrentLineAC ="<cmd>HopWordCurrentLineAC<cr>"
local HopWordCurrentLineBC ="<cmd>HopWordCurrentLineBC<cr>"
local HopChar1CurrentLineAC_inclusive_jump = "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump = true })<cr>"
local HopChar1CurrentLineBC_inclusive_jump = "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, inclusive_jump = true })<cr>"

-- :map
set_keymap('', hop_prefix..'t', HopChar1CurrentLineAC, opts)
set_keymap('', hop_prefix..'T', HopChar1CurrentLineBC, opts)

-- :nmap
set_keymap('n', hop_prefix..'f', HopChar1CurrentLineAC, opts)
set_keymap('n', hop_prefix..'F', HopChar1CurrentLineBC, opts)
set_keymap('n', hop_prefix..'w', HopWordCurrentLineAC, opts)
set_keymap('n', hop_prefix..'W', HopWordCurrentLineBC, opts)

-- :omap
-- Example:
-- Given text:
-- Dolor quae similique porro facilis
--       ^cursor        ^target
--
-- Type sequence:
-- d<leader><leader>f (pending DELETE operation -> shift to Hop), then hit 'p' letter
--
-- Result:
-- Dolor {cursor}orro facilis
set_keymap('o', hop_prefix..'f', HopChar1CurrentLineAC_inclusive_jump, opts)
set_keymap('o', hop_prefix..'F', HopChar1CurrentLineBC_inclusive_jump, opts)

require('hop').setup{}
