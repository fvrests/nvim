#!/usr/bin/env bash

config_repo="https://github.com/mvllow/nvim"
config_path="$HOME/.config/nvim"

nvim_config_path="$HOME/.config/nvim"
nvim_resource_path="$HOME/.local/share/nvim/site/pack/packer"

clear
echo "mvllow/nvim"
echo

if [ -e $nvim_config_path -o -e $nvim_resource_path ]; then
	echo "The following will be deleted:"
	echo
	echo "  $nvim_config_path"
	echo "  $nvim_resource_path"
	echo
	read -r -p "Are you sure? [y/N] " response
	echo
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
	echo "- Getting config"
	git clone "$config_repo" "$config_path"

	if ! [ -e "$config_path/config.lua" ]; then
		echo
		echo "- Found user config"
		cp "$config_path/config.example.lua" "$config_path/config.lua"
	fi

	echo
	echo "- Installing plugin manager"
	git clone https://github.com/wbthomason/packer.nvim \
		~/.local/share/nvim/site/pack/packer/start/packer.nvim

	echo
	echo "- Installing plugins"
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

	echo
	echo "Done"
	echo
else
	echo "Neovim is not installed."
	echo
	exit 2
fi
