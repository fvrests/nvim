local util = require('util')
local config = vim.fn.stdpath('config') .. '/config.lua'
local packer = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'

require('globals')

if util.file_exists(config) then
	vim.cmd('luafile ' .. config)
end

require('options')
require('keymaps')
require('plugins')

if util.file_exists(packer) then
	vim.cmd('colorscheme ' .. O.colorscheme)
end
