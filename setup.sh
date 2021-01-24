#!/usr/bin/env bash
declare -r CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"

if [[ ! -d "$HOME/.vim" ]]; then
	echo "\$> ln -s '$CURRENT_DIR' '$HOME/.vim'"
	ln -s "$CURRENT_DIR" "$HOME/.vim"
fi

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
[[ ! -d $XDG_CONFIG_HOME ]] && mkdir -pv $XDG_CONFIG_HOME

if [[ ! -d "$XDG_CONFIG_HOME/vim" ]]; then
	echo "ln -s '$CURRENT_DIR' '$XDG_CONFIG_HOME/vim'"
	ln -s "$CURRENT_DIR" "$XDG_CONFIG_HOME/vim"

#elif [[ ! -L "$XDG_CONFIG_HOME/vim" ]]; then
	# TODO: Check if symlink is correct
fi

# Download vim-plug
plug="$CURRENT_DIR/autoload/plug.vim"
if [[ ! -f "$plug" ]]; then
	echo "Downloading plug.vim..."
	curl \
		-fL \
		-o "$plug" \
		--create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "\$> which vim"
which vim || exit $?

# Install plugins
vim +PlugInstall +qall

