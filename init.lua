vim.opt.shadafile = 'NONE'

local disabled_built_ins = {
	'netrw',
	'netrwPlugin',
	'netrwSettings',
	'netrwFileHandlers',
	'gzip',
	'zip',
	'zipPlugin',
	'tar',
	'tarPlugin',
	'getscript',
	'getscriptPlugin',
	'vimball',
	'vimballPlugin',
	'2html_plugin',
	'logipat',
	'rrhelper',
	'spellfile_plugin',
	'matchit',
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g['loaded_' .. plugin] = 1
end

require('globals')
vim.cmd('luafile ' .. vim.fn.stdpath('config') .. '/conf.lua')
require('settings')
require('keymappings')
require('plugins')

if
	require('utils').file_exists(
		vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'
	)
then
	vim.cmd('colorscheme ' .. O.editor.colorscheme)
end

require('utils')

vim.defer_fn(function()
	vim.opt.shadafile = ''
	vim.cmd([[
		rshada!
		doautocmd BufRead
	]])
end, 0)
