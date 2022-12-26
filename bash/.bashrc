# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### COLORS ###

CLEAR="\[\033[0m\]"

BLACK='\[\033[00;30m\]'
BLUE='\[\033[00;34m\]'
CYAN='\[\033[00;36m\]'
GREEN='\[\033[00;32m\]'
PURPLE='\[\033[00;35m\]'
RED='\[\033[00;31m\]'
YELLOW='\[\033[00;33m\]'
WHITE='\[\033[00;37m\]'

BRIGH_BLACK='\[\033[01;30m\]'
BRIGHT_BLUE='\[\033[01;34m\]'
BRIGHT_CYAN='\[\033[01;36m\]'
BRIGHT_GREEN='\[\033[01;32m\]'
BRIGHT_PURPLE='\[\033[01;35m\]'
BRIGHT_RED='\[\033[01;31m\]'
BRIGHT_WHITE='\[\033[01;37m\]'
BRIGHT_YELLOW='\[\033[01;33m\]'

BLACK_BG='\[\033[00;40m\]'
BLUE_BG='\[\033[00;44m\]'
CYAN_BG='\[\033[00;46m\]'
GREEN_BG='\[\033[00;42m\]'
PURPLE_BG='\[\033[00;45m\]'
RED_BG='\[\033[00;41m\]'
YELLOW_BG='\[\033[00;43m\]'
WHITE_BG='\[\033[00;47m\]'

BRIGHT_BLACK_BG='\[\033[01;40m\]'
BRIGHT_BLUE_BG='\[\033[01;44m\]'
BRIGHT_CYAN_BG='\[\033[01;46m\]'
BRIGHT_GREEN_BG='\[\033[01;42m\]'
BRIGHT_PURPLE_BG='\[\033[01;45m\]'
BRIGHT_RED_BG='\[\033[01;41m\]'
BRIGHT_WHITE_BG='\[\033[01;47m\]'
BRIGHT_YELLOW_BG='\[\033[01;43m\]'

ENDCOLOR="\e[0m"

### TERMINAL PROMPT ###

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/  \1/'
}

export PS1="$PURPLE\w$GREEN\$(parse_git_branch)$CLEAR\`if [ \$? = 0 ]; then echo ' $PURPLE\n\$ '; else echo '$RED\n\$ '; fi\`$CLEAR"


# UBlack='\033[4;30m'       # Black
# URed='\033[4;31m'         # Red

# export PS1="${GREEN}\w\n\$${CLEAR} "
# export PS1="\033[4;35m\w${CLEAR}${PURPLE}\n\$${CLEAR} "


######

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to history file, don't overwite.
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

### Vars
export CHIME='/usr/share/sounds/freedesktop/stereo/complete.oga'
export BRIGHTNESS='/sys/class/backlight/intel_backlight/brightness'

### Shell vars
TERMINAL=alacritty

### Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

### Scripts (exported functions)
SCRIPTS="~/scripts"

# Remap Caps Lock to Control
setxkbmap -layout us -option ctrl:nocaps

# Add gopls to path (go tooling for lsp mode)
export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"

# Testing fix for desktop apps
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

### Starship prompt ###
# eval "$(starship init bash)"
