local util = require('util')

vim.opt.backup = false
vim.opt.clipboard = ''
vim.opt.cursorline = O.show_cursorline
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.lazyredraw = true
vim.opt.mouse = 'a'
vim.opt.number = O.show_line_numbers
vim.opt.pumheight = 10
vim.opt.scrolloff = 5
vim.opt.shiftwidth = O.tab_size
vim.opt.shortmess:append('c')
vim.opt.signcolumn = O.show_signcolumn and 'yes' or 'no'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = O.tab_size
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false

if O.show_indent_guides then
	vim.opt.list = true
	vim.opt.listchars = { tab = '┊ ' }
end

if O.wrap_lines then
	vim.opt.breakindent = true
	vim.opt.linebreak = true
	vim.opt.wrap = true
else
	vim.opt.wrap = false
end

if O.show_statusline == false then
	vim.opt.laststatus = 0
else
	vim.opt.laststatus = 2
	vim.opt.statusline:append('%f %m')
	vim.opt.statusline:append('%=')
	local git_branch = "%{get(b:,'gitsigns_head','')}"
	if git_branch ~= nil then
		vim.opt.statusline:append(git_branch .. ' ')
	end
	vim.opt.statusline:append('%l:%c')
end

util.create_augroups({
	_general = {
		-- stop o/O continuing comments
		{ 'BufEnter', '*', 'setlocal formatoptions-=o' },

		-- set equal split width on window resize
		{ 'VimResized', '*', 'tabdo wincmd =' },
	},
})
