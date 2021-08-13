vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_git_hl = true
vim.g.nvim_tree_icons = {
	default = '',
	symlink = '',
	git = {
		deleted = O.icons.none,
		ignored = O.icons.ignored,
		renamed = O.icons.arrow,
		staged = O.icons.check,
		unmerged = O.icons.modified,
		unstaged = O.icons.error,
		untracked = O.icons.warning,
	},
	folder = {
		default = O.icons.folder,
		empty = O.icons.folder,
		empty_open = O.icons.folder_open,
		open = O.icons.folder_open,
		symlink = O.icons.arrow,
	},
	lsp = {
		error = O.icons.error,
		hint = O.icons.hint,
		info = O.icons.info,
		warning = O.icons.warning,
	},
}
vim.g.nvim_tree_ignore = { '.git' }
vim.g.nvim_tree_lsp_diagnostics = false
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_show_icons = {
	git = 0,
	folders = 1,
	files = 0,
	folder_arrows = 0,
}
vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_symlink_arrow = O.icons.arrow

return {
	'kyazdani42/nvim-tree.lua',
	opt = true,
	cmd = 'NvimTreeToggle',
}
