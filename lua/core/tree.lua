vim.g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 0,
	folder_arrows = 0,
}

vim.g.nvim_tree_symlink_arrow = O.editor.icons.symlink

vim.g.nvim_tree_icons = {
	default = '',
	symlink = '',
	git = {
		deleted = O.git.icons.deleted,
		ignored = O.git.icons.ignored,
		renamed = O.git.icons.renamed,
		staged = O.git.icons.stages,
		unmerged = O.git.icons.unmerged,
		unstaged = O.git.icons.unstaged,
		untracked = O.git.icons.untracked,
	},
	folder = {
		default = O.editor.icons.folder,
		empty = O.editor.icons.folder_empty,
		empty_open = O.editor.icons.folder_empty_open,
		open = O.editor.icons.folder_open,
		symlink = O.editor.icons.symlink,
	},
	lsp = {
		error = O.lsp.icons.error,
		hint = O.lsp.icons.hint,
		info = O.lsp.icons.info,
		warning = O.lsp.icons.warning,
	},
}

vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_git_hl = true
vim.g.nvim_tree_ignore = { '.git' }
vim.g.nvim_tree_lsp_diagnostics = false
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_side = 'right'
