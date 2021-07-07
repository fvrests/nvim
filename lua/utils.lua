local utils = {}

function utils.define_augroups(definitions)
	-- Create autocommand groups based on the passed definitions
	--
	-- The key will be the name of the group, and each definition
	-- within the group should have:
	--    1. Trigger
	--    2. Pattern
	--    3. Text
	-- just like how they would normally be defined from Vim itself
	for group_name, definition in pairs(definitions) do
		vim.cmd('augroup ' .. group_name)
		vim.cmd('autocmd!')

		for _, def in pairs(definition) do
			local command = table.concat(vim.tbl_flatten({ 'autocmd', def }), ' ')
			vim.cmd(command)
		end

		vim.cmd('augroup END')
	end
end

utils.define_augroups({
	_general_settings = {
		{
			'BufWinEnter',
			'*',
			'setlocal formatoptions-=c formatoptions-=r formatoptions-=o',
		},
		{
			'BufRead',
			'*',
			'setlocal formatoptions-=c formatoptions-=r formatoptions-=o',
		},
		{
			'BufNewFile',
			'*',
			'setlocal formatoptions-=c formatoptions-=r formatoptions-=o',
		},
	},
	_auto_resize = {
		-- will cause split windows to be resized evenly if main window is resized
		{ 'VimResized ', '*', 'wincmd =' },
	},
})

return utils
