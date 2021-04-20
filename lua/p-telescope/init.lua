local set_keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

require'telescope'.setup {
	defaults = {
		-- use ripgrep
		-- show hidden, but not `.git/`
		find_command = {'rg', '--files', '--hidden', '-g', '!.git/'}
	}
}

set_keymap('n', '<leader>f', ':Telescope find_files<cr>', opts)
