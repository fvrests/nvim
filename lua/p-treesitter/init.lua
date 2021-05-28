require('nvim-treesitter.configs').setup({
	ensure_installed = 'all',
	ignore_install = { 'haskell' },
	highlight = { enable = true },
	indent = { enable = true },
})

local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

set_keymap('n', '<leader>g', ':TSHighlightCapturesUnderCursor<cr>', opts)
