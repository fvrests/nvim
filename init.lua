require('globals')
vim.cmd('luafile ' .. vim.fn.stdpath('config') .. '/conf.lua')
require('settings')
require('plugins')
vim.g.colors_name = O.colorscheme
vim.g.syntax = true
require('keymappings')
require('lsp')
