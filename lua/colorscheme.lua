vim.o.termguicolors = true
vim.cmd('colorscheme ' .. O.colorscheme)

local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

if O.colorscheme == 'rose-pine' then
	set_keymap('n', '<leader>t', [[<cmd>lua require('rose-pine.functions').toggle_variant({'base', 'dawn'})<cr>]], opts)
end
