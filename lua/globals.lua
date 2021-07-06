O = {
	colorscheme = 'rose-pine',
	editor = {
		cursorline = false,
		indent_guides = false,
		line_numbers = true,
		tab_size = 4,
		wrap_lines = true,
	},
	lsp = {
		signs = true,
		underline = true,
		update_in_insert = false,
		virtual_text = false,
		on_hover = {
			line_diagnostics = false,
			signature_help = false,
		},
	},
	statusline = {
		enabled = false,
		left = '%f',
		right = '%l:%c',
	},
}
