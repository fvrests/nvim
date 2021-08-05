local wk = require('which-key')

wk.setup({
	plugins = {
		spelling = {
			-- show spelling suggestions when pressing z=
			enabled = true,
			suggestions = 20,
		},
		presets = {
			-- disable operators such as d and y
			-- when enabled, this conflicts with modes.nvim
			operators = false,
		},
	},
})

local opts = {
	prefix = '<leader>',
}

local mappings = {
	['c'] = { '<cmd>BufferClose<cr>', 'close buffer' },
	['e'] = { '<cmd>NvimTreeToggle<cr>', 'explorer' },
	['f'] = { '<cmd>Telescope find_files<cr>', 'find file' },
	b = {
		name = 'buffer',
		c = { '<cmd>BufferClose<cr>', 'close' },
		o = { '<cmd>BufferCloseAllButCurrent<cr>', 'close others' },
		f = { '<cmd>silent FormatWrite<cr>', 'format' },
		F = {
			"<cmd>lua require('util').save_without_formatting()<cr>",
			'save without formatting',
		},
		n = { '<cmd>BufferNext<cr>', 'next' },
		p = { '<cmd>BufferPrevious<cr>', 'prev' },
		r = { '<c-w><c-r>', 'swap splits' },
	},
	p = {
		name = 'packer',
		c = { '<cmd>PackerCompile<cr>', 'compile' },
		i = { '<cmd>PackerInstall<cr>', 'install' },
		r = { "<cmd>lua require('util').reload_config()<cr>", 'reload' },
		s = { '<cmd>PackerSync<cr>', 'sync' },
		S = { '<cmd>PackerStatus<cr>', 'status' },
		u = { '<cmd>PackerUpdate<cr>', 'update' },
	},
	h = {
		name = 'git',
		s = 'stage hunk',
		S = 'stage buffer',
		u = 'undo stage hunk',
		U = 'reset buffer index',
		r = 'reset hunk',
		R = 'reset buffer',
		p = 'preview hunk',
		b = 'blame line',
		o = { '<cmd>Telescope git_status<cr>', 'open changed file' },
		B = { '<cmd>Telescope git_branches<cr>', 'checkout branch' },
		c = { '<cmd>Telescope git_commits<cr>', 'checkout commit' },
		C = {
			'<cmd>Telescope git_bcommits<cr>',
			'checkout commit (for current file)',
		},
		g = { '<cmd>LazyGit<cr>', 'lazygit' },
	},
	l = {
		name = 'lsp',
		a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'code action' },
		d = {
			'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>',
			'line diagnostics',
		},
		D = {
			'<cmd>Telescope lsp_document_diagnostics<cr>',
			'document diagnostics',
		},
		e = { '<cmd>lua vim.lsp.buf.references()<cr>', 'references' },
		o = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'declaration' },
		O = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'definition' },
		h = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'hover' },
		w = {
			'<cmd>Telescope lsp_workspace_diagnostics<cr>',
			'workspace diagnostics',
		},
		f = {
			'<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, 1000)<cr>',
			'format',
		},
		i = { '<cmd>LspInfo<cr>', 'info' },
		j = {
			'<cmd>lua vim.lsp.diagnostic.goto_next()<cr>',
			'next diagnostic',
		},
		k = {
			'<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>',
			'prev diagnostic',
		},
		q = { '<cmd>Telescope quickfix<cr>', 'quickfix' },
		r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'rename' },
		s = { '<cmd>Telescope lsp_document_symbols<cr>', 'document symbols' },
		S = {
			'<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
			'workspace symbols',
		},
		t = {
			'<cmd>lua vim.lsp.buf.type_definition()<cr>',
			'type definition',
		},
	},
	s = {
		name = 'search',
		b = { '<cmd>Telescope git_branches<cr>', 'branches' },
		c = { '<cmd>Telescope colorscheme<cr>', 'colorscheme' },
		C = { '<cmd>Telescope commands<cr>', 'commands' },
		f = { '<cmd>Telescope find_files<cr>', 'files' },
		h = { '<cmd>Telescope help_tags<cr>', 'help tags' },
		k = { '<cmd>Telescope keymaps<cr>', 'keymaps' },
		M = { '<cmd>Telescope man_pages<cr>', 'man pages' },
		r = { '<cmd>Telescope oldfiles<cr>', 'recent files' },
		R = { '<cmd>Telescope registers<cr>', 'registers' },
		t = { '<cmd>Telescope live_grep<cr>', 'text' },
	},
	t = {
		name = 'treesitter',
		i = { '<cmd>TSConfigInfo<cr>', 'info' },
		h = { '<cmd>TSBufToggle highlight<cr>', 'toggle highlight' },
		c = {
			'<cmd>TSHighlightCapturesUnderCursor<cr>',
			'highlight active captures',
		},
	},
}

wk.register(mappings, opts)
wk.register(O.leader_keymaps.normal, { prefix = '<leader>', mode = 'n' })
wk.register(O.leader_keymaps.visual, { prefix = '<leader>', mode = 'v' })
