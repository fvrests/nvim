O = {
	colorscheme = 'rose-pine',
	editor = {
		cursorline = false,
		format_on_save = true,
		indent_guides = false,
		line_numbers = true,
		tab_size = 4,
		wrap_lines = true,
	},
	lsp = {
		servers = {},
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
		lhs = '%f',
		rhs = '%l:%c',
	},
}
