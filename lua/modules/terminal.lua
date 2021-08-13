return {
	'akinsho/nvim-toggleterm.lua',
	opt = true,
	keys = [[<c-\>]],
	config = function()
		require('toggleterm').setup({
			direction = 'float',
			open_mapping = [[<c-\>]],
			close_on_exit = true,
			float_opts = {
				border = 'curved',
			},
		})
	end,
}
