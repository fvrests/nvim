O = {
	editor = {
		---@usage '' or 'unnamedplus'
		clipboard = '',
		colorscheme = 'rose-pine',
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
			diagnostics_prefix = '■ ',
			error = '×',
			hint = '?',
			info = 'i',
			warning = '△',
		},
		on_hover = {
			line_diagnostics = false,
			signature_help = false,
		},
		---@usage { 'lua', 'go' }
		servers = { 'lua' },
		signs = true,
		underline = true,
		update_in_insert = false,
		virtual_text = false,
	},
	statusline = {
		enabled = true,
		lhs = '%f %m',
		rhs = '%l:%c',
	},
	treesitter = {
		---@usage 'maintained' or 'all' or { 'lua', 'go' }
		ensure_installed = 'maintained',
		---@usage { 'haskell' }
		ignore_install = { 'haskell' },
		highlight = {
			enable = true,
		},
	},
	-- User keymaps
	keymaps = {},
	-- User <leader> keymaps
	leader_keymaps = {
		normal = {},
		visual = {},
	},
	-- User plugins
	plugins = {},
}
