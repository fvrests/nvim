O = {
	colorscheme = 'rose-pine',
	editor = {
		cursorline = false,
		format_on_save = true,
		icons = {
			close = '×',
			folder = '>',
			folder_empty = '≥',
			folder_empty_open = '≤',
			folder_open = '▼',
			modified = '●',
			symlink = '↔',
		},
		indent_guides = false,
		line_numbers = true,
		tab_size = 4,
		wrap_lines = true,
	},
	git = {
		icons = {
			deleted = ' ',
			ignored = '◌',
			renamed = '➜',
			staged = '✓',
			unmerged = '◇',
			unstaged = '×',
			untracked = '★',
		},
	},
	lsp = {
		icons = {
			error = '×',
			hint = '?',
			info = 'i',
			warning = '△',
		},
		on_hover = {
			line_diagnostics = false,
			signature_help = false,
		},
		servers = {},
		signs = true,
		underline = true,
		update_in_insert = false,
		virtual_text = false,
	},
	statusline = {
		enabled = false,
		lhs = '%f',
		rhs = '%l:%c',
	},
	treesitter = {
		ensure_installed = 'maintained',
		ignore_install = { 'haskell' },
	},
	noop = {
		treesitter = {
			highlight = {
				enable = true,
			},
		},
	},
}
