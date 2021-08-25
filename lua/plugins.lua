local install_path = vim.fn.stdpath('data')
	.. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
end

-- automatically run :PackerCompile when this file changes
-- vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

require('packer').startup(function(use)
	use('wbthomason/packer.nvim')
	use({ 'nvim-lua/plenary.nvim', module = 'plenary' })
	use({ 'rose-pine/neovim', as = 'rose-pine' })
	use({
		'folke/which-key.nvim',
		opt = true,
		keys = '<space>',
		config = function()
			require('which-key').setup({
				plugins = {
					spelling = {
						enabled = true,
						suggestions = 20,
					},
				},
				presets = {
					operators = false,
				},
			})
		end,
	})
	use({
		'nvim-treesitter/nvim-treesitter',
		opt = true,
		event = 'BufRead',
		run = ':TSUpdate',
		requires = {
			{
				'nvim-treesitter/playground',
				cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' },
			},
			'JoosepAlviste/nvim-ts-context-commentstring',
			'windwp/nvim-ts-autotag',
		},
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = 'maintained',
				ignore_install = { 'haskell' },
				indent = {
					enable = true,
					-- TODO: temporarily disable svelte ts indentation
					-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1368
					disabled = { 'svelte' },
				},
				highlight = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
			})
		end,
	})
	use({
		'romgrk/barbar.nvim',
		config = function()
			vim.g.bufferline = {
				animation = false,
				icon_close_tab = O.icons.close,
				icon_close_tab_modified = O.icons.modified,
				icon_separator_active = '',
				icon_separator_inactive = '',
				icons = false,
			}
		end,
	})
	use({
		'nvim-telescope/telescope.nvim',
		opt = true,
		cmd = 'Telescope',
		module = 'telescope',
		requires = 'nvim-lua/plenary.nvim',
	})
	use({
		'kyazdani42/nvim-tree.lua',
		opt = true,
		cmd = 'NvimTreeToggle',
		config = function()
			vim.g.nvim_tree_auto_close = 1
			vim.g.nvim_tree_disable_netrw = 1
			vim.g.nvim_tree_git_hl = 1
			vim.g.nvim_tree_icons = {
				default = O.icons.file .. ' ',
				symlink = O.icons.symlink .. ' ',
				folder = {
					default = O.icons.folder,
					empty = O.icons.folder,
					empty_open = O.icons.folder_open,
					open = O.icons.folder_open,
					symlink = O.icons.symlink,
				},
			}
			vim.g.nvim_tree_ignore = { '.git' }
			vim.g.nvim_tree_quit_on_open = 1
			vim.g.nvim_tree_show_icons = { folders = 1, files = 1 }
			vim.g.nvim_tree_side = 'right'
			vim.g.nvim_tree_symlink_arrow = O.icons.symlink
		end,
	})
	use({
		'neovim/nvim-lspconfig',
		opt = true,
		event = 'BufReadPre',
		wants = 'lua-dev.nvim',
		requires = 'folke/lua-dev.nvim',
	})
	use({
		'kabouzeid/nvim-lspinstall',
		opt = true,
		module = 'lspinstall',
		after = 'nvim-lspconfig',
		config = function()
			require('lsp')
		end,
	})
	use({
		'jose-elias-alvarez/null-ls.nvim',
		opt = true,
		after = 'nvim-lspconfig',
		requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
		config = function()
			local null_ls = require('null-ls')

			local sources = {
				null_ls.builtins.formatting.elm_format,
				null_ls.builtins.formatting.fish_indent,
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.formatting.shfmt.with({
					filetypes = { 'bash', 'sh', 'zsh' },
				}),
				null_ls.builtins.formatting.stylua,
			}

			null_ls.config({ sources = sources })

			require('lspconfig')['null-ls'].setup({
				on_attach = function(client)
					if
						O.format_on_save
						and client.resolved_capabilities.document_formatting
					then
						vim.cmd(
							'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
						)
					end
				end,
			})
		end,
	})
	use({
		'windwp/nvim-autopairs',
		opt = true,
		module = 'nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end,
	})
	use({
		'L3MON4D3/LuaSnip',
		requires = 'rafamadriz/friendly-snippets',
		config = function()
			require('luasnip').config.set_config({
				history = true,
			})
			require('luasnip.loaders.from_vscode').load()
		end,
	})
	use({
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'saadparwaiz1/cmp_luasnip',
		},
		config = function()
			local cmp = require('cmp')
			local luasnip = require('luasnip')

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				mapping = {
					-- ['<Tab>'] = cmp.mapping(
					-- 	cmp.mapping.select_next_item(),
					-- 	{ 'i', 's' }
					-- ),
					-- ['<S-Tab>'] = cmp.mapping(
					-- 	cmp.mapping.select_prev_item(),
					-- 	{ 'i', 's' }
					-- ),
					['<Tab>'] = function(fallback)
						if vim.fn.pumvisible() == 1 then
							vim.fn.feedkeys(
								vim.api.nvim_replace_termcodes(
									'<C-n>',
									true,
									true,
									true
								),
								'n'
							)
						elseif luasnip.expand_or_jumpable() then
							vim.fn.feedkeys(
								vim.api.nvim_replace_termcodes(
									'<Plug>luasnip-expand-or-jump',
									true,
									true,
									true
								),
								''
							)
						else
							fallback()
						end
					end,
					['<S-Tab>'] = function(fallback)
						if vim.fn.pumvisible() == 1 then
							vim.fn.feedkeys(
								vim.api.nvim_replace_termcodes(
									'<C-p>',
									true,
									true,
									true
								),
								'n'
							)
						elseif luasnip.jumpable(-1) then
							vim.fn.feedkeys(
								vim.api.nvim_replace_termcodes(
									'<Plug>luasnip-jump-prev',
									true,
									true,
									true
								),
								''
							)
						else
							fallback()
						end
					end,
					['<CR>'] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = false,
					}),
				},
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'path' },
					{ name = 'buffer' },
				},
			})

			-- you need setup cmp first put this after cmp.setup()
			require('nvim-autopairs.completion.cmp').setup({
				map_cr = true, --  map <CR> on insert mode
				map_complete = true, -- it will auto insert `(` after select function or method item
			})
		end,
	})
	use({
		'lewis6991/gitsigns.nvim',
		opt = true,
		event = 'BufRead',
		requires = 'nvim-lua/plenary.nvim',
		config = function()
			require('gitsigns').setup()
		end,
	})
	use({
		'norcalli/nvim-colorizer.lua',
		opt = true,
		event = 'BufReadPre',
		config = function()
			require('colorizer').setup({ '*' }, { names = false })
		end,
	})
	use({
		'terrortylor/nvim-comment',
		opt = true,
		event = 'BufReadPre',
		requires = 'JoosepAlviste/nvim-ts-context-commentstring',
		config = function()
			require('nvim_comment').setup({
				hook = function()
					require('ts_context_commentstring.internal').update_commentstring()
				end,
			})
		end,
	})
	use({
		'mvllow/modes.nvim',
		opt = true,
		event = 'BufRead',
		config = function()
			require('modes').setup()
		end,
	})
end)
