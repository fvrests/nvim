local on_attach = function(client, bufnr)
	-- Disable tsserver formatting (prefer prettier)
	client.resolved_capabilities.document_formatting = false
end

return {
	on_attach = on_attach,
	settings = { documentFormatting = false },
}
