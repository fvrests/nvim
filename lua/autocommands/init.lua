local function define_augroups(definitions)
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

local auto_formatters = {}
local format_cmd = 'lua vim.lsp.buf.formatting_sync(nil, 1000)'

local extensions = {
	'*.cjs',
	'*.js',
	'*.jsx',
	'*.ts',
	'*.tsx',
	'*.vue',
	'*.svelte',
	'*.html',
	'*.css',
	'*.json',
	'*.yaml',
	'*.md',
	'*.lua',
}

for _, value in pairs(extensions) do
	table.insert(auto_formatters, { 'BufWritePre', value, format_cmd })
end

define_augroups({
	-- _general_settings = {
	-- 	{ 'BufWinEnter', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' },
	-- 	{ 'BufRead', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' },
	-- 	{ 'BufNewFile', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' },
	-- },
	-- TODO: We should check if the formatter, eg. prettier, exists
	-- If not, there is a large delay before saving
	_auto_formatters = auto_formatters,
})
