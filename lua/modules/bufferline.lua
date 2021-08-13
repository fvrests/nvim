local keymap = require('util').keymap

keymap('n', 'L', '<cmd>BufferNext<cr>')
keymap('n', 'H', '<cmd>BufferPrevious<cr>')

vim.g.bufferline = {
	animation = false,
	icon_close_tab = O.icons.error,
	icon_close_tab_modified = O.icons.modified,
	icon_separator_active = '',
	icon_separator_inactive = '',
	icons = false, -- disable file icons
}

return { 'romgrk/barbar.nvim' }
