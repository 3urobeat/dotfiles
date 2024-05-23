#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Env vars for theming and stuff
export QT_QPA_PLATFORM="wayland"
export QT_QPA_PLATFORMTHEME="qt6ct"
#export XDG_MENU_PREFIX=arch

# Add some color
PS1="\[\033[1;96m\][\[\033[1;95m\]\u\[\033[1;36m\]@\[\033[1;95m\]\h\[\033[1;96m\\] \[\033[1;36m\]\w\[\033[1;96m\]]\[\033[1;96m\]$\[\033[0m\] "

# Set terminal language to english
LANG=en_US.UTF-8

PATH=~/.console-ninja/.bin:$PATH
