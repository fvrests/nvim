# nvim

A minimal Neovim config

## Usage

```sh
mv ~/.config/nvim ~/.config/nvim.old
git clone https://github.com/mvllow/nvim ~/.config/nvim
```

### Lsp

To automatically install a set of language servers, update the user config:

```lua
O.lsp.servers = { 'lua', 'typescript' }
```

Install individual language servers via `:LspInstall <server>`.

### Formatters

Install your preferred formatters. By default, we support:

- `npm install prettier`
- rustfmt via [rustup](https://rustup.rs)
- `brew install shfmt`
- `cargo install stylua`

Enable format on save:

```lua
O.editor.format_on_save = true
```

## Related

- [mvllow/dots](https://github.com/mvllow/dots)
- [Rosé Pine theme](https://github.com/rose-pine/neovim)
