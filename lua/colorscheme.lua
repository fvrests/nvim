vim.o.termguicolors = true
vim.cmd('colorscheme ' .. O.colorscheme)

local p = {
	base = '#191724',
	surface = '#1f1d2e',
	overlay = '#26233a',
	inactive = '#555169',
	subtle = '#6e6a86',
	text = '#e0def4',
	love = '#eb6f92',
	gold = '#f6c177',
	rose = '#ebbcba',
	pine = '#31748f',
	foam = '#9ccfd8',
	iris = '#c4a7e7',
	highlight = '#2a2837',
	highlight_inactive = '#211f2d',
	highlight_overlay = '#3a384a',
}

-- black
vim.g.terminal_color_0 = '#26233a'
vim.g.terminal_color_8 = '#26233a'

-- red
vim.g.terminal_color_4 = '#eb6f92'
vim.g.terminal_color_12 = '#eb6f92'

-- green
vim.g.terminal_color_2 = '#31748f'
vim.g.terminal_color_10 = '#31748f'

-- yellow
vim.g.terminal_color_6 = '#f6c177'
vim.g.terminal_color_14 = '#f6c177'

-- blue
vim.g.terminal_color_1 = '#9ccfd8'
vim.g.terminal_color_9 = '#9ccfd8'

-- magenta
vim.g.terminal_color_5 = '#c4a7e7'
vim.g.terminal_color_13 = '#c4a7e7'

-- cyan
vim.g.terminal_color_3 = '#ebbcba'
vim.g.terminal_color_11 = '#ebbcba'

-- white
vim.g.terminal_color_7 = '#e0def4'
vim.g.terminal_color_15 = '#e0def4'
