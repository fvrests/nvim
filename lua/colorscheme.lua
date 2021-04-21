vim.o.termguicolors = true
vim.cmd('colorscheme nord')

function fg(scope, color)
	vim.cmd(string.format('hi %s guifg=%s', scope, color))
end

local color_mod = '#88c0d0'

-- TODO: This seems to be overwritten by colorscheme
fg('BufferCurrentMod', color_mod)
fg('BufferInactiveMod', color_mod)
fg('BufferVisibleMod', color_mod)

