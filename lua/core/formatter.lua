local M = {}

local function make_formatter(name, args)
	return {
		function()
			return {
				exe = name,
				args = args or {},
				stdin = true,
			}
		end,
	}
end

local gofmt = make_formatter('gofmt')
local prettier = make_formatter(
	'prettier',
	{ '--stdin-filepath', vim.api.nvim_buf_get_name(0), '--plugin-search-dir=.' }
)
local rustfmt = make_formatter('rustfmt', { '--emit=stdout' })
local shfmt = make_formatter('shfmt', { '-' })
local stylua = make_formatter('stylua', { '--search-parent-directories', '-' })

require('formatter').setup({
	logging = false,
	filetype = {
		go = gofmt,

		javascript = prettier,
		javascriptreact = prettier,
		typescript = prettier,
		typescriptreact = prettier,
		vue = prettier,
		svelte = prettier,
		css = prettier,
		scss = prettier,
		html = prettier,
		json = prettier,
		yaml = prettier,
		markdown = prettier,
		ruby = prettier,

		rust = rustfmt,

		bash = shfmt,
		sh = shfmt,
		zsh = shfmt,

		lua = stylua,
	},
})

function M.enable_autoformat()
	require('util').create_augroups({
		autoformat = {
			-- Format on save
			{ 'BufWritePost', '*', ':silent FormatWrite' },
		},
	})
end

function M.disable_autoformat()
	-- Remove format on save autocmd
	vim.cmd(
		[[if exists('#autoformat#BufWritePost') :autocmd! autoformat endif]]
	)
end

function M.save_without_formatting()
	-- temporarily disable format on save
	M.disable_autoformat()

	-- save file
	vim.cmd(':w')

	-- re-enable format on save if previously enabled
	M.enable_autoformat()
end

if O.format_on_save then
	M.enable_autoformat()
else
	M.disable_autoformat()
end

return M
