local function make_config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			'documentation',
			'detail',
			'additionalTextEdits',
		},
	}

	return {
		capabilities = capabilities,
		-- on_attach = on_attach,
	}
end

local function install_servers()
	local required_servers = { 'lua', 'typescript', 'html', 'svelte', 'css', 'tailwindcss', 'json', 'rust' }
	local installed_servers = require('lspinstall').installed_servers()
	for _, server in pairs(required_servers) do
		if not vim.tbl_contains(installed_servers, server) then
			require('lspinstall').install_server(server)
		end
	end
end

local function setup_servers()
	require('lspinstall').setup()

	local servers = require('lspinstall').installed_servers()

	for _, server in pairs(servers) do
		local config = make_config()

		if server == 'lua' then
			config = vim.tbl_extend('force', config, {
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
							path = vim.split(package.path, ';'),
						},
						diagnostics = {
							globals = { 'vim' },
						},
						workspace = {
							library = {
								[vim.fn.expand('$VIMRUNTIME/lua')] = true,
								[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
							},
							maxPreload = 10000,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
		end

		require('lspconfig')[server].setup(config)
	end
end

install_servers()
setup_servers()

require('lspinstall').post_install_hook = function()
	setup_servers()
	vim.cmd('bufdo e')
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = O.lsp.signs,
	underline = O.lsp.underline,
	update_in_insert = O.lsp.update_in_insert,
	virtual_text = {
		enabled = O.lsp.virtual_text,
		prefix = '',
		spacing = 0,
	},
})

if O.lsp.on_hover.line_diagnostics then
	vim.cmd([[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]])
end

if O.lsp.on_hover.signature_help then
	vim.cmd([[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]])
end
