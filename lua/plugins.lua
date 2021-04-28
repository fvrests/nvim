local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Install packer (plugin manager) if not already
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.api.nvim_command 'packadd packer.nvim'
end

-- Auto compile changed plugins
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(
	function(use)
		use 'wbthomason/packer.nvim'
		use 'romgrk/barbar.nvim'
		use {'iamcco/markdown-preview.nvim', ft = {'markdown'}, run = 'cd app && npm install'}
		use 'arcticicestudio/nord-vim'
		use {
			'nvim-telescope/telescope.nvim',
			requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}
		}
		use 'kyazdani42/nvim-web-devicons'
		use 'kyazdani42/nvim-tree.lua'
		use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
		use 'rktjmp/lush.nvim'
		use 'neovim/nvim-lspconfig'
		use 'kabouzeid/nvim-lspinstall'
		use 'glepnir/lspsaga.nvim'
		use 'hrsh7th/nvim-compe'
		use 'hrsh7th/vim-vsnip'
		use 'terrortylor/nvim-comment'
		use {'prettier/vim-prettier', run = 'npm install'}
		use 'famiu/feline.nvim'
	end
)
