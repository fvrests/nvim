local lspconfig = require('lspconfig')

local prettier = {
	formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}',
	formatStdin = true,
}

local stylua = {
	formatCommand = '~/.cargo/bin/stylua -',
	formatStdin = true,
}

local pandoc = {
	formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2',
	formatStdin = true,
}

local languages = {
	json = { prettier },
	yaml = { prettier },
	javascript = { prettier },
	javascriptreact = { prettier },
	typescript = { prettier },
	typescriptreact = { prettier },
	vue = { prettier },
	svelte = { prettier },
	html = { prettier },
	css = { prettier },
	lua = { stylua },
	markdown = { pandoc },
}

return {
	root_dir = lspconfig.util.root_pattern('.git', 'package.json'),
	filetypes = vim.tbl_keys(languages),
	init_options = {
		documentFormatting = true,
		codeAction = true,
	},
	settings = {
		rootMarkers = { '.git/' },
		languages = languages,
	},
}
