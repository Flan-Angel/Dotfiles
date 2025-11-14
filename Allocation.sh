#!/bim/env bash
set -euo pipefail 
#this script replaces your dot files with mine, do not run unless you have a backup
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )



#hyprland
if test -d $HOME/.config/hypr; then
  if test -e $HOME/.config/hypr/hyprland.conf; then
    rm $HOME/.config/hypr/hyprland.conf
    cp $SCRIPT_DIR/hyprland.conf $HOME/.config/hypr/
  else
    cp $SCRIPT_DIR/hyprland.conf $HOME/.config/hypr/
  fi
else
  mkdir $HOME/.config/hypr
   cp $SCRIPT_DIR/hyprland.conf $HOME/.config/hypr/
fi


#rofi 
if test -d $HOME/.config/rofi; then
  if test -e $HOME/.config/rofi/config.rasi; then
    rm $HOME/.config/rofi/config.rasi
    cp $SCRIPT_DIR/config.rasi $HOME/.config/rofi/
  else
    cp $SCRIPT_DIR/config.rasi $HOME/.config/rofi/
  fi
else 
  mkdir $HOME/.config/rofi 
  cp $SCRIPT_DIR/config.rasi $HOME/.config/rofi/
fi


#nvim
if test -d $HOME/.config/nvim; then
  if test -e $HOME/.config/nvim/init.lua; then
    rm $HOME/.config/nvim/init.lua
    cp $SCRIPT_DIR/init.lua $HOME/.config/nvim/init.lua 
  else
    cp $SCRIPT_DIR/init.lua $HOME/.config/nvim/init.lua 
  fi
else
  mkdir $HOME/.config/nvim
  cp $SCRIPT_DIR/init.lua $HOME/.config/nvim/init.lua 
fi


#kitty 
if test -d $HOME/.config/kitty; then
  if test -e $HOME/.config/kitty/kitty.conf; then
    rm $HOME/.config/kitty/kitty.conf
    cp $SCRIPT_DIR/kitty.conf $HOME/.config/kitty.conf
  else
    cp $SCRIPT_DIR/kitty.conf $HOME/.config/kitty.conf
  fi
else
  mkdir $HOME/.config/kitty
  cp $SCRIPT_DIR/kitty.conf $HOME/.config/kitty.conf
fi

#rest of the files
cp $SCRIPT_DIR/Absinthe.qbtheme $HOME/.config/
cp $SCRIPT_DIR/Allocation.sh $HOME/.config/
cp $SCRIPT_DIR/wallp.jpg $HOME/.config/
cp $SCRIPT_DIR/WALLP.png $HOME/.config/


