O.editor.clipboard = 'unnamedplus'
O.editor.colorscheme = 'rose-pine'
vim.g.rose_pine_variant = 'rose-pine'
vim.g.rose_pine_enable_italics = false
vim.g.rose_pine_disable_background = false
O.editor.cursorline = true
O.editor.format_on_save = true
O.editor.indent_guides = false
O.editor.line_numbers = true
O.editor.tab_size = 4
O.editor.wrap_lines = false

O.lsp.on_hover.line_diagnostics = false
O.lsp.on_hover.signature_help = false
O.lsp.servers = {
	'lua',
	'typescript',
	'html',
	'svelte',
	'css',
	'tailwindcss',
	'json',
	'rust',
	'go',
}
O.lsp.signs = true
O.lsp.underline = true
O.lsp.update_in_insert = false
O.lsp.virtual_text = false

O.statusline.enabled = false

O.plugins = {
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup()
		end,
		disable = false,
	},
	{
		'mvllow/modes.nvim',
		config = function()
			require('modes').setup()
		end,
		event = 'BufRead',
		disable = false,
	},
	{
		'kdheepak/lazygit.nvim',
		cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitFilter' },
		disable = false,
	},
	{
		'iamcco/markdown-preview.nvim',
		ft = { 'markdown' },
		run = 'cd app && npm install',
		disable = false,
	},
}
