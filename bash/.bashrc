# If not running interactively, don't do anything
[[ $- != *i* ]] && return

##################################################
## TERMINAL PROMPT
##################################################
BLACK='\[\033[00;30m\]'
BLUE='\[\033[00;34m\]'
CLEAR="\[\033[0m\]"
CYAN='\[\033[00;36m\]'
GREEN='\[\033[00;32m\]'
PURPLE='\[\033[00;35m\]'
RED='\[\033[00;31m\]'
WHITE='\[\033[00;37m\]'
YELLOW='\[\033[00;33m\]'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/  \1/'
}

export PS1="$PURPLE\$(date +%H:%M) \w$GREEN\$(parse_git_branch)$CLEAR\`if [ \$? = 0 ]; then echo ' $PURPLE\n\$ '; else echo '$RED\n\$ '; fi\`$CLEAR"

##################################################
## Bash History
##################################################
HISTCONTROL="ignoreboth":"erasedups"

# Append to history file, don't overwite.
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

##################################################
## General Settings
##################################################
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

##################################################
## Shell variables
##################################################
export TERMINAL=alacritty
export BRIGHTNESS='/sys/class/backlight/intel_backlight/brightness'
export MAIN_DISPLAY="eDP-1"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
export SCRIPTS="$HOME/scripts"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"



source $SCRIPTS/gpt_files.sh

# for script in ~/scripts/*.sh; do
#   source "$script"
# done

# Other stuff we need in the shell
export FLYCTL_INSTALL="/home/ajpkim/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

##################################################
## Aliases
##################################################
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

##################################################
## Python pyenv
##################################################
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
source /usr/share/nvm/init-nvm.sh

##################################################
## Keyboard remapping
##################################################
# swap ctrl and all caps + toggle between us and es
# keyboards by hitting both ctrl keys
setxkbmap -layout us,es -option "ctrl:nocaps,grp:ctrls_toggle"
