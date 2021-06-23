vim.o.completeopt = 'menuone,noselect'

require('compe').setup({
	enabled = true,
	autocomplete = true,
	documentation = true,
	source = {
		path = {},
		buffer = {},
		calc = {},
		vsnip = {},
		nvim_lsp = {},
		treesitter = {},
		spell = {},
		emoji = { filetypes = { 'markdown', 'text' } },
	},
})
