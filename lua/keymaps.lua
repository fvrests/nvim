local util = require('util')

util.map('n', '<space>', '<nop>')
vim.g.mapleader = ' '

-- clear match highlights
util.map('n', '<esc>', ':noh<cr>')

-- navigate splits
util.map('n', '<c-h>', '<c-w><c-h>')
util.map('n', '<c-j>', '<c-w><c-j>')
util.map('n', '<c-k>', '<c-w><c-k>')
util.map('n', '<c-l>', '<c-w><c-l>')

-- swap splits
util.map('n', '<c-s>', '<c-w><c-r>')

-- move through wrap lines
util.map('n', 'j', 'gj')
util.map('n', 'k', 'gk')

-- reselect visual after indent
util.map('v', '<', '<gv')
util.map('v', '>', '>gv')

-- search selected text (consistent with `*` behaviour)
util.map('n', '*', [[*N]])
util.map('v', '*', [[y/\V<c-r>=escape(@",'/\')<cr><cr>N]])

-- bubble lines
util.map('n', '-', ':m .+1<cr>==')
util.map('n', '_', ':m .-2<cr>==')
util.map('v', '-', ":m '>+1<cr>gv=gv")
util.map('v', '_', ":m '<-2<cr>gv=gv")

-- escape
util.map('i', 'jk', '<esc>')

-- copy to system clipboard
util.map('v', 'Y', '"*y')

-- buffers
-- these are ony necessary if not using barbar.nvim
-- util.map('n', 'L', '<cmd>bnext<cr>')
-- util.map('n', 'H', '<cmd>bprev<cr>')
-- util.map('n', '<leader>bn', '<cmd>bnext<cr>')
-- util.map('n', '<leader>bp', '<cmd>bprev<cr>')
-- util.map('n', '<leader>bd', '<cmd>bdelete<cr>')
-- util.map('n', '<leader>bo', [[<cmd>%bd|e#|bd#<cr>'"]]) -- close other buffers (https://stackoverflow.com/a/34050776)

-- buffers (romgrk/barbar.nvim)
util.map('n', '<tab>', '<cmd>BufferNext<cr>')
util.map('n', '<s-tab>', '<cmd>BufferPrevious<cr>')
util.map('n', '<leader>bn', '<cmd>BufferNext<cr>')
util.map('n', '<leader>bp', '<cmd>BufferPrevious<cr>')
util.map('n', '<leader>br', '<cmd>BufferMoveNext<cr>')
util.map('n', '<leader>bl', '<cmd>BufferMovePrevious<cr>')
util.map('n', '<leader>bd', '<cmd>BufferClose<cr>')
util.map('n', '<leader>bo', '<cmd>BufferCloseAllButCurrent<cr>')

-- lsp (nvim-lspconfig)
util.map('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
util.map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
util.map('n', 'gl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>')

-- plugin manager (wbthomason/packer.nvim)
util.map('n', '<leader>pc', '<cmd>PackerCompile<cr>')
util.map('n', '<leader>ps', '<cmd>PackerSync<cr>')

-- file explorer (kyazdani42/nvim-tree.lua)
util.map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

-- fuzzy search (nvim-telescope/telescope.nvim)
util.map('n', '<leader>f', '<cmd>Telescope find_files<cr>')
util.map('n', '<leader>st', '<cmd>Telescope live_grep<cr>')

-- comments (terrortylor/nvim-comment)
util.map('n', '<leader>/', '<cmd>CommentToggle<cr>')
util.map('v', '<leader>/', ':CommentToggle<cr>')
