#!/usr/bin/env bash

nvim_config_path="$HOME/.config/nvim"
nvim_resource_path="$HOME/.local/share/nvim/site/pack/packer"

clear
echo "mvllow/nvim\n"

if [ -e $nvim_config_path -o -e $nvim_resource_path ]; then
	echo "\033[1;31mThe following will be deleted:\033[0m"
	echo
	echo "  $nvim_config_path"
	echo "  $nvim_resource_path"
	echo
	read -r -p "Are you sure? [y/N] " response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
		rm -rf "$nvim_config_path"
		rm -rf "$nvim_resource_path"
	else
		echo "Nothing was changed."
		echo
		exit 2
	fi
fi

if [ $(which nvim) ]; then
	echo "Getting config"
	git clone https://github.com/mvllow/nvim \
		~/.config/nvim

	cp ~/.config/nvim/conf.example.lua \
		~/.config/nvim/conf.lua

	echo "Installing plugin manager"
	git clone https://github.com/wbthomason/packer.nvim \
		~/.local/share/nvim/site/pack/packer/start/packer.nvim

	echo "Installing plugins"
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

	echo "Done"
	echo
else
	echo "Neovim is not installed."
	echo
	exit 2
fi
