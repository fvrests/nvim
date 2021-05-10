local on_attach = function(client, bufnr)
	-- Disable tsserver formatting (prefer prettier)
	client.resolved_capabilities.document_formatting = false
	local ts_utils = require('nvim-lsp-ts-utils')

	ts_utils.setup({
		enable_import_on_completion = true,
		complete_parens = true,
		signature_help_in_parens = true,
	})

	ts_utils.setup_client(client)

	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', ':TSLspOrganize<cr>')
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'qq', ':TSLspFixCurrent<cr>')
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', ':TSLspRenameFile<cr>')
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', ':TSLspImportAll<cr>')
end

return {
	on_attach = on_attach,
	settings = { documentFormatting = false },
}
