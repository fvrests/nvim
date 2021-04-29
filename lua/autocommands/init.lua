function define_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.cmd('augroup ' .. group_name)
        vim.cmd('autocmd!')

        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            vim.cmd(command)
        end

        vim.cmd('augroup END')
    end
end

local auto_formatters = {}
local format = 'lua vim.lsp.buf.formatting_sync(nil, 1000)'

local javascript_format = {'BufWritePre', '*.js', format}
local javascriptreact_format = {'BufWritePre', '*.jsx', format}
local typescript_format = {'BufWritePre', '*.ts', format}
local typescriptreact_format = {'BufWritePre', '*.tsx', format}
local html_format = {'BufWritePre', '*.html', format}
local css_format = {'BufWritePre', '*.css', format}
local json_format = {'BufWritePre', '*.json', format}
local yaml_format = {'BufWritePre', '*.yaml', format}

table.insert(auto_formatters, javascript_format)
table.insert(auto_formatters, javascriptreact_format)
table.insert(auto_formatters, typescript_format)
table.insert(auto_formatters, typescriptreact_format)
table.insert(auto_formatters, html_format)
table.insert(auto_formatters, css_format)
table.insert(auto_formatters, json_format)
table.insert(auto_formatters, yaml_format)

-- TODO: Fix random efm crashes
	-- [ ERROR ] 2021-04-28T23:04:33-0500 ] ...im/HEAD-a6504ec_2/share/nvim/runtime/lua/vim/lsp/rpc.lua:457 ]	"rpc"	"/Users/not/.local/share/nvim/lspinstall/efm/./efm-langserver"	"stderr"	"panic: runtime error: invalid memory address or nil pointer dereference"
	-- [ ERROR ] 2021-04-28T23:04:33-0500 ] ...im/HEAD-a6504ec_2/share/nvim/runtime/lua/vim/lsp/rpc.lua:457 ]	"rpc"	"/Users/not/.local/share/nvim/lspinstall/efm/./efm-langserver"	"stderr"	"\n[signal SIGSEGV: segmentation violation code=0x2 addr=0x20 pc=0x104935874]\n\ngoroutine 19 [running]:\ntime.(*Timer).Stop(...)\n\t"

vim.lsp.set_log_level('debug')

define_augroups({
	_general_settings = {
        {'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'Search\', timeout = 200})'},
        {'BufWinEnter', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
        {'BufRead', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
        {'BufNewFile', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
    },
	_auto_formatters = auto_formatters
})
