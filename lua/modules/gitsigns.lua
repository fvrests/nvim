return {
	'lewis6991/gitsigns.nvim',
	opt = true,
	event = 'BufReadPre',
	wants = 'plenary.nvim',
	requires = 'nvim-lua/plenary.nvim',
	config = function()
		require('gitsigns').setup()
	end,
}
