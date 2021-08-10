local M = {}

local gofmt = {
	function()
		return {
			exe = 'gofmt',
			args = {},
			stdin = true,
		}
	end,
}

local prettier = {
	function()
		return {
			exe = 'prettier',
			args = {
				'--stdin-filepath',
				vim.api.nvim_buf_get_name(0),
				'--plugin-search-dir=.',
			},
			stdin = true,
		}
	end,
}

local rustfmt = {
	function()
		return {
			exe = 'rustfmt',
			args = { '--emit=stdout' },
			stdin = true,
		}
	end,
}

local shfmt = {
	function()
		return {
			exe = 'shfmt',
			args = { '-' },
			stdin = true,
		}
	end,
}

local stylua = {
	function()
		return {
			exe = 'stylua',
			args = { '--search-parent-directories', '-' },
			stdin = true,
		}
	end,
}

function M.enable_autoformat()
	require('util').create_augroups({
		autoformat = {
			-- format on save
			{ 'BufWritePost', '*', ':silent FormatWrite' },
		},
	})
end

function M.disable_autoformat()
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

if O.editor.format_on_save then
	M.enable_autoformat()
else
	M.disable_autoformat()
end

require('formatter').setup({
	logging = false,
	filetype = {
		go = gofmt,

		javascript = prettier,
		javascriptreact = prettier,
		typescript = prettier,
		typescriptreact = prettier,
		html = prettier,
		css = prettier,
		svelte = prettier,
		vue = prettier,
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

return M
