vim.opt.number = true -- show line numbers
vim.opt.mouse = 'a' -- enable mouse
vim.opt.breakindent = true -- match wrapped indent
vim.opt.undofile = true -- save undo history
vim.opt.ignorecase = true -- case insensitive search...
vim.opt.smartcase = true -- ...unless capital in search
vim.opt.updatetime = 250 -- update editor more frequently
vim.opt.termguicolors = true -- more colors
vim.opt.pumheight = 10 -- popup menu height
vim.opt.scrolloff = 5 -- scroll before reaching edge of screen
vim.opt.shortmess:append('c') -- print shorer message
vim.opt.cursorline = true -- highlight cursorline
vim.opt.signcolumn = 'yes' -- always show left column
vim.opt.list = true -- show indent guides...
vim.opt.listchars = { tab = '┊ ' } -- ...using these characters

-- splits
vim.opt.splitright = true -- :vsplit right
vim.opt.splitbelow = true -- :split below

-- indenting
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- show statusline (default: 2)
vim.opt.laststatus = 0

require('util').create_augroups({
	_general = {
		{ 'BufEnter', '*', 'setlocal formatoptions-=o' },
		{ 'VimResized', '*', 'tabdo wincmd =' },
	},
})
