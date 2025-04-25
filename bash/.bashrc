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
export HISTSIZE=
export HISTFILESIZE=
# Append to history file, don't overwite.
shopt -s histappend
# empty (or negative) = no limit
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

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
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

##################################################
## Keyboard remapping
##################################################
# swap ctrl and all caps + toggle between us and es
# keyboards by hitting both ctrl keys
setxkbmap -layout us,es -option "ctrl:nocaps,grp:ctrls_toggle"

##################################################
## NVM install script additions
##################################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

######################################################################
## Work
######################################################################
if [ -f ~/work/.workrc  ]; then
    . ~/work/.workrc
fi

if [ -f ~/work/hawks/hawks-dev/.hawksrc  ]; then
    . ~/work/hawks/hawks-dev/.hawksrc
fi

######################################################################
## GCP CLI
######################################################################
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ajpkim/google-cloud-sdk/path.bash.inc' ]; then . '/home/ajpkim/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ajpkim/google-cloud-sdk/completion.bash.inc' ]; then . '/home/ajpkim/google-cloud-sdk/completion.bash.inc'; fi

######################################################################
## FZF
######################################################################
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ]  && source /usr/share/fzf/completion.bash
# export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
