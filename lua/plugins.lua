local install_path = vim.fn.stdpath('data')
	.. '/site/pack/packer/start/packer.nvim'

-- Install packer.nvim
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
end

local plugins = {
	'wbthomason/packer.nvim',
	{ 'nvim-lua/plenary.nvim', module = 'plenary' },
	{
		'nvim-treesitter/nvim-treesitter',
		opt = true,
		event = 'BufRead',
		requires = {
			{
				'nvim-treesitter/playground',
				cmd = 'TSHighlightCapturesUnderCursor',
			},
			'JoosepAlviste/nvim-ts-context-commentstring',
			'windwp/nvim-ts-autotag',
		},
		config = function()
			require('core.treesitter')
		end,
		run = ':TSUpdate',
	},
	{ 'rose-pine/neovim', as = 'rose-pine' },
	{
		'folke/which-key.nvim',
		keys = '<space>',
		config = function()
			require('core.which-key')
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		module = 'telescope',
		wants = 'plenary.nvim',
		requires = 'nvim-lua/plenary.nvim',
	},
	{
		'mhartington/formatter.nvim',
		cmd = { 'Format', 'FormatWrite' },
		event = 'BufRead',
		config = function()
			require('core/formatter')
		end,
	},
	{
		'editorconfig/editorconfig-vim',
		event = 'BufRead',
	},
	{
		'neovim/nvim-lspconfig',
		opt = true,
		event = 'BufReadPre',
		wants = 'lua-dev.nvim',
		requires = 'folke/lua-dev.nvim',
		config = function()
			require('core.lsp')
		end,
	},
	{
		'kabouzeid/nvim-lspinstall',
		module = 'lspinstall',
	},
	{
		'hrsh7th/nvim-compe',
		opt = true,
		event = 'InsertEnter',
		wants = 'LuaSnip',
		requires = {
			{
				'L3MON4D3/LuaSnip',
				wants = 'friendly-snippets',
				config = function()
					require('core.luasnip')
				end,
			},
			'rafamadriz/friendly-snippets',
		},
		config = function()
			require('core.compe')
		end,
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
		opt = true,
		cmd = 'CommentToggle',
		keys = { 'gc', 'gcc' },
		wants = 'nvim-ts-context-commentstring',
		requires = 'JoosepAlviste/nvim-ts-context-commentstring',
		config = function()
			require('core.comment')
		end,
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
