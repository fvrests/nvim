local install_path = vim.fn.stdpath('data')
	.. '/site/pack/packer/start/packer.nvim'

-- bootstrap packer.nvim
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
end

local util = require('util')
local config_path = vim.fn.stdpath('config')

local plugins = {
	'wbthomason/packer.nvim',
	{ 'nvim-lua/plenary.nvim', module = 'plenary' },
	{ 'nvim-lua/popup.nvim', module = 'popup' },

	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('modules.treesitter')
		end,
		event = 'BufRead',
		run = ':TSUpdate',
		opt = true,
		requires = {
			{
				'nvim-treesitter/playground',
				cmd = 'TSHighlightCapturesUnderCursor',
			},
			'JoosepAlviste/nvim-ts-context-commentstring',
			'windwp/nvim-ts-autotag',
		},
	},

	{
		'rose-pine/neovim',
		as = 'rose-pine',
	},

	{
		'folke/which-key.nvim',
		config = function()
			require('modules.which-key')
		end,
		keys = '<space>',
	},

	{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		module = 'telescope',
		requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' },
		wants = { 'plenary.nvim', 'popup.nvim' },
	},

	{
		'mhartington/formatter.nvim',
		config = function()
			require('modules.formatter')
		end,
		event = 'BufRead',
	},

	{
		'editorconfig/editorconfig-vim',
		event = 'BufRead',
	},

	{
		'romgrk/barbar.nvim',
		config = function()
			require('modules.barbar')
		end,
		disable = not util.file_exists(
			config_path .. '/plugin/packer_compiled.lua'
		),
	},

	{
		'kyazdani42/nvim-tree.lua',
		cmd = 'NvimTreeToggle',
		config = function()
			require('modules.tree')
		end,
	},

	{
		'neovim/nvim-lspconfig',
		config = function()
			require('modules.lsp')
		end,
		event = 'BufReadPre',
		opt = true,
		requires = 'folke/lua-dev.nvim',
		wants = 'lua-dev.nvim',
	},
	{
		'kabouzeid/nvim-lspinstall',
		module = 'lspinstall',
	},

	{
		'hrsh7th/nvim-compe',
		config = function()
			require('modules.compe')
		end,
		event = 'InsertEnter',
		opt = true,
		requires = {
			{
				'L3MON4D3/LuaSnip',
				config = function()
					require('modules.luasnip')
				end,
				wants = 'friendly-snippets',
			},
			'rafamadriz/friendly-snippets',
		},
		wants = 'LuaSnip',
	},

	{
		'windwp/nvim-autopairs',
		after = 'nvim-compe',
		config = function()
			require('modules.autopairs')
		end,
	},

	{
		'terrortylor/nvim-comment',
		config = function()
			require('modules.comment')
		end,
		cmd = 'CommentToggle',
		opt = true,
		keys = { 'gc', 'gcc' },
		requires = 'JoosepAlviste/nvim-ts-context-commentstring',
		wants = 'nvim-ts-context-commentstring',
	},

	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('modules.gitsigns')
		end,
		event = 'BufReadPre',
		requires = 'nvim-lua/plenary.nvim',
		wants = 'plenary.nvim',
	},
}

require('packer').startup(function(use)
	if O.plugins ~= nil then
		for _, ps in ipairs({ plugins, O.plugins }) do
			for _, p in ipairs(ps) do
				use(p)
			end
		end
	end
end)
