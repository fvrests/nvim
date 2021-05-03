local on_attach = function(client, bufnr) end

local function make_config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			'documentation',
			'detail',
			'additionalTextEdits',
		}
	}

	return {
		capabilities = capabilities,
		on_attach = on_attach
	}
end

local function setup_servers()
	require'lspinstall'.setup()

	local servers = require'lspinstall'.installed_servers()

	for _, server in pairs(servers) do
		local config = make_config()

		if server == 'typescript' then
			config = vim.tbl_extend('force', config, require'lsp/js-ts')
		end

		if server == 'efm' then
			config = vim.tbl_extend('force', config, require'lsp/efm')
		end

		if server == 'lua' then
			config = vim.tbl_extend('force', config, require'lsp/lua')
		end

		require'lspconfig'[server].setup(config)
	end
end

setup_servers()

require'lspinstall'.post_install_hook = function ()
	setup_servers()
	vim.cmd('bufdo e')
end

local set_keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.buf.show_line_diagnostics()<cr>', opts)

