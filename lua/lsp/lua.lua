local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
else
		print("Unsupported system for sumneko")
end

-- macOS arm64 requires building the server
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)

-- $ cd ~/.config/nvim
-- $ git clone https://github.com/sumneko/lua-language-server
-- $ cd lua-language-server
-- $ git submodule update --init --recursive
-- $ cd 3rd/luamake
-- $ compile/install.sh
-- $ cd ../..
-- $ ./3rd/luamake/luamake rebuild

USER = vim.fn.expand('$USER')
local sumneko_root_path = '/Users/' .. USER .. '/.config/nvim/lua-language-server'
local sumneko_binary = '/Users/' .. USER .. '/.config/nvim/lua-language-server/bin/macOS/lua-language-server'

return {
	cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
