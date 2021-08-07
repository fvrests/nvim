vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.pumheight = 10
vim.opt.shortmess:append('c')
vim.opt.signcolumn = 'yes'
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 300
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = vim.fn.stdpath('cache') .. '/undo'
vim.opt.undofile = true
vim.opt.scrolloff = 8
vim.opt.lazyredraw = true
vim.opt.termguicolors = true
vim.opt.clipboard = O.editor.clipboard

vim.opt.cursorline = O.editor.cursorline
vim.opt.number = O.editor.line_numbers
vim.opt.shiftwidth = O.editor.tab_size
vim.opt.tabstop = O.editor.tab_size

if O.editor.wrap_lines then
	vim.opt.linebreak = true
	vim.opt.wrap = true
end

vim.opt.laststatus = O.statusline.enabled and 2 or 0
if O.statusline.lhs ~= nil then
	vim.opt.statusline:append(O.statusline.lhs)
end

if O.statusline.rhs ~= nil then
	vim.opt.statusline:append('%=')
	vim.opt.statusline:append(O.statusline.rhs)
end

if O.editor.indent_guides then
	vim.opt.list = true
	vim.opt.listchars = { tab = '┊ ' }
end
