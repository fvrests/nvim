local on_attach = function(client)
	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_command([[augroup Format]])
		vim.api.nvim_command([[autocmd! * <buffer>]])
		vim.api.nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]])
		vim.api.nvim_command([[augroup END]])
	end
	vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
end

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
		on_attach = on_attach,
	}
end

local function install_servers()
	local required_servers = { 'lua', 'efm', 'typescript', 'html', 'svelte', 'css', 'tailwindcss', 'bash', 'json' }
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

		if server == 'efm' then
			config = vim.tbl_extend('force', config, require('lsp/efm'))
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
set_keymap('n', '<leader>lk', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
set_keymap('n', '<leader>ltd', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
set_keymap('n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
set_keymap('n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	underline = true,
	signs = true,
})

if O.show_diagnostics_on_hover then
	vim.cmd([[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]])
end

if O.show_signature_help_on_hover then
	vim.cmd([[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]])
end
