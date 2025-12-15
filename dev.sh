#!/usr/bin/env bash
set -euo pipefail


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


#hyprland
cp $HOME/.config/hypr/hyprland.conf $SCRIPT_DIR/hyprland.conf
cp $HOME/.config/hypr/hyprland.conf $SCRIPT_DIR/hypridle.conf


cp $HOME/.config/rofi/config.rasi $SCRIPT_DIR/config.rasi


cp $HOME/.config/kitty/kitty.conf $SCRIPT_DIR/kitty.conf


cp $HOME/.config/nvim-simpl/init.lua $SCRIPT_DIR/simpl.lua
cp $HOME/.config/nvim-jelo/init.lua $SCRIPT_DIR/init.lua


cp $HOME/.zshrc $SCRIPT_DIR/.zshrc

cp $HOME/.vimrc $SCRIPT_DIR/.vimrc


