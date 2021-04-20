vim.o.termguicolors = true

function fg(scope, color)
	vim.cmd(string.format('hi %s guifg=%s', scope, color))
end

local cfoam = '#9ccfd8'

fg('BufferCurrentMod', cfoam)
fg('BufferInactiveMod', cfoam)
fg('BufferVisibleMod', cfoam)

--vim.cmd("hi BufferCurrentMod guifg=#9ccfd8")
--vim.cmd("hi BufferInactiveMod guifg=#9ccfd8")
--vim.cmd("hi BufferVisibleMod guifg=#9ccfd8")

