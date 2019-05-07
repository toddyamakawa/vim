#!/usr/bin/env bash
declare -r script=$(readlink -f $BASH_SOURCE)
declare -r script_dir=$(dirname $script)

# Download vim-plug
plug=$script_dir/autoload/plug.vim
if [[ ! -f $plug ]]; then
	echo "Downloading plug.vim..."
	curl \
		-fL \
		-o $plug \
		--create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install plugins
vim +PlugInstall +qall

