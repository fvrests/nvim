O = {
	--- @usage '' or 'unnamedplus'
	clipboard = '',
	colorscheme = 'rose-pine',
	cursorline = false,
	format_on_save = true,
	indent_guides = false,
	line_numbers = true,
	show_sign_column = true,
	tab_size = 4,
	wrap_lines = true,

	--- Interface icons
	--- For example, LSP diagnostics, git symbols, bufferline actions, tree folders
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

	lsp = {
		on_hover = {
			line_diagnostics = false,
			signature_help = false,
		},
		--- @usage { 'lua', 'go', ... }
		servers = { 'lua' },
		signs = true,
		underline = true,
		update_in_insert = false,
		virtual_text = false,
	},

	statusline = {
		enabled = true,
		--- Set left hand side of statusline
		---
		--- @example
		--- 	local git_branch = " %{get(b:,'gitsigns_head','')}"
		--- 	O.statusline.lhs = O.statusline.lhs .. git_branch
		lhs = '%f %m',
		--- Set right hand side of statusline
		---
		--- @example
		--- 	local git_branch = "%{get(b:,'gitsigns_head','')} "
		--- 	O.statusline.rhs = git_branch .. O.statusline.rhs
		rhs = '%l:%c',
	},

	treesitter = {
		--- @usage 'maintained' or 'all' or { 'lua', 'go', ... }
		ensure_installed = 'maintained',
		--- @usage { 'haskell', ... }
		ignore_install = { 'haskell' },
		highlight = {
			enable = true,
		},
	},

	--- User keymaps
	keymaps = {},

	--- User <leader> keymaps
	leader_keymaps = {
		normal = {},
		visual = {},
	},

	--- User plugins
	---
	--- @example
	--- { 'folke/tokyonight.nvim' },
	--- {
	--- 	'hoob3rt/lualine.nvim',
	---  	config = function()
	--- 		require('lualine').setup({
	--- 			options = {
	--- 				theme = 'tokyonight',
	--- 			},
	--- 		})
	--- 	end,
	--- },
	plugins = {},

	--- Optional pre-configured plugins, aka modules
	---
	--- @example O.modules.modes = true
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

	-- @deprecated Replace `O.editor.<option>` with `O.<option>`
	editor = {
		-- @deprecated Replace `O.editor.clipboard` with `O.clipboard`
		clipboard = '',
		-- @deprecated Replace `O.editor.colorscheme` with `O.colorscheme`
		colorscheme = 'rose-pine',
		-- @deprecated Replace `O.editor.cursorline` with `O.cursorline`
		cursorline = false,
		-- @deprecated Replace `O.editor.format_on_save` with `O.format_on_save`
		format_on_save = true,
		-- @deprecated Replace `O.editor.indent_guides` with `O.indent_guides`
		indent_guides = false,
		-- @deprecated Replace `O.editor.line_numbers` with `O.line_numbers`
		line_numbers = true,
		-- @deprecated Replace `O.editor.show_sign_column` with `O.show_sign_column`
		show_sign_column = true,
		-- @deprecated Replace `O.editor.tab_size` with `O.tab_size`
		tab_size = 4,
		-- @deprecated Replace `O.editor.wrap_lines` with `O.wrap_lines`
		wrap_lines = true,
	},
}
