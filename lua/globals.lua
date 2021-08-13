O = {
	-- Enable optional pre-configured plugins
	modules = {
		bufferline = false,
		colorizer = false,
		gitsigns = false,
		lazygit = false,
		markdown_preview = false,
		modes = false,
		terminal = false,
		tree = false,
	},
	icons = {
		none = ' ',
		arrow = '➜',
		check = '✓',
		error = '×',
		hint = '?',
		info = 'i',
		warning = '△',
		modified = '●',
		ignored = '◌',
		folder = '>',
		folder_open = '▼',
	},
	editor = {
		---@usage '' or 'unnamedplus'
		clipboard = '',
		colorscheme = 'rose-pine',
		cursorline = false,
		format_on_save = true,
		indent_guides = false,
		line_numbers = true,
		show_sign_column = true,
		tab_size = 4,
		wrap_lines = true,
	},
	lsp = {
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
