# nvim

A minimal Neovim config

## Install

> Any destructive actions must be confirmed before proceeding

```sh
bash <(curl -s https://raw.githubusercontent.com/mvllow/nvim/main/install.sh)
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
