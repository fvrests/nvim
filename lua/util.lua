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

function util.reload_config()
	vim.cmd('source ~/.config/nvim/config.lua')
	vim.cmd('source ~/.config/nvim/lua/plugins.lua')
	vim.cmd(':PackerCompile')
	vim.cmd(':PackerInstall')
end

function util.file_exists(fname)
	local stat = vim.loop.fs_stat(fname)
	return (stat and stat.type) or false
end

function util.disable_built_ins()
	local disabled_built_ins = {
		'netrw',
		'netrwPlugin',
		'netrwSettings',
		'netrwFileHandlers',
		'gzip',
		'zip',
		'zipPlugin',
		'tar',
		'tarPlugin',
		'getscript',
		'getscriptPlugin',
		'vimball',
		'vimballPlugin',
		'2html_plugin',
		'logipat',
		'rrhelper',
		'spellfile_plugin',
		'matchit',
	}

	for _, plugin in pairs(disabled_built_ins) do
		vim.g['loaded_' .. plugin] = 1
	end
end

function util.keymap(mode, lhs, rhs, opts)
	mode = mode or 'n'
	opts = opts or { noremap = true, silent = true }

	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return util
