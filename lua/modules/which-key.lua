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
	['c'] = { '<cmd>BufferClose<cr>', 'Close buffer' },
	['e'] = { '<cmd>NvimTreeToggle<cr>', 'Explorer' },
	['f'] = { '<cmd>Telescope find_files<cr>', 'Find file' },
	b = {
		name = 'Buffer',
		c = { '<cmd>BufferClose<cr>', 'Close' },
		o = { '<cmd>BufferCloseAllButCurrent<cr>', 'Close others' },
		f = { '<cmd>silent FormatWrite<cr>', 'Format' },
		F = {
			"<cmd>lua require('util').save_without_formatting()<cr>",
			'Save without formatting',
		},
		n = { '<cmd>BufferNext<cr>', 'Next' },
		p = { '<cmd>BufferPrevious<cr>', 'Prev' },
		r = { '<c-w><c-r>', 'Swap splits' },
	},
	p = {
		name = 'Packer',
		c = { '<cmd>PackerCompile<cr>', 'Compile' },
		i = { '<cmd>PackerInstall<cr>', 'Install' },
		r = { "<cmd>lua require('util').reload_config()<cr>", 'Reload' },
		s = { '<cmd>PackerSync<cr>', 'Sync' },
		S = { '<cmd>PackerStatus<cr>', 'Status' },
		u = { '<cmd>PackerUpdate<cr>', 'Update' },
	},
	h = {
		name = 'Git',
		s = 'Stage hunk',
		u = 'Undo stage hunk',
		r = 'Reset hunk',
		R = 'Reset buffer',
		p = 'Preview hunk',
		b = 'Blame line',
		o = { '<cmd>Telescope git_status<cr>', 'Open changed file' },
		B = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
		c = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
		C = {
			'<cmd>Telescope git_bcommits<cr>',
			'Checkout commit (for current file)',
		},
		g = { '<cmd>LazyGit<cr>', 'LazyGit' },
	},
	l = {
		name = 'LSP',
		a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code action' },
		d = {
			'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>',
			'Line diagnostics',
		},
		D = {
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
		f = {
			'<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, 1000)<cr>',
			'Format',
		},
		i = { '<cmd>LspInfo<cr>', 'Info' },
		j = {
			'<cmd>lua vim.lsp.diagnostic.goto_next()<cr>',
			'Next diagnostic',
		},
		k = {
			'<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>',
			'Prev diagnostic',
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

for lhs, rhs in pairs(O.leader_keymaps) do
	if type(rhs) == 'table' then
		for key, value in pairs(rhs) do
			if mappings[lhs] then
				mappings[lhs][key] = value
			else
				mappings[lhs] = rhs
			end
		end
	else
		mappings[lhs] = rhs
	end
end

wk.register(mappings, opts)
