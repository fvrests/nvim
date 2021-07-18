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
	'man',
	'getscript',
	'getscriptPlugin',
	'vimball',
	'vimballPlugin',
	'2html_plugin',
	'logipat',
	'rrhelper',
	'spellfile_plugin',
	-- 'matchit', 'matchparen', 'shada_plugin',
}
for _, plugin in pairs(disabled_built_ins) do
	vim.g['loaded_' .. plugin] = 1
end

require('globals')
vim.cmd('luafile ' .. vim.fn.stdpath('config') .. '/conf.lua')
require('settings')
require('plugins')
require('utils')
vim.cmd('colorscheme ' .. O.editor.colorscheme)
require('keymappings')
require('lsp')
