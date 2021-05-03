vim.o.mouse = 'a'
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.smartindent = true
vim.o.shiftwidth = O.tab_size
vim.o.tabstop = O.tab_size
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.pumheight = 10

vim.o.laststatus = O.statusline.enabled and 2 or 0
if (O.statusline.left ~= nil) then
	vim.o.statusline = vim.o.statusline .. O.statusline.left
end

if (O.statusline.right ~= nil) then
	vim.o.statusline = vim.o.statusline .. '%=' .. O.statusline.right
end

vim.bo.undofile = true

vim.wo.number = O.show_line_numbers
vim.wo.wrap = O.wrap_lines
vim.wo.signcolumn = 'yes'
