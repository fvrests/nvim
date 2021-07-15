local keymap = require('utils').keymap
local M = {}

require('toggleterm').setup({
	open_mapping = '<c-j>',
	close_on_exit = true,
})

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
	cmd = 'lazygit',
	direction = 'float',
	hidden = true,
})

M._lazygit_toggle = function()
	if vim.fn.executable('lazygit') == 1 then
		lazygit:toggle()
	end
end

return M
