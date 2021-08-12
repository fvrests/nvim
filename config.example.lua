-- mvllow/nvim user config
-- https://github.com/mvllow/nvim
--
-- If you haven't already, copy this file as config.lua.
-- This is your personal config and will not be overwritten when updating.

O.editor.clipboard = ''
O.editor.colorscheme = 'rose-pine'
vim.g.rose_pine_variant = 'rose-pine'
vim.g.rose_pine_enable_italics = false
vim.g.rose_pine_disable_background = false
O.editor.cursorline = true
O.editor.format_on_save = true
O.editor.indent_guides = false
O.editor.line_numbers = true
O.editor.show_sign_column = true
O.editor.tab_size = 4
O.editor.wrap_lines = false

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
	modes = true,
}

O.plugins = {
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup({ '*' }, { names = false })
		end,
		event = 'BufReadPre',
	},
	{
		'kdheepak/lazygit.nvim',
		cmd = { 'LazyGit' },
	},
	{
		'iamcco/markdown-preview.nvim',
		run = function()
			-- post-install hook
			vim.fn['mkdp#util#install']()
		end,
		ft = 'markdown',
		cmd = { 'MarkdownPreview' },
	},
	{
		'akinsho/nvim-toggleterm.lua',
		config = function()
			require('toggleterm').setup({
				direction = 'float',
				open_mapping = [[<c-\>]],
				close_on_exit = true,
				float_opts = {
					border = 'curved',
				},
			})
		end,
		keys = [[<c-\>]],
	},
}
