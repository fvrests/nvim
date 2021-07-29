#!/usr/bin/env bash

clear
echo "mvllow/nvim\n"

nvim_config_path=$HOME/.config/nvim
nvim_resource_path=$HOME/.local/share/nvim

maybe_delete_neovim_config() {
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
}

while getopts oh option; do
	case "${option}" in
	o) maybe_delete_neovim_config ;;
	h)
		echo "\033[0;90m  Usage\033[0m\n"
		echo "    $ sh $0 <options>"
		echo
		echo "\033[0;90m  Options\033[0m\n"
		echo "    -o  overwrite existing neovim config"
		echo "    -h  show this message"
		echo
		echo "\033[0;90m  Examples\033[0m\n"
		echo "    $ sh $0"
		echo "    $ sh $0 -o"
		echo
		exit 2
		;;
	esac
done

if [ -e $nvim_config_path -o -e $nvim_resource_path ]; then
	echo "\033[1;33mFound existing neovim config\033[0m"
	echo
	echo "  $nvim_config_path"
	echo "  $nvim_resource_path"
	echo
	exit 2
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

	echo "Generating default files"
	nvim --headless -u NORC +qall

	echo "Installing plugins"
	nvim --headless \
		+'autocmd User PackerComplete sleep 100m | qall' \
		+PackerInstall

	echo "Done"
	echo
else
	echo "Neovim is not installed."
	echo
	exit 2
fi
