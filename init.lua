vim.cmd([[
	syntax off
]])

vim.opt.shadafile = 'NONE'
vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_man = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false

require('globals')
vim.cmd('luafile ' .. vim.fn.stdpath('config') .. '/conf.lua')
require('settings')
require('keymappings')
require('plugins')
vim.cmd('colorscheme ' .. O.editor.colorscheme)
require('utils')

vim.defer_fn(function()
	vim.opt.shadafile = ''
	vim.cmd([[
		rshada!
		doautocmd BufRead
		syntax on
	]])
end, 0)
