local keymap = require('util').keymap

-- Any <leader> keymaps can be found in /lua/modules/which-key.lua
keymap('n', '<space>', '<nop>')
vim.g.mapleader = ' '

-- Clear match highlights
keymap('n', '<esc>', ':noh<cr>')

-- Navigate splits
keymap('n', '<c-h>', '<c-w><c-h>')
keymap('n', '<c-j>', '<c-w><c-j>')
keymap('n', '<c-k>', '<c-w><c-k>')
keymap('n', '<c-l>', '<c-w><c-l>')

-- Move through wrap lines
keymap('n', 'j', 'gj')
keymap('n', 'k', 'gk')

-- Reselect visual after indent
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Search selected text (consistent with `*` behaviour)
keymap('n', '*', [[*N]])
keymap('v', '*', [[y/\V<c-r>=escape(@",'/\')<cr><cr>N]])

-- Bubble lines
keymap('n', '-', ':m .+1<cr>==')
keymap('n', '_', ':m .-2<cr>==')
keymap('v', '-', ":m '>+1<cr>gv=gv")
keymap('v', '_', ":m '<-2<cr>gv=gv")

-- Escape
keymap('i', 'jk', '<esc>')

-- Leader shortcuts
-- These should be shorter versions of their which-key equivalent
keymap('n', 'L', '<cmd>BufferNext<cr>')
keymap('n', 'H', '<cmd>BufferPrevious<cr>')
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
keymap('n', 'gl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>')

-- Add user keymaps
if O.keymaps ~= nil then
	for _, k in pairs(O.keymaps) do
		-- TODO: check that `k` has 3 values
		keymap(k[1], k[2], k[3])
	end
end
