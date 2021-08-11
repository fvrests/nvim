local keymap = require('util').keymap

keymap('n', '<space>', '<nop>')
vim.g.mapleader = ' '

-- clear match highlights
keymap('n', '<esc>', ':noh<cr>')

-- navigate splits
keymap('n', '<c-h>', '<c-w><c-h>')
keymap('n', '<c-j>', '<c-w><c-j>')
keymap('n', '<c-k>', '<c-w><c-k>')
keymap('n', '<c-l>', '<c-w><c-l>')

-- move through wrap lines
keymap('n', 'j', 'gj')
keymap('n', 'k', 'gk')

-- reselect visual after indent
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- search selected text (consistent with `*` behaviour)
keymap('n', '*', [[*N]])
keymap('v', '*', [[y/\V<c-r>=escape(@",'/\')<cr><cr>N]])

-- bubble lines
keymap('n', '-', ':m .+1<cr>==')
keymap('n', '_', ':m .-2<cr>==')
keymap('v', '-', ":m '>+1<cr>gv=gv")
keymap('v', '_', ":m '<-2<cr>gv=gv")

-- escape
keymap('i', 'jk', '<esc>')

-- buffers
keymap('n', 'L', '<cmd>bnext<cr>')
keymap('n', 'H', '<cmd>bprev<cr>')
keymap('n', '<leader>bn', '<cmd>bnext<cr>')
keymap('n', '<leader>bp', '<cmd>bprev<cr>')
keymap('n', '<leader>bd', '<cmd>bdelete<cr>')

--- close other buffers
--- https://stackoverflow.com/a/34050776
keymap('n', '<leader>bo', [[<cmd>%bd|e#|bd#<cr>'"]])

-- add user keymaps
if O.keymaps ~= nil then
	for _, k in pairs(O.keymaps) do
		-- TODO: check that `k` has 3 values
		keymap(k[1], k[2], k[3])
	end
end
