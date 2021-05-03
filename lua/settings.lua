local o = vim.o
local bo = vim.bo
local wo = vim.wo

o.mouse = 'a'
o.hidden = true
o.ignorecase = true
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.smartindent = true
o.shiftwidth = O.tab_size
o.tabstop = O.tab_size
o.shortmess = o.shortmess .. 'c'
o.backup = false
o.writebackup = false
o.updatetime = 300
o.pumheight = 10

o.laststatus = O.statusline.enabled and 2 or 0
if (O.statusline.left ~= nil) then
	o.statusline = o.statusline .. O.statusline.left
end

if (O.statusline.right ~= nil) then
	o.statusline = o.statusline .. '%=' .. O.statusline.right
end

bo.undofile = true

wo.number = O.show_line_numbers
wo.wrap = O.wrap_lines
wo.signcolumn = 'yes'
