local keymap = require('utils').keymap

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
		luansip = true,
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
		return t('<c-n>')
	elseif require('luasnip').expand_or_jumpable() then
		return t("<cmd>lua require'luasnip'.jump(1)<cr>")
	elseif check_back_space() then
		return t('<tab>')
	else
		return vim.fn['compe#complete']()
	end
end

_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t('<c-p>')
	elseif require('luasnip').jumpable(-1) then
		return t("<cmd>lua require'luasnip'.jump(-1)<cr>")
	else
		return t('<s-tab>')
	end
end

local opts_e = { expr = true }

keymap('i', '<tab>', 'v:lua.tab_complete()', opts_e)
keymap('s', '<tab>', 'v:lua.tab_complete()', opts_e)
keymap('i', '<s-tab>', 'v:lua.s_tab_complete()', opts_e)
keymap('s', '<s-tab>', 'v:lua.s_tab_complete()', opts_e)

local opts_ns = { noremap = true, silent = true }

keymap('i', '<c-space>', 'compe#complete()', opts_ns)
keymap('i', '<cr>', "compe#confirm('<cr>')", opts_ns)
keymap('i', '<c-e>', "compe#close('<c-e>')", opts_ns)
keymap('i', '<c-j>', "compe#scroll({ 'delta': -4 })", opts_ns)
keymap('i', '<c-k>', "compe#scroll({ 'delta': +4 })", opts_ns)
