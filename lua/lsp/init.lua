vim.fn.sign_define(
	'LspDiagnosticsSignError',
	{ texthl = 'LspDiagnosticsSignError', text = '', numhl = 'LspDiagnosticsSignError' }
)
vim.fn.sign_define(
	'LspDiagnosticsSignWarning',
	{ texthl = 'LspDiagnosticsSignWarning', text = '', numhl = 'LspDiagnosticsSignWarning' }
)
vim.fn.sign_define(
	'LspDiagnosticsSignHint',
	{ texthl = 'LspDiagnosticsSignHint', text = '', numhl = 'LspDiagnosticsSignHint' }
)
vim.fn.sign_define(
	'LspDiagnosticsSignInformation',
	{ texthl = 'LspDiagnosticsSignInformation', text = '', numhl = 'LspDiagnosticsSignInformation' }
)

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
	local required_servers = { 'lua', 'typescript', 'html', 'svelte', 'css', 'tailwindcss', 'json', 'graphql' }
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

		if server == 'typescript' then
			config = vim.tbl_extend('force', config, require('lsp/js-ts'))
		end

		if server == 'svelte' then
			config = vim.tbl_extend('force', config, require('lsp/svelte'))
		end

		if server == 'html' then
			config = vim.tbl_extend('force', config, require('lsp/html'))
		end

		if server == 'lua' then
			config = vim.tbl_extend('force', config, require('lsp/lua'))
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

local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
set_keymap('n', '<leader>ldc', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
set_keymap('n', '<leader>ldf', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
set_keymap('n', '<leader>li', '<cmd>LspInfo<cr>', opts)
set_keymap('n', '<leader>lk', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
set_keymap('n', '<leader>ltd', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
set_keymap('n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
set_keymap('n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
set_keymap('n', '<leader>lre', '<cmd>lua vim.lsp.buf.references()<cr>', opts)

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
