O.editor.colorscheme = 'rose-pine'
vim.g.rose_pine_variant = 'rose-pine'
vim.g.rose_pine_enable_italics = false
vim.g.rose_pine_disable_background = false
O.editor.cursorline = true
O.editor.format_on_save = true
O.editor.indent_guides = false
O.editor.line_numbers = true
O.editor.tab_size = 4
O.editor.wrap_lines = false

O.lsp.on_hover.line_diagnostics = true
O.lsp.on_hover.signature_help = true
O.lsp.servers = {
	'lua',
	'typescript',
	'html',
	'svelte',
	'css',
	'tailwindcss',
	'json',
	'rust',
}
O.lsp.signs = true
O.lsp.underline = true
O.lsp.update_in_insert = false
O.lsp.virtual_text = false

O.statusline.enabled = true
O.statusline.lhs = '%f'
O.statusline.rhs = '%l:%c'

O.treesitter.ensure_installed = 'maintained'
O.treesitter.ignore_install = { 'haskell' }
