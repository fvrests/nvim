local install_path = vim.fn.stdpath('data')
	.. '/site/pack/packer/start/packer.nvim'

-- Bootstrap packer.nvim
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
end

-- Packer compile on save
vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

local util = require('util')
local config_path = vim.fn.stdpath('config')

local plugins = {
	'wbthomason/packer.nvim',
	{ 'nvim-lua/plenary.nvim', module = 'plenary' },
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('core.treesitter')
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
	{ 'rose-pine/neovim', as = 'rose-pine' },
	{
		'folke/which-key.nvim',
		config = function()
			require('core.which-key')
		end,
		keys = '<space>',
	},
	{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		module = 'telescope',
		requires = 'nvim-lua/plenary.nvim',
		wants = 'plenary.nvim',
	},
	{
		'mhartington/formatter.nvim',
		config = function()
			require('core.formatter')
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
			require('core.barbar')
		end,
		disable = not util.file_exists(
			config_path .. '/plugin/packer_compiled.lua'
		),
	},
	{
		'kyazdani42/nvim-tree.lua',
		cmd = 'NvimTreeToggle',
		config = function()
			require('core.tree')
		end,
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			require('core.lsp')
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
			require('core.compe')
		end,
		event = 'InsertEnter',
		opt = true,
		requires = {
			{
				'L3MON4D3/LuaSnip',
				config = function()
					require('core.luasnip')
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
			require('core.autopairs')
		end,
	},
	{
		'terrortylor/nvim-comment',
		config = function()
			require('core.comment')
		end,
		cmd = 'CommentToggle',
		opt = true,
		keys = { 'gc', 'gcc' },
		requires = 'JoosepAlviste/nvim-ts-context-commentstring',
		wants = 'nvim-ts-context-commentstring',
	},
}

local modules = {}

for name, enabled in pairs(O.modules) do
	if enabled then
		local status_ok, module = pcall(require, 'modules/' .. name)

		if status_ok then
			table.insert(modules, module)
		end
	end
end

require('packer').startup(function(use)
	if O.plugins ~= nil then
		for _, ps in ipairs({ plugins, modules, O.plugins }) do
			for _, p in ipairs(ps) do
				use(p)
			end
		end
	end
end)
