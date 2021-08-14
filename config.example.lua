-- mvllow/nvim user config
-- https://github.com/mvllow/nvim
--
-- If you haven't already, copy this file as config.lua.
-- This is your personal config and will not be overwritten when updating.

O.clipboard = ''
O.colorscheme = 'rose-pine'
vim.g.rose_pine_variant = 'rose-pine'
vim.g.rose_pine_enable_italics = false
vim.g.rose_pine_disable_background = false
O.cursorline = true
O.format_on_save = true
O.indent_guides = false
O.line_numbers = true
O.show_sign_column = true
O.tab_size = 4
O.wrap_lines = false

O.lsp.on_hover.line_diagnostics = false
O.lsp.on_hover.signature_help = false
O.lsp.servers = {
	'lua',
	-- 'typescript',
	-- 'html',
	-- 'css',
	-- 'tailwindcss',
	-- 'svelte',
	-- 'json',
	-- 'rust',
	-- 'go',
	-- ...
}
O.lsp.signs = true
O.lsp.underline = true
O.lsp.update_in_insert = false
O.lsp.virtual_text = false

O.keymaps = {
	{ 'n', '}', '<cmd>BufferNext<cr>' },
	{ 'n', '{', '<cmd>BufferPrevious<cr>' },
	{ 'v', '<leader>/', ":'<,'>CommentToggle<cr>" },
}

O.leader_keymaps = {
	normal = {
		['/'] = { '<cmd>CommentToggle<cr>', 'Comment' },
		s = {
			p = { '<cmd>Telescope planets<cr>', 'Planets' },
		},
	},
	visual = {

		['/'] = { ":'<,'>CommentToggle<cr>", 'Comment' },
	},
}

O.modules = {
	bufferline = false,
	colorizer = false,
	gitsigns = false,
	lazygit = false,
	markdown_preview = false,
	modes = false,
	terminal = false,
	tree = false,
}

O.plugins = {
	{
		'hoob3rt/lualine.nvim',
		config = function()
			require('lualine').setup({
				options = {
					theme = 'rose-pine',
				},
			})
		end,
	},
}
