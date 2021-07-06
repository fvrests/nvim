local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Install packer (plugin manager) if not already
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
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
		'folke/which-key.nvim',
		config = function()
			require('which-key').setup({})
		end,
	})

	use({
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = 'all',
				ignore_install = { 'haskell' },
				highlight = {
					enable = true,
				},
				-- From nvim-ts-context-commentstring
				context_commentstring = {
					enable = true,
				},
			})
		end,
		run = ':TSUpdate',
	})

	use({
		'JoosepAlviste/nvim-ts-context-commentstring',
		after = 'nvim-treesitter',
	})

	use({
		'nvim-treesitter/playground',
		cmd = { 'TSHighlightCapturesUnderCursor', 'TSPlaygroundToggle' },
	})

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
	})

	use({
		'mvllow/peachy-neovim-theme',
		as = 'peachy',
	})

	use({
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup({ check_ts = true })
		end,
	})

	use({
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
	})

	use({
		'kyazdani42/nvim-tree.lua',
		config = function()
			vim.g.nvim_tree_show_icons = {
				git = 1,
				folders = 1,
				files = 0,
				folder_arrows = 0,
			}

			vim.g.nvim_tree_icons = {
				-- default = '',
				-- symlink = '',
				git = {
					unstaged = '',
					staged = 's',
					unmerged = '',
					renamed = 'r',
					deleted = '',
					untracked = 'u',
					ignored = '',
				},
				folder = {
					default = '',
					open = '',
					empty = '',
					empty_open = '',
					symlink = '',
				},
			}

			local tree_cb = require('nvim-tree.config').nvim_tree_callback

			vim.g.nvim_tree_auto_close = 1
			vim.g.nvim_tree_side = 'right'
			vim.g.nvim_tree_ignore = { '.git' }
			vim.g.nvim_tree_bindings = {
				{ key = 'v', cb = tree_cb('vsplit') },
			}
		end,
	})

	use({
		'romgrk/barbar.nvim',
		-- TODO: This crashes barbar when saving plugins.lua
		config = function()
			vim.g.bufferline = {
				animation = false,
				icon_separator_active = '',
				icon_separator_inactive = '',
				icons = false,
				no_name_title = '[ New buffer ]',
			}
		end,
	})

	use({
		'terrortylor/nvim-comment',
		config = function()
			require('nvim_comment').setup({})
		end,
	})

	use('neovim/nvim-lspconfig')

	use({
		'kabouzeid/nvim-lspinstall',
		requires = 'nvim-lspconfig',
	})

	use({
		'hrsh7th/nvim-compe',
		config = function()
			vim.opt.completeopt = 'menuone,noselect'

			require('compe').setup({
				enabled = true,
				autocomplete = true,
				documentation = true,

				source = {
					path = {},
					buffer = {},
					calc = {},
					nvim_lsp = {},
					treesitter = {},
					spell = {},
					vsnip = {},
				},
			})
		end,
	})

	use({
		'hrsh7th/vim-vsnip',
		after = 'nvim-compe',
	})

	use({
		'rafamadriz/friendly-snippets',
		after = 'nvim-compe',
	})

	use({
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' },
	})

	use({
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end,
		requires = { 'nvim-lua/plenary.nvim' },
	})
end)
