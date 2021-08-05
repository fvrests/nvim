local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')

local signs = {
	Error = O.lsp.icons.error,
	Warning = O.lsp.icons.warning,
	Hint = O.lsp.icons.hint,
	Information = O.lsp.icons.info,
}

for type, icon in pairs(signs) do
	local hl = 'LspDiagnosticsSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { 'documentation', 'detail', 'additionalTextEdits' },
}

local function install_servers()
	local required_servers = O.lsp.servers
	local installed_servers = lspinstall.installed_servers()
	for _, server in pairs(required_servers) do
		if not vim.tbl_contains(installed_servers, server) then
			lspinstall.install_server(server)
		end
	end
end

local function setup_servers()
	lspinstall.setup()
	require('lua-dev').setup()

	local servers = lspinstall.installed_servers()

	for _, server in pairs(servers) do
		local config = {
			capabilities = capabilities,
		}

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

		lspconfig[server].setup(vim.tbl_deep_extend('force', {
			capabilities = capabilities,
		}, config))
	end
end

install_servers()
setup_servers()

lspinstall.post_install_hook = function()
	setup_servers()
	vim.cmd('bufdo e')
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		signs = O.lsp.signs,
		underline = O.lsp.underline,
		update_in_insert = O.lsp.update_in_insert,
		virtual_text = O.lsp.virtual_text and {
			prefix = O.lsp.icons.diagnostics_prefix,
		},
	}
)

if O.lsp.on_hover.line_diagnostics then
	vim.cmd(
		[[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
	)
end

if O.lsp.on_hover.signature_help then
	vim.cmd([[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]])
end
