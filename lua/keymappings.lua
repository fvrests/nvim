vim.api.nvim_set_keymap(
	'n',
	'<space>',
	'<nop>',
	{ noremap = true, silent = true }
)
vim.g.mapleader = ' '

-- clear highlights
vim.api.nvim_set_keymap(
	'n',
	'<esc>',
	':noh<cr>',
	{ noremap = true, silent = true }
)

-- simplify split movements
vim.api.nvim_set_keymap(
	'n',
	'<c-h>',
	'<c-w><c-h>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<c-j>',
	'<c-w><c-j>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<c-k>',
	'<c-w><c-k>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<c-l>',
	'<c-w><c-l>',
	{ noremap = true, silent = true }
)

-- move through wrapped lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

-- reselect after visual indent
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- search visually selected text (consistent `*` behaviour)
vim.api.nvim_set_keymap('n', '*', [[*N]], { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	'v',
	'*',
	[[y/\V<c-r>=escape(@",'/\')<cr><cr>N]],
	{ noremap = true, silent = true }
)

-- bubble lines
vim.api.nvim_set_keymap(
	'x',
	'J',
	":move '>+1<cr>gv=gv",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	'x',
	'K',
	":move '<-2<cr>gv=gv",
	{ noremap = true, silent = true }
)

-- escape
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true, silent = true })

-- barbar
vim.api.nvim_set_keymap(
	'n',
	'L',
	':BufferNext<cr>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	'n',
	'H',
	':BufferPrevious<cr>',
	{ noremap = true, silent = true }
)





