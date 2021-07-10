function NvimTreeOSOpen()
	local lib = require('nvim-tree.lib')
	local node = lib.get_node_at_cursor()
	if node then
		vim.fn.jobstart("open '" .. node.absolute_path .. "' &", { detach = true })
	end
end

vim.g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 0,
	folder_arrows = 0,
}

vim.g.nvim_tree_icons = {
	default = '',
	symlink = '',
	git = {
		-- unstaged = '',
		-- staged = '✓',
		-- unmerged = '',
		-- renamed = '➜',
		-- deleted = ' ',
		-- untracked = '★',
		-- ignored = '',

		-- unstaged = '─',
		-- staged = '✓',
		-- unmerged = '◇',
		-- renamed = '➜',
		-- deleted = ' ',
		-- untracked = '★',
		-- ignored = '◌',

		unstaged = '×',
		-- staged = '',
		-- unmerged = '',
		-- renamed = '',
		-- deleted = '',
		-- untracked = '',
		-- ignored = '',
	},
	folder = {
		-- default = '',
		-- open = '',
		-- empty = '',
		-- empty_open = '',
		-- symlink = '',

		default = '>',
		open = '▼',
		empty = '≥',
		empty_open = '≤',
		symlink = '↔',
	},
	lsp = {
		-- hint = '',
		-- info = '',
		-- warning = '',
		-- error = '',
		hint = '?',
		info = 'i',
		warning = '△',
		error = '×',
	},
}

local tree_cb = require('nvim-tree.config').nvim_tree_callback

vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_bindings = {
	{ key = 'v', cb = tree_cb('vsplit') },
	{ key = 'O', cb = ':lua NvimTreeOSOpen()<cr>' },
}
vim.g.nvim_tree_git_hl = true
vim.g.nvim_tree_ignore = { '.git' }
vim.g.nvim_tree_lsp_diagnostics = true
vim.g.nvim_tree_side = 'right'
