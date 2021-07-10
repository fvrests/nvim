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

vim.opt.cursorline = O.editor.cursorline
vim.opt.number = O.editor.line_numbers
vim.opt.shiftwidth = O.editor.tab_size
vim.opt.tabstop = O.editor.tab_size
vim.opt.wrap = O.editor.wrap_lines

vim.opt.laststatus = O.statusline.enabled and 2 or 0
if O.statusline.left ~= nil then
	vim.opt.statusline:append(O.statusline.left)
end

if O.statusline.right ~= nil then
	vim.opt.statusline:append('%=')
	vim.opt.statusline:append(O.statusline.right)
end

if O.editor.indent_guides then
	vim.opt.list = true
	vim.opt.listchars = { tab = '┊ ' }
end
