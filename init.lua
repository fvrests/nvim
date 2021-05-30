require('plugins')
require('globals')
vim.cmd('luafile ~/.config/nvim/conf.lua')
require('settings')
require('keymappings')
require('colorscheme')

-- lsp
require('lsp')

-- plugin config
require('p-barbar')
require('p-compe')
require('p-telescope')
require('p-tree')
