local on_attach = function(client, _)
	client.resolved_capabilities.document_formatting = true
end

return {
	on_attach = on_attach,
	settings = { documentFormatting = false },
}
