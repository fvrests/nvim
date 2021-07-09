local prettier = {
	function()
		return {
			exe = 'prettier',
			args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
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

require('formatter').setup({
	logging = false,
	filetype = {
		javascript = prettier,
		javascriptreact = prettier,
		typescript = prettier,
		typescriptreact = prettier,
		html = prettier,
		css = prettier,
		svelte = prettier,
		vue = prettier,
		json = prettier,
		markdown = prettier,

		rust = rustfmt,

		bash = shfmt,
		sh = shfmt,
		zsh = shfmt,

		lua = stylua,
	},
})

if O.editor.format_on_save then
	require('utils').define_augroups({
		autoformat = {
			{
				'BufWritePre',
				'*.js,*.jsx,*.ts,*.tsx,*.html,*.css,*.svelte,*.vue,*.json,*.md,*.rs,*.lua,*.sh,*.zsh*',
				'FormatWrite',
			},
		},
	})
end

if not O.editor.format_on_save then
	vim.cmd([[if exists('#autoformat#BufWritePre')
		:autocmd! autoformat
		endif]])
end
