#!/bin/sh

# Install vim-plug.
echo "Installing vim-plug."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Open NeoVim and install every Plugin in the list.
if command -v nvim 1>/dev/null; then
    if nvim -v | grep "NVIM v0.5." &>/dev/null; then
        nvim -N -u NONE --noplugin -n -c "set nomore" -S "init.vim" "init.vim" -c "PlugInstall" -c "quit" -c "quit"
        echo "\nPlugins installed. NeoVim ready to use."
    else
        echo "\nPlease install NeoVim version 0.5.0 or above."
    fi
else
    echo "\nNeoVim is not installed. Please install NeoVim version 0.5.0 or above."
fi
