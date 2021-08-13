return {
	'iamcco/markdown-preview.nvim',
	opt = true,
	ft = 'markdown',
	cmd = { 'MarkdownPreview' },
	run = function()
		vim.fn['mkdp#util#install']()
	end,
}
