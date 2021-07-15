local wk = require('which-key')

wk.setup({
	plugins = {
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
	},
})

local opts = {
	prefix = '<leader>',
}

local mappings = {
	['c'] = { '<cmd>BufferClose<cr>', 'Close buffer' },
	['e'] = { '<cmd>NvimTreeToggle<cr>', 'Explorer' },
	['f'] = { '<cmd>Telescope find_files<cr>', 'Find file' },
	['h'] = { '<cmd>let @/=""<cr>', 'Clear match highlight' },
	b = {
		name = 'Buffer',
		c = { '<cmd>BufferClose<cr>', 'Close' },
		o = { '<cmd>BufferCloseAllButCurrent<cr>', 'Close others' },
		n = { '<cmd>BufferNext<cr>', 'Next' },
		p = { '<cmd>BufferPrevious<cr>', 'Prev' },
		r = { '<c-w><c-r>', 'Swap splits' },
	},
	p = {
		name = 'Packer',
		c = { '<cmd>PackerCompile<cr>', 'Compile' },
		i = { '<cmd>PackerInstall<cr>', 'Install' },
		r = { "<cmd>lua require('utils').reload_config()<cr>", 'Reload' },
		s = { '<cmd>PackerSync<cr>', 'Sync' },
		u = { '<cmd>PackerUpdate<cr>', 'Update' },
	},
	g = {
		name = 'Git',
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", 'Next hunk' },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", 'Prev hunk' },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", 'Blame' },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", 'Preview hunk' },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", 'Reset hunk' },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", 'Reset buffer' },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", 'Stage hunk' },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			'Undo stage hunk',
		},
		o = { '<cmd>Telescope git_status<cr>', 'Open changed file' },
		b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
		c = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
		C = {
			'<cmd>Telescope git_bcommits<cr>',
			'Checkout commit (for current file)',
		},
	},
	l = {
		name = 'LSP',
		a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code action' },
		d = {
			'<cmd>Telescope lsp_document_diagnostics<cr>',
			'Document diagnostics',
		},
		e = { '<cmd>lua vim.lsp.buf.references()<cr>', 'References' },
		o = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Declaration' },
		O = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Definition' },
		h = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover' },
		w = {
			'<cmd>Telescope lsp_workspace_diagnostics<cr>',
			'Workspace diagnostics',
		},
		i = { '<cmd>LspInfo<cr>', 'Info' },
		j = { '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', 'Next diagnostic' },
		k = { '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', 'Prev diagnostic' },
		l = {
			'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>',
			'Line diagnostics',
		},
		q = { '<cmd>Telescope quickfix<cr>', 'Quickfix' },
		r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
		s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document symbols' },
		S = {
			'<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
			'Workspace symbols',
		},
		t = {
			'<cmd>lua vim.lsp.buf.type_definition()<cr>',
			'Type definition',
		},

		-- TODO: Maybe find a better spot for formatting
		f = { '<cmd>silent FormatWrite<cr>', 'Format' },
		F = {
			"<cmd>lua require('utils').save_without_formatting()<cr>",
			'Save without formatting',
		},
	},
	s = {
		name = 'Search',
		b = { '<cmd>Telescope git_branches<cr>', 'Branches' },
		c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
		C = { '<cmd>Telescope commands<cr>', 'Commands' },
		f = { '<cmd>Telescope find_files<cr>', 'Files' },
		h = { '<cmd>Telescope help_tags<cr>', 'Help tags' },
		k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
		M = { '<cmd>Telescope man_pages<cr>', 'Man pages' },
		r = { '<cmd>Telescope oldfiles<cr>', 'Recent files' },
		R = { '<cmd>Telescope registers<cr>', 'Registers' },
		t = { '<cmd>Telescope live_grep<cr>', 'Text' },
	},
	t = {
		name = 'Treesitter',
		i = { '<cmd>TSConfigInfo<cr>', 'Info' },
		h = { '<cmd>TSBufToggle highlight<cr>', 'Toggle highlight' },
		c = {
			'<cmd>TSHighlightCapturesUnderCursor<cr>',
			'Highlight active captures',
		},
	},
}

wk.register(mappings, opts)
