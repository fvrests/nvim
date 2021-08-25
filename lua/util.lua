local util = {}

function util.create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command('augroup ' .. group_name)
		vim.api.nvim_command('autocmd!')

		for _, def in ipairs(definition) do
			local command = table.concat(
				vim.tbl_flatten({ 'autocmd', def }),
				' '
			)
			vim.api.nvim_command(command)
		end

		vim.api.nvim_command('augroup END')
	end
end

function util.file_exists(fname)
	local stat = vim.loop.fs_stat(fname)
	return (stat and stat.type) or false
end

function util.map(mode, lhs, rhs, opts)
	vim.api.nvim_set_keymap(
		mode,
		lhs,
		rhs,
		opts or { noremap = true, silent = true }
	)
end

return util
