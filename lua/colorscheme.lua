vim.o.termguicolors = true
vim.cmd('colorscheme ' .. O.colorscheme)

local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

set_keymap('n', '<c-m>', [[<cmd>lua require('rose-pine.functions').toggle_variant({'base', 'dawn'})<cr>]], opts)
