local install_path = vim.fn.stdpath('data')
	.. '/site/pack/packer/start/packer.nvim'

-- Install packer (plugin manager) if not already
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
	vim.api.nvim_command('packadd packer.nvim')
end

-- Auto compile changed plugins
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

local packer = require('packer')

packer.init({
	git = {
		clone_timeout = 350,
	},
})

packer.startup(function(use)
	use('wbthomason/packer.nvim')

	use({
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('modules.treesitter')
		end,
		event = 'BufRead',
		run = 'TSUpdate',
	})

	use({
		'JoosepAlviste/nvim-ts-context-commentstring',
		after = 'nvim-treesitter',
	})

	use({
		'nvim-treesitter/playground',
		after = 'nvim-treesitter',
		cmd = { 'TSHighlightCapturesUnderCursor', 'TSPlaygroundToggle' },
	})

	use({
		'windwp/nvim-ts-autotag',
		after = 'nvim-treesitter',
	})

	use('tjdevries/astronauta.nvim')

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
	})

	use({
		'folke/which-key.nvim',
		config = function()
			require('modules.which-key')
		end,
		keys = '<space>',
	})

	use({
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		module = 'telescope',
		requires = {
			{ 'nvim-lua/plenary.nvim', module = 'plenary' },
			{ 'nvim-lua/popup.nvim', module = 'popup' },
		},
	})

	use({
		'mhartington/formatter.nvim',
		config = function()
			require('modules.formatter')
		end,
		event = 'BufRead',
	})

	use({
		'romgrk/barbar.nvim',
		config = function()
			require('modules.bufferline')
		end,
	})

	use({
		'kyazdani42/nvim-tree.lua',
		cmd = {
			'NvimTreeClipboard',
			'NvimTreeClose',
			'NvimTreeFindFile',
			'NvimTreeOpen',
			'NvimTreeRefresh',
			'NvimTreeToggle',
		},
		config = function()
			require('modules.explorer')
		end,
	})

	use({
		'neovim/nvim-lspconfig',
		config = function()
			require('modules.lsp-config')
		end,
		event = 'BufRead',
	})
	use({
		'kabouzeid/nvim-lspinstall',
		module = 'lspinstall',
	})

	use({
		'hrsh7th/nvim-compe',
		config = function()
			require('modules.completion')
		end,
		event = 'InsertEnter',
		requires = {
			{
				'hrsh7th/vim-vsnip',
				event = 'InsertCharPre',
			},
			{
				'rafamadriz/friendly-snippets',
				event = 'InsertCharPre',
			},
		},
	})

	use({
		'windwp/nvim-autopairs',
		after = 'nvim-compe',
		config = function()
			require('modules.autopairs')
		end,
	})

	use('tpope/vim-commentary')

	use({
		'lewis6991/gitsigns.nvim',
		event = 'BufRead',
		config = function()
			require('gitsigns').setup()
		end,
	})

	use({
		'kdheepak/lazygit.nvim',
		cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitFilter' },
	})
end)
