local keymap = require('utils').keymap
local opts = { noremap = true, silent = true, expr = true }

require('compe').setup({
	enabled = true,
	autocomplete = true,
	documentation = true,

	source = {
		path = {},
		buffer = {},
		calc = {},
		nvim_lsp = {},
		nvim_lua = {},
		zsh = {},
		treesitter = {},
		spell = {},
		luansip = { priority = 100000 },
	},
})

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
-- - move to prev/next item in completion menuone
-- - jump to prev/next snippet's placeholder
_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t('<C-n>')
	elseif require('luasnip').expand_or_jumpable() then
		return t("<cmd>lua require'luasnip'.jump(1)<Cr>")
	elseif check_back_space() then
		return t('<Tab>')
	else
		return vim.fn['compe#complete']()
	end
end

_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t('<C-p>')
	elseif require('luasnip').jumpable(-1) then
		return t("<cmd>lua require'luasnip'.jump(-1)<CR>")
	else
		return t('<S-Tab>')
	end
end

keymap('i', '<tab>', 'v:lua.tab_complete()', { expr = true })
keymap('s', '<tab>', 'v:lua.tab_complete()', { expr = true })
keymap('i', '<s-tab>', 'v:lua.s_tab_complete()', { expr = true })
keymap('s', '<s-tab>', 'v:lua.s_tab_complete()', { expr = true })

keymap('i', '<c-space>', 'compe#complete()', opts)
keymap('i', '<cr>', "compe#confirm('<cr>')", opts)
keymap('i', '<c-e>', "compe#close('<c-e>')", opts)
keymap('i', '<c-j>', "compe#scroll({ 'delta': -4 })", opts)
keymap('i', '<c-k>', "compe#scroll({ 'delta': +4 })", opts)
