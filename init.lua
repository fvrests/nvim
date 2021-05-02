require 'plugins'
require 'globals'
vim.cmd('luafile ~/.config/nvim/conf.lua')
require 'autocommands'
require 'settings'
require 'keymappings'
require 'colorscheme'

-- lsp
require 'lsp'

-- plugin config
require 'p-barbar'
require 'p-comment'
require 'p-compe'
require 'p-telescope'
require 'p-tree'
require 'p-treesitter'
