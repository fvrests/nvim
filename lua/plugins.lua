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

local packer = require('packer')
local utils = require('utils')
local config_path = vim.fn.stdpath('config')

packer.init({
	git = {
		clone_timeout = 350,
	},
})

local plugins = {
	'wbthomason/packer.nvim',
	'tjdevries/astronauta.nvim',

	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('modules.treesitter')
		end,
		event = 'BufRead',
		run = 'TSUpdate',
	},

	{
		'JoosepAlviste/nvim-ts-context-commentstring',
		after = 'nvim-treesitter',
	},

	{
		'nvim-treesitter/playground',
		after = 'nvim-treesitter',
		cmd = { 'TSHighlightCapturesUnderCursor', 'TSPlaygroundToggle' },
	},

	{
		'windwp/nvim-ts-autotag',
		after = 'nvim-treesitter',
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
		event = 'BufWinEnter',
	},

	{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		module = 'telescope',
		requires = {
			{ 'nvim-lua/plenary.nvim', module = 'plenary' },
			{ 'nvim-lua/popup.nvim', module = 'popup' },
		},
	},

	{
		'mhartington/formatter.nvim',
		config = function()
			require('modules.formatter')
		end,
		event = 'BufRead',
	},

	{
		'romgrk/barbar.nvim',
		config = function()
			require('modules.barbar')
		end,
		disable = not utils.file_exists(
			config_path .. '/plugin/packer_compiled.lua'
		),
	},

	{
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
			require('modules.tree')
		end,
	},

	{
		'neovim/nvim-lspconfig',
		config = function()
			require('modules.lsp')
		end,
		event = 'BufRead',
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
	},
	{
		'L3MON4D3/LuaSnip',
		config = function()
			require('modules.luasnip')
		end,
		event = 'BufWinEnter',
		requires = {
			{ 'rafamadriz/friendly-snippets', event = 'InsertEnter' },
		},
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
	},

	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('modules.gitsigns')
		end,
		event = 'BufRead',
	},
}

packer.startup(function(use)
	if O.plugins ~= nil then
		for _, ps in ipairs({ plugins, O.plugins }) do
			for _, p in ipairs(ps) do
				use(p)
			end
		end
	end
end)
