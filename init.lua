local utils = require('utils')
local config_path = vim.fn.stdpath('config')

utils.disable_built_ins()

require('globals')

if utils.file_exists(config_path .. '/conf.lua') then
	-- Grap user settings
	vim.cmd('luafile ' .. config_path .. '/conf.lua')
else
	print('Unable to find user config. Create one at ~/.config/nvim/conf.lua')
end

require('settings')
require('keymappings')
require('plugins')

if
	O.editor.colorscheme ~= nil
	and utils.file_exists(config_path .. '/plugin/packer_compiled.lua')
then
	vim.cmd('colorscheme ' .. O.editor.colorscheme)
end

utils.define_augroups({
	_general_settings = {
		{
			'BufEnter',
			'*',
			'setlocal formatoptions-=o',
		},
		{
			'BufWritePost',
			'conf.lua',
			'lua require("utils").reload_config()',
		},
	},
	_resize_splits = {
		-- Set equal split width on window resize
		{ 'VimResized ', '*', 'tabdo wincmd =' },
	},
})
