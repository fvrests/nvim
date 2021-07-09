require('nvim-treesitter.configs').setup({
	ensure_installed = 'maintained',
	ignore_install = { 'haskell' },
	highlight = {
		enable = true,
	},
	-- From nvim-ts-context-commentstring
	context_commentstring = {
		enable = true,
	},
	-- From nvim-autopairs
	autopairs = {
		enable = true,
	},
})
