local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.goyo_width = 120

set_keymap('n', '<leader>z', ':Goyo<cr>', opts)
