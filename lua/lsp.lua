local lspinstall = require('lspinstall')

-- automatically install language servers
local function install_servers()
	local required_servers = O.lsp.servers
	local installed_servers = lspinstall.installed_servers()
	for _, server in pairs(required_servers) do
		if not vim.tbl_contains(installed_servers, server) then
			lspinstall.install_server(server)
		end
	end
end

-- create shared config between language servers
local function make_config()
	-- because we are using nvim-cmp for completion, we can turn on _almost_ everything
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.preselectSupport = true
	capabilities.textDocument.completion.completionItem.insertReplaceSupport =
		true
	capabilities.textDocument.completion.completionItem.labelDetailsSupport =
		true
	capabilities.textDocument.completion.completionItem.deprecatedSupport = true
	capabilities.textDocument.completion.completionItem.commitCharactersSupport =
		true
	capabilities.textDocument.completion.completionItem.tagSupport = {
		valueSet = { 1 },
	}
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			'documentation',
			'detail',
			'additionalTextEdits',
		},
	}
	return {
		capabilities = capabilities,
		on_attach = function(client)
			-- prefer null-ls formatting over builtin lsp
			client.resolved_capabilities.document_formatting = false
		end,
	}
end

-- setup installed language servers
-- uses shared config and any server specific overrides
local function setup_servers()
	lspinstall.setup()

	local servers = lspinstall.installed_servers()
	for _, server in pairs(servers) do
		local config = make_config()

		if server == 'lua' then
			config = vim.tbl_extend('force', config, require('lua-dev').setup())
		end

		require('lspconfig')[server].setup(config)
	end
end

install_servers()
setup_servers()

-- automatically setup servers again after `:LspInstall <server>`
lspinstall.post_install_hook = function()
	setup_servers() -- setup server with lspconfig
	vim.cmd('bufdo e') -- trigger the FileType autocmd that starts the server
end

-- diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	O.lsp.diagnostics
)
