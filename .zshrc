# Created by newuser for 5.9

export QT_STYLE_OVERRIDE=Adwaita-Dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export GTK_THEME=Adwaita:dark

#source ~/Scripts/my-enviroment.sh

setopt CORRECT
##############################################
#Nvim
alias vimpl='NVIM_APPNAME=nvim-simpl \nvim'
alias nvim='NVIM_APPNAME=nvim-jelo nvim'
#POWER PROFILES DAEMON
##############################################
alias perfor='powerprofilesctl set performance'
alias ballin='powerprofilesctl set balanced'
alias lwbat='powerprofilesctl set power-saver'
alias pp='powerprofilesctl'
##############################################
#AIRPLANE MODE
##############################################
alias airpon='rfkill block all'
alias airpoff='rfkill unblock all'
##############################################
#GUI
##############################################
alias rgbt='/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland'
alias sprbt='exec hyprland'
#a#iiiiilias nome='XDG_SESSION_TYPE=wayland dbus-run-session gnome-session'

#####UPDATE#####
alias upbsh='source ~/.bashrc'
alias upzsh='source ~/.zshrc'

############################################
#COOL SHIT
############################################
alias cht='curl cheat.sh' #use like this: cht/bash or cht/(your topic)
alias wtr='curl wttr.in/mumbai'
alias cat='bat'
alias ff='fastfetch -l "arch2"'
alias pink='ping archlinux.org'
alias btu="bluetui"
alias gtui="gpg-tui"
############################################
alias rb='reboot'
alias byemom='shutdown now'

############################################
alias ls='ls -lah --color=auto'
alias grep='grep --color=auto'

PROMPT='%n %* %~}$ '
