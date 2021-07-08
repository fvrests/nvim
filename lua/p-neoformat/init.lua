if O.editor.format_on_save then
	require('utils').define_augroups({
		autoformat = {
			{
				'BufWritePre',
				'*',
				[[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
			},
		},
	})
end

vim.g.neoformat_run_all_formatters = 0

vim.g.neoformat_enabled_javascript = { 'prettier' }

if not O.editor.format_on_save then
	vim.cmd([[if exists('#autoformat#BufWritePre')
		:autocmd! autoformat
		endif]])
end
