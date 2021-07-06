vim.opt.completeopt = 'menuone,noselect'

require('compe').setup({
	enabled = true,
	autocomplete = true,
	documentation = true,

	source = {
		path = {},
		buffer = {},
		calc = {},
		nvim_lsp = {},
		treesitter = {},
		spell = {},
		vsnip = {},
	},
})
