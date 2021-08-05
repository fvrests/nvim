local M = {}

function M.define_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		if definition == nil then
			return
		end

		vim.cmd('augroup ' .. group_name)
		vim.cmd('autocmd!')

		for _, def in pairs(definition) do
			local command = table.concat(
				vim.tbl_flatten({ 'autocmd', def }),
				' '
			)
			vim.cmd(command)
		end

		vim.cmd('augroup END')
	end
end

M.define_augroups({
	_general_settings = {
		{
			'BufEnter',
			'*',
			'setlocal formatoptions-=o',
		},
	},
	_markdown = {
		{ 'FileType', 'markdown', 'setlocal expandtab' },
		{ 'FileType', 'markdown', 'setlocal spell' },
		{ 'FileType', 'markdown', 'setlocal ts=2 sts=2 sw=2' },
		{ 'FileType', 'markdown', 'setlocal wrap' },
	},
	_hot_reload = {
		{
			'BufWritePost',
			'conf.lua',
			'lua require("util").reload_config()',
		},
		{
			'BufWritePost',
			'plugins.lua',
			'PackerCompile',
		},
	},
	_resize_splits = {
		-- Set equal split width on window resize
		{ 'VimResized ', '*', 'tabdo wincmd =' },
	},
})

return M
