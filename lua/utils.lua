local utils = {}

function utils.reload_config()
	vim.cmd('source ~/.config/nvim/conf.lua')
	vim.cmd('source ~/.config/nvim/lua/plugins.lua')
	vim.cmd(':PackerCompile')
	vim.cmd(':PackerInstall')
end

function utils.file_exists(name)
	local f = io.open(name, 'r')

	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

function utils.keymap(mode, lhs, rhs, opts)
	mode = mode or 'n'
	opts = opts or { noremap = true, silent = true }

	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function utils.define_augroups(definitions)
	for group_name, definition in pairs(definitions) do
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

function utils.save_without_formatting()
	-- Temporarily disable format on save
	vim.cmd([[if exists('#autoformat#BufWritePost')
    :autocmd! autoformat
    endif]])

	-- Save file
	vim.cmd(':w')

	-- Re-enable format on save if previously enabled
	if O.editor.format_on_save then
		utils.define_augroups({
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

return utils
