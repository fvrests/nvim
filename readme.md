# nvim

> Kinda minimal neovim config

## Usage

Clone or fork this repo

```sh
git clone https://github.com/mvllow/nvim
```

Bootstrap plugins

```sh
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

## Formatting

We use [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) for formatting. To add more formatters, see their [builtins](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/lua/null-ls/builtins/formatting.lua).

| formatter   | install                |
| ----------- | ---------------------- |
| fish_indent | `brew install fish`    |
| gofmt       | `brew install go`      |
| prettier    | `npm install prettier` |
| shfmt       | `brew install shfmt`   |
| stylua      | `brew install stylua`  |

## Related

- [mvllow/dots](https://github.com/mvllow/dots)
- [Rosé Pine theme](https://github.com/rose-pine/neovim)
