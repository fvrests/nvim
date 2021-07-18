require('nvim-autopairs').setup({
	check_ts = true,
})

if package.loaded['compe'] then
	require('nvim-autopairs.completion.compe').setup({
		map_cr = true, --  map <cr> on insert mode
		map_complete = true, -- it will auto insert `(` after select function or method item
	})
end
