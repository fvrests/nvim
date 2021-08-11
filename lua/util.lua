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
	vim.cmd('PackerCompile')
	vim.cmd('PackerInstall')
end

function util.file_exists(fname)
	local stat = vim.loop.fs_stat(fname)
	return (stat and stat.type) or false
end

function util.disable_built_ins()
	local disabled_built_ins = {
		'2html_plugin',
		'getscript',
		'getscriptPlugin',
		'gzip',
		'logipat',
		'matchit',
		'netrw',
		'netrwFileHandlers',
		'netrwPlugin',
		'netrwSettings',
		'rrhelper',
		'spellfile_plugin',
		'tar',
		'tarPlugin',
		'vimball',
		'vimballPlugin',
		'zip',
		'zipPlugin',
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

util.create_augroups({
	_ = {
		-- stop o/O continuing comments
		{ 'BufEnter', '*', 'setlocal formatoptions-=o' },

		-- use 2 spaces; enable spell; enable wrap
		{ 'FileType', 'markdown', 'setlocal et ts=2 sts=2 sw=2 spell wrap' },

		-- reload (some) stuff when config changes
		{ 'BufWritePost', 'config.lua', 'lua require("util").reload_config()' },

		-- set equal split width on window resize
		{ 'VimResized ', '*', 'tabdo wincmd =' },
	},
})

return util
