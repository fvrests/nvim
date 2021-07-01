local on_attach = function(client)
	-- Disable html formatting (prefer prettier)
	client.resolved_capabilities.document_formatting = false
end

return {
	on_attach = on_attach,
	settings = { documentFormatting = false },
}
