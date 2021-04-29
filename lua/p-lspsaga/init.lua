require'lspsaga'.init_lsp_saga()

local set_keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- hover doc
set_keymap('n', 'K', [[<cmd>lua require'lspsaga.hover'.render_hover_doc()<cr>]], opts)
-- diagnostics
set_keymap('n', 'H', [[<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<cr>]], opts)
-- definition / reference
set_keymap('n', 'gh', [[<cmd>lua require'lspsaga.provider'.lsp_finder()<cr>]], opts)
-- signature help
set_keymap('n', 'gs', [[<cmd>lua require'lspsaga.signaturehelp'.signature_help()<cr>]], opts)
-- rename
set_keymap('n', 'gr', [[<cmd>lua require'lspsaga.rename'.rename()<cr>]], opts)
-- preview definition
set_keymap('n', 'gd', [[<cmd>lua require'lspsaga.provider'.preview_definition()<cr>]], opts)
-- code action
set_keymap('n', '<leader>ca', [[<cmd>lua require'lspsaga.codeaction'.code_action()<cr>]], opts)
set_keymap('v', '<leader>ca', [[<cmd>lua require'lspsaga.codeaction'.range_code_action()<cr>]], opts)
