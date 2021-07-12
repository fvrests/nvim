vim.api.nvim_set_keymap('n', '<space>', '<nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- clear highlights
vim.api.nvim_set_keymap('n', '<esc>', ':noh<cr>', { noremap = true, silent = true })

-- simplify split movements
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w><c-h>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w><c-j>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w><c-k>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w><c-l>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wf', '<c-w><c-r>', { noremap = true, silent = true })

-- move through wrapped lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

-- toggle word highlight
vim.api.nvim_set_keymap('n', '<leader>h', ':let @/=""<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':set hlsearch!<cr>', { noremap = true, silent = true })

-- reselect after visual indent
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- search visually selected text (consistent `*` behaviour)
vim.api.nvim_set_keymap('n', '*', [[*N]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '*', [[y/\V<c-r>=escape(@",'/\')<cr><cr>N]], { noremap = true, silent = true })

-- bubble lines
vim.api.nvim_set_keymap('x', 'J', ":move '>+1<cr>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'K', ":move '<-2<cr>gv=gv", { noremap = true, silent = true })

-- escape
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true, silent = true })

-- packer
vim.api.nvim_set_keymap('n', '<leader>pi', ':PackerInstall<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pc', ':PackerCompile<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ps', ':PackerSync<cr>', { noremap = true, silent = true })

-- nvim-tree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<cr>', { noremap = true, silent = true })

-- barbar
vim.api.nvim_set_keymap('n', 'L', ':BufferNext<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'H', ':BufferPrevious<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':BufferClose<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bo', ':BufferCloseAllButCurrent<cr>', { noremap = true, silent = true })

-- telescope
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>/', ':Telescope live_grep<cr>', { noremap = true, silent = true })

-- treesitter
vim.api.nvim_set_keymap('n', '<leader>th', ':TSBufToggle highlight<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tc', ':TSHighlightCapturesUnderCursor<cr>', { noremap = true, silent = true })

-- lsp
vim.api.nvim_set_keymap('n', '<leader>ldc', ':lua vim.lsp.buf.declaration()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ldf', ':lua vim.lsp.buf.definition()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>li', ':LspInfo<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	'n',
	'<leader>lk',
	':lua vim.lsp.diagnostic.show_line_diagnostics()<cr>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap('n', '<leader>lf', ':lua vim.lsp.buf.formatting()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ltd', ':lua vim.lsp.buf.type_definition()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lrn', ':lua vim.lsp.buf.rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lca', ':lua vim.lsp.buf.code_action()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lre', ':lua vim.lsp.buf.references()<cr>', { noremap = true, silent = true })

-- nvim-compe
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t('<c-n>')
	elseif vim.fn.call('vsnip#available', { 1 }) == 1 then
		return t('<plug>(vsnip-expand-or-jump)')
	elseif check_back_space() then
		return t('<tab>')
	else
		return vim.fn['compe#complete']()
	end
end

_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t('<c-p>')
	elseif vim.fn.call('vsnip#jumpable', { -1 }) == 1 then
		return t('<plug>(vsnip-jump-prev)')
	else
		return t('<s-tab>')
	end
end

vim.api.nvim_set_keymap('i', '<tab>', 'v:lua.tab_complete()', { silent = true, expr = true })
vim.api.nvim_set_keymap('s', '<tab>', 'v:lua.tab_complete()', { silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<s-tab>', 'v:lua.s_tab_complete()', { silent = true, expr = true })
vim.api.nvim_set_keymap('s', '<s-tab>', 'v:lua.s_tab_complete()', { silent = true, expr = true })
-- vim.api.nvim_set_keymap('i', '<cr>', [[compe#confirm('<cr>')]], { silent = true, expr = true })
require('nvim-autopairs.completion.compe').setup({
	map_cr = true, --  map <cr> on insert mode
	map_complete = true, -- it will auto insert `(` after select function or method item
})
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { silent = true, expr = true })
