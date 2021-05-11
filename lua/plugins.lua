local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Install packer (plugin manager) if not already
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
	vim.api.nvim_command('packadd packer.nvim')
end

-- Auto compile changed plugins
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

return require('packer').startup(function(use)
	-- plugin manager
	use('wbthomason/packer.nvim')

	-- zen
	use('junegunn/goyo.vim')

	-- bufferline
	use('romgrk/barbar.nvim')

	-- file explorer
	use('kyazdani42/nvim-tree.lua')

	-- fuzzy finder
	use({
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
	})

	-- treesitter
	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use('windwp/nvim-ts-autotag')
	use('JoosepAlviste/nvim-ts-context-commentstring')

	-- comments
	use('terrortylor/nvim-comment')

	-- theming
	use('rktjmp/lush.nvim')

	-- lsp / completions
	use('neovim/nvim-lspconfig')
	use('kabouzeid/nvim-lspinstall')
	use('hrsh7th/nvim-compe')
	use('hrsh7th/vim-vsnip')
	use('rafamadriz/friendly-snippets')

	-- markdown preview
	use({ 'iamcco/markdown-preview.nvim', ft = { 'markdown' }, run = 'cd app && npm install' })
end)
