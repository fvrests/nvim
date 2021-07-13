local keymap = require('utils').keymap
local opts = { noremap = true, silent = true }

keymap('n', '<space>', '<nop>', opts)
vim.g.mapleader = ' '

-- Clear match highlights
keymap('n', '<esc>', ':noh<cr>', opts)

-- Navigate splits
keymap('n', '<c-h>', '<c-w><c-h>', opts)
keymap('n', '<c-j>', '<c-w><c-j>', opts)
keymap('n', '<c-k>', '<c-w><c-k>', opts)
keymap('n', '<c-l>', '<c-w><c-l>', opts)

-- Move through wrap lines
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)

-- Reselect visual after indent
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Search selected text
-- Consistent `*` behaviour
keymap('n', '*', [[*N]], opts)
keymap('v', '*', [[y/\V<c-r>=escape(@",'/\')<cr><cr>N]], opts)

-- Bubble lines
keymap('x', 'J', ":move '>+1<cr>gv=gv", opts)
keymap('x', 'K', ":move '<-2<cr>gv=gv", opts)

-- Escape
keymap('i', 'jk', '<esc>', opts)

-- Buffers
keymap('n', 'L', ':BufferNext<cr>', opts)
keymap('n', 'H', ':BufferPrevious<cr>', opts)
