require('globals')
vim.cmd('luafile ' .. vim.fn.stdpath('config') .. '/conf.lua')
require('settings')
require('plugins')
if O.editor.colorscheme ~= nil then
	vim.cmd('colorscheme ' .. O.editor.colorscheme)
else
	vim.g.syntax = false
end
require('keymappings')
require('lsp')
