require('nvim-treesitter.configs').setup({
	ensure_installed = O.treesitter.ensure_installed,
	ignore_install = O.treesitter.ignore_install,
	highlight = {
		enable = O.noop.treesitter.highlight.enable,
	},
	-- From nvim-ts-context-commentstring
	context_commentstring = {
		enable = true,
	},
	-- From nvim-autopairs
	autopairs = {
		enable = true,
	},
	-- From nvim-ts-autotag
	autotag = {
		enable = true,
	},
})
