#!/bim/env bash
set -euo pipefail 
#this script replaces your dot files with mine, do not run unless you have a backup
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

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



