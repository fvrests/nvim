local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Install packer (plugin manager) if not already
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
	vim.api.nvim_command('packadd packer.nvim')
end

-- Auto compile changed plugins
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

return require('packer').startup(function(use)
	use('wbthomason/packer.nvim')
	use('romgrk/barbar.nvim')
	use('kyazdani42/nvim-tree.lua')
	use({
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
	})
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = 'all',
				ignore_install = { 'haskell' },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	})
	-- Playground
	-- We mainly use this for :TSHighlightCapturesUnderCursor
	use('nvim-treesitter/playground')
	use({ 'terrortylor/nvim-comment', config = function()
		require('nvim_comment').setup({})
	end })
	use({ 'windwp/nvim-autopairs', config = function()
		require('nvim-autopairs').setup()
	end })
	use({ 'rose-pine/neovim', as = 'rose-pine' })
	use('neovim/nvim-lspconfig')
	use('kabouzeid/nvim-lspinstall')
	use('hrsh7th/nvim-compe')
	use('hrsh7th/vim-vsnip')
	use('rafamadriz/friendly-snippets')
	use({ 'iamcco/markdown-preview.nvim', ft = { 'markdown' }, run = 'cd app && npm install' })
end)
