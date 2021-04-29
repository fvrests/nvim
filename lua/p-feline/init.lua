vim.o.laststatus = 2
vim.o.showmode = false

local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local palette = {
	base = '#191724',
	surface = '#1f1d2e',
	overlay = '#26233a',
	inactive = '#555169',
	subtle = '#6e6a86',
	text = '#e0def4',
	love = '#eb6f92',
	gold = '#f6c177',
	rose = '#ebbcba',
	pine = '#31748f',
	foam = '#9ccfd8',
	iris = '#c4a7e7'
}

local vi_mode_colors = {
    NORMAL = palette.subtle,
    OP = palette.subtle,
    INSERT = palette.text,
    VISUAL = palette.iris,
    BLOCK = palette.foam,
    REPLACE = palette.love,
    ['V-REPLACE'] = palette.love,
    ENTER = palette.subtle,
    MORE = palette.subtle,
    SELECT = palette.subtle,
    COMMAND = palette.rose,
    SHELL = palette.subtle,
    TERM = palette.subtle,
    NONE = palette.subtle
}

local left_sep = {' ', 'left_rounded'}
local right_sep = {'right_rounded', ' '}

local properties = {
	force_inactive = {
		filetypes = {},
		buftypes = {},
		bufnames = {}
	}
}

properties.force_inactive.filetypes = {
	'NvimTree',
	'packer'
}

local components = {
	left = {
		active = {},
		inactive = {}
	},
	mid = {
		active = {},
		inactive = {}
	},
	right = {
		active = {},
		inactive = {}
	}
}

-- whitespace: ⁜
-- mode: Ξ

table.insert(components.left.active, {
    provider = 'vi_mode',
	icon = 'Ξ',
	hl = function()
        local val = {}

        val.name = vi_mode_utils.get_mode_highlight_name()
        val.fg = vi_mode_utils.get_mode_color()
        val.style = 'bold'

        return val
    end,
	left_sep = ' '
})

table.insert(components.left.active, {
	provider = 'file_info',
	icon = '',
	hl = {
		fg = palette.text,
		bg = palette.overlay
	},
	left_sep = left_sep,
	right_sep = right_sep
})

table.insert(components.left.active, {
	provider = 'diagnostic_errors',
	enabled = function() return lsp.diagnostics_exist('Error') end,
	hl = {fg = palette.love},
	right_sep = ' '
})

table.insert(components.left.active, {
	provider = 'diagnostic_warnings',
	enabled = function() return lsp.diagnostics_exist('Warning') end,
	hl = {fg = palette.gold},
	right_sep = ' '
})

table.insert(components.left.active, {
	provider = 'diagnostic_hints',
	enabled = function() return lsp.diagnostics_exist('Hint') end,
	hl = {fg = palette.iris},
	right_sep = ' ',
})

table.insert(components.left.active, {
	provider = 'diagnostic_info',
	enabled = function() return lsp.diagnostics_exist('Information') end,
	hl = {fg = palette.subtle},
	right_sep = ' '
})

table.insert(components.right.active, {
	provider = 'lsp_client_names',
	hl = {fg = palette.inactive},
	left_sep = ' '
})

table.insert(components.right.active, {
	provider = function () return ' ' end
})

require('feline').setup({
    default_bg = 'NONE',
    default_fg = palette.text,
    components = components,
    properties = properties,
    vi_mode_colors = vi_mode_colors
})
