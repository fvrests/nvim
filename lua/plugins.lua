local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Install packer (plugin manager) if not already
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.api.nvim_command("packadd packer.nvim")
end
-- Auto compile changed plugins
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

local packer = require("packer")

packer.init({
	git = {
		clone_timeout = 350,
	},
})

packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				ignore_install = { "haskell" },
				highlight = {
					enable = true,
				},
				-- From nvim-ts-context-commentstring
				context_commentstring = {
					enable = true,
				},
			})
		end,
		run = ":TSUpdate",
	})

	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		after = "nvim-treesitter",
	})

	use({
		"nvim-treesitter/playground",
		cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
	})

	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({ check_ts = true })
		end,
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
	})

	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			vim.g.nvim_tree_auto_close = 1
			vim.g.nvim_tree_side = "right"
			vim.g.nvim_tree_ignore = { ".git" }
		end,
	})

	use({
		"romgrk/barbar.nvim",
		-- TODO: This crashes barbar when saving plugins.lua
		config = function()
			vim.g.bufferline = {
				animation = false,
				icon_separator_active = "",
				icon_separator_inactive = "",
				icons = false,
				no_name_title = "[ New buffer ]",
			}
		end,
	})

	use({ "terrortylor/nvim-comment", config = function()
		require("nvim_comment").setup({})
	end })

	use("neovim/nvim-lspconfig")

	use({
		"kabouzeid/nvim-lspinstall",
		requires = "nvim-lspconfig",
	})

	use({
		"hrsh7th/nvim-compe",
		config = function()
			vim.opt.completeopt = "menuone,noselect"

			require("compe").setup({
				enabled = true,
				autocomplete = true,
				debug = false,
				min_length = 1,
				preselect = "enable",
				throttle_time = 80,
				source_timeout = 200,
				resolve_timeout = 800,
				incomplete_delay = 400,
				max_abbr_width = 100,
				max_kind_width = 100,
				max_menu_width = 100,
				documentation = true,

				source = {
					path = true,
					buffer = true,
					calc = true,
					nvim_lsp = true,
					nvim_lua = true,
					tags = true,
					treesitter = true,
				},
			})
		end,
	})

	use({
		"hrsh7th/vim-vsnip",
		after = "nvim-compe",
	})

	use({
		"rafamadriz/friendly-snippets",
		after = "nvim-compe",
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
	})
end)
