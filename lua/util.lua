local util = {}

function util.reload_config()
	vim.cmd('source ~/.config/nvim/conf.lua')
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

function util.save_without_formatting()
	-- Temporarily disable format on save
	vim.cmd([[if exists('#autoformat#BufWritePost')
    :autocmd! autoformat
    endif]])

	-- Save file
	vim.cmd(':w')

	-- Re-enable format on save if previously enabled
	if O.editor.format_on_save then
		require('autocommands').define_augroups({
			autoformat = {
				{
					'BufWritePost',
					'*',
					':silent FormatWrite',
				},
			},
		})
	end
end

return util
