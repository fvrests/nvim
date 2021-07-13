require('nvim-autopairs').setup({
	check_ts = true,
})

if package.loaded['compe'] then
	require('nvim-autopairs.completion.compe').setup({
		map_cr = true, --  map <cr> on insert mode
		map_complete = true, -- it will auto insert `(` after select function or method item
	})
end

-- TODO: Where do we want ts plugin config?
-- 1. Keep ts plugin config with main treesitter file (current solution)
-- 2. Move ts plugin config to respective files
-- require('nvim-treesitter.configs').setup({
-- 	autopairs = {
-- 		enable = true,
-- 	},
-- })
