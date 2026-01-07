# Created by newuser for 5.9


export EDITOR=/usr/bin/nvim
export VISUAL=$EDITOR
export QT_STYLE_OVERRIDE=Adwaita-Dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export GTK_THEME=Adwaita:dark

#source ~/Scripts/my-enviroment.sh



#bread
autoload -U colors && colors
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
setopt CORRECT



bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
##############################################
#Nvim
alias v='\nvim'
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
alias sprbt='sway'
#a#iiiiilias nome='XDG_SESSION_TYPE=wayland dbus-run-session gnome-session'

#####UPDATE#####
alias upbsh='source ~/.bashrc'
alias upzsh='source ~/.zshrc'

############################################
#COOL SHIT
############################################
alias cht='curl cheat.sh' #use like this: cht/bash or cht/(your topic)
alias wtr='curl wttr.in/banglore'
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

#w3m aliases
alias wk='w3m wikipedia.org'
alias ddg='w3m https://duckduckgo.com'
alias stall='w3m https://stallman.org/'

PROMPT='%n %* %~}$ '
