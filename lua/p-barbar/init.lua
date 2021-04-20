local set_keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

set_keymap('n', '}', ':BufferNext<cr>', opts)
set_keymap('n', '{', ':BufferPrevious<cr>', opts)
set_keymap('n', '<leader>bd', ':BufferClose<cr>', opts)
set_keymap('n', '<leader>bo', ':BufferCloseAllButCurrent<cr>', opts)
