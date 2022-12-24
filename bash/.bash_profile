#
# ~/.bash_profile
#

setxkbmap -layout us -option ctrl:nocaps

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="emacsclient -nw"
