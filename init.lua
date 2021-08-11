local util = require('util')
local config_path = vim.fn.stdpath('config')
local config_file = config_path .. '/config.lua'

util.disable_built_ins()

require('globals')

if util.file_exists(config_file) then
	vim.cmd('luafile ' .. config_file)
else
	print('Unable to find user config. Create one at ' .. config_file)
end

require('settings')
require('keymappings')
require('plugins')

if
	O.editor.colorscheme ~= nil
	and util.file_exists(config_path .. '/plugin/packer_compiled.lua')
then
	vim.cmd('colorscheme ' .. O.editor.colorscheme)
end
