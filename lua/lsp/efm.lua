local lspconfig = require('lspconfig')

local prettier = {
	formatCommand = 'prettier --stdin-filepath ${INPUT}',
	formatStdin = true,
}
if vim.fn.glob('node_modules/.bin/prettier') == true then
	prettier.formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}'
end

local stylua = {
	formatCommand = '~/.cargo/bin/stylua -',
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
	-- svelte = { prettier },
	html = { prettier },
	css = { prettier },
	markdown = { prettier },
	lua = { stylua },
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
