local set_keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

vim.cmd("hi BufferCurrentMod guifg=#9ccfd8")
vim.cmd("hi BufferInactiveMod guifg=#9ccfd8")
vim.cmd("hi BufferVisibleMod guifg=#9ccfd8")

set_keymap('n', '}', ':BufferNext<cr>', opts)
set_keymap('n', '{', ':BufferPrevious<cr>', opts)
set_keymap('n', '<leader>bd', ':BufferClose<cr>', opts)
set_keymap('n', '<leader>bo', ':BufferCloseAllButCurrent<cr>', opts)
