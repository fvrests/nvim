-- these are some commonly changed options
-- defaults can be found in lua/globals.lua

vim.g.rose_pine_disable_italics = true
vim.g.rose_pine_variant = 'dawn'
O.colorscheme = 'rose-pine'
O.format_on_save = true
O.lsp = {
	diagnostics = {
		signs = true,
		underline = true,
		update_in_insert = false,
		virtual_text = false,
	},
	servers = {
		'lua',
		'typescript',
		'html',
		'svelte',
		'css',
		'tailwindcss',
		'json',
		'go',
	},
}
