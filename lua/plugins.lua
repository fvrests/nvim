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
		'akinsho/nvim-toggleterm.lua',
		config = function()
			require('modules.terminal')
		end,
	})

	use({
		'mhartington/formatter.nvim',
		config = function()
			require('modules.formatter')
		end,
		event = 'BufRead',
	})

	use('tjdevries/astronauta.nvim')

	use({
		'folke/which-key.nvim',
		config = function()
			require('modules.which-key')
		end,
		event = 'BufWinEnter',
	})

	use({
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('modules.treesitter')
		end,
		run = ':TSUpdate',
	})

	use({
		'JoosepAlviste/nvim-ts-context-commentstring',
		after = 'nvim-treesitter',
		event = 'BufRead',
	})

	use({
		'nvim-treesitter/playground',
		cmd = { 'TSHighlightCapturesUnderCursor', 'TSPlaygroundToggle' },
		event = 'BufRead',
	})

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
	})

	use({
		'windwp/nvim-ts-autotag',
		event = 'InsertEnter',
	})

	use({
		'windwp/nvim-autopairs',
		config = function()
			require('modules.autopairs')
		end,
	})

	use({
		'kyazdani42/nvim-tree.lua',
		commit = 'fd7f60e242205ea9efc9649101c81a07d5f458bb',
		config = function()
			require('modules.explorer')
		end,
	})

	use({
		'romgrk/barbar.nvim',
		config = function()
			require('modules.bufferline')
		end,
	})

	use({
		'terrortylor/nvim-comment',
		config = function()
			require('modules.comment')
		end,
		event = 'BufWinEnter',
	})

	use('neovim/nvim-lspconfig')

	use({
		'kabouzeid/nvim-lspinstall',
		requires = 'nvim-lspconfig',
	})

	use({
		'hrsh7th/nvim-compe',
		config = function()
			require('modules.completion')
		end,
	})

	use({
		'hrsh7th/vim-vsnip',
		event = 'InsertEnter',
	})

	use({
		'rafamadriz/friendly-snippets',
		event = 'InsertEnter',
	})

	use({
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' },
	})

	use({
		'lewis6991/gitsigns.nvim',
		config = function()
			require('modules.gitsigns')
		end,
		event = 'BufRead',
	})
end)
