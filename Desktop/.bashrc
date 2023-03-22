#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."


# add some color :D
PS1="\[\033[1;96m\][\[\033[1;95m\]\u\[\033[1;36m\]@\[\033[1;95m\]\h\[\033[1;96m\\] \[\033[1;36m\]\w\[\033[1;96m\]]\[\033[1;96m\]$\[\033[0m\] "
