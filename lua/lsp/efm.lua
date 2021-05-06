local lspconfig = require('lspconfig')

-- Searches for local prettier
-- $ npm install --save-dev prettier
local prettier = {
	formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}',
	formatStdin = true,
}

-- Searches for stylua installed via cargo
-- $ brew install rust
-- $ cargo install stylua
local stylua = {
	formatCommand = '~/.cargo/bin/stylua -',
	formatStdin = true,
}

local languages = {
	json = { prettier },
	yaml = { prettier },
	markdown = { prettier },
	javascript = { prettier },
	javascriptreact = { prettier },
	typescript = { prettier },
	typescriptreact = { prettier },
	vue = { prettier },
	svelte = { prettier },
	html = { prettier },
	css = { prettier },
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
