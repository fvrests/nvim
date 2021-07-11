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
if O.editor.colorscheme ~= nil then
	vim.cmd('colorscheme ' .. O.editor.colorscheme)
else
	-- Disable all syntax highlighting
	-- Goal(wip): Make a usable environment with no colour
	--   * Remove any default colours, eg. line numbers

	O.noop.treesitter.highlight.enable = false
	vim.cmd('syntax off')
	vim.cmd('set nohlsearch')
	vim.cmd('set t_Co=0')
	-- Fix barbar complaining about `Special`
	vim.cmd('hi Special ctermfg=None')
end
require('keymappings')
require('lsp')
