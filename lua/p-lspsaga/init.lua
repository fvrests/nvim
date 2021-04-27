require'lspsaga'.init_lsp_saga()

local set_keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- lsp provider to find the cursor word definition and reference
set_keymap('n', 'gh', ':Lspsaga lsp_finder<cr>', opts)
-- code action
set_keymap('n', '<leader>ca', ':Lspsaga code_action<cr>', opts)
set_keymap('v', '<leader>ca', ':Lspsaga range_code_action<cr>', opts)
-- show hover doc
set_keymap('n', 'K', ':Lspsaga hover_doc<cr>', opts)
-- show diagnostics
set_keymap('n', 'H', ':Lspsaga show_line_diagnostics<cr>', opts)
-- show signature help
set_keymap('n', 'gs', ':Lspsaga signature_help<cr>', opts)
-- rename
set_keymap('n', 'gr', ':Lspsaga rename<cr>', opts)
-- preview definition
set_keymap('n', 'gd', ':Lspsaga preview_definition<cr>', opts)

