local lspconfig = require 'lspconfig'

-- efm.lua
local prettier = {
  formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
  formatStdin = true
}

-- local eslint = {
--   lintCommand = 'eslint -f unix --stdin',
--   lintIgnoreExitCode = true,
--   lintStdin = true,
-- }


local languages = {
	json = { prettier },
	yaml = { prettier },
	markdown = { prettier },
	javascript = { prettier },
	javascriptreact = { prettier },
	typescript = { prettier },
	typescriptreact = { prettier },
	vue = { prettier },
	html = { prettier },
	css = { prettier },
}

return {
	root_dir = lspconfig.util.root_pattern("yarn.lock", "package.json", ".git"),
	filetypes = vim.tbl_keys(languages),
	init_options = {
		documentFormatting = true,
		codeAction = true
	},
	settings = {
		rootMarkers = { ".git/" },
		languages = languages
	}
}
