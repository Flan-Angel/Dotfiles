#!/bim/env bash
set -euo pipefail 
#this script replaces your dot files with mine, do not run unless you have a backup
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp $HOME/.config $HOME/CONFIG_BACKUPS

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


#VIMPL
if test -d $HOME/.config/nvim-simpl; then
  if test -e $HOME/.config/nvim-simpl/init.lua; then
    rm $HOME/.config/nvim-simpl/init.lua
    cp $SCRIPT_DIR/simpl.lua $HOME/.config/nvim-simpl/
    mv $HOME/.config/nvim-simpl/simpl.lua $HOME/.config/nvim-simpl/init.lua
  else
    cp $SCRIPT_DIR/simpl.lua $HOME/.config/nvim-simpl/
    mv $HOME/.config/nvim-simpl/simpl.lua $HOME/.config/nvim-simpl/init.lua
  fi
else
  mkdir $HOME/.config/nvim-simpl
  cp $SCRIPT_DIR/simpl.lua $HOME/.config/nvim-simpl/
  mv $HOME/.config/nvim-simpl/simpl.lua $HOME/.config/nvim-simpl/init.lua
fi

#Vimjelo
if test -d $HOME/.config/nvim-jelo; then
  if test -e $HOME/.config/nvim-jelo/init.lua; then
    rm $HOME/.config/nvim-simpl/init.lua
    cp $SCRIPT_DIR/jelo.lua $HOME/.config/nvim-jelo/
    mv $HOME/.config/nvim-jelo/jelo.lua $HOME/.config/nvim-jelo/init.lua
  else
    cp $SCRIPT_DIR/jelo.lua $HOME/.config/nvim-jelo/
    mv $HOME/.config/nvim-jelo/jelo.lua $HOME/.config/nvim-jelo/init.lua
  fi
else
  mkdir $HOME/.config/nvimjelo-
  cp $SCRIPT_DIR/jelo.lua $HOME/.config/nvim-jelo/
  mv $HOME/.config/nvim-jelo/jelo.lua $HOME/.config/nvim-jelo/init.lua
fi



#rest of the files
cp $SCRIPT_DIR/Absinthe.qbtheme $HOME/.config/
cp $SCRIPT_DIR/Allocation.sh $HOME/.config/
cp $SCRIPT_DIR/wallp.jpg $HOME/.config/
cp $SCRIPT_DIR/WALLP.png $HOME/.config/


