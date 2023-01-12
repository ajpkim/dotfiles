######################################################################
## ls aliases
######################################################################

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

######################################################################
## git aliases
######################################################################

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gch='git checkout'
alias gbr='git branch'
alias gp='git push'
alias gp-ak-gh='git push ak-git && git push github'
alias gl='git log'
alias gl1='git log --oneline'

######################################################################
## Utilities
######################################################################

alias bt='bluetoothctl'
alias xcc='xclip -selection clipboard'
alias pyve='python3 -m venv venv && source venv/bin/activate'
alias ve='source venv/bin/activate'
alias chime='paplay $CHIME'  # defined in .bashrc
alias logout='pkill -KILL -u $USER'

######################################################################
## Emacs
######################################################################

alias e='emacsclient --create-frame'
alias et='emacsclient -nw'
alias ke='emacsclient -e "(kill-emacs)"'
alias se='emacs --daemon'
# Remove emacs backups
alias de='find . -name "*~" -type f -delete'

######################################################################
## Applications
######################################################################

alias ss='flameshot gui'
alias ff='firefox'
alias py='python3'
alias ipy='ipython'
alias jp='jupyter-notebook'
alias bespoke='~/builds/BespokeSynth/ignore/build/Source/BespokeSynth_artefacts/Release/BespokeSynth'

######################################################################
## Displays
######################################################################

## Base scripts for common cases
alias no-monitors='. ~/scripts/turn-off-monitors.sh'
alias home-monitors='. ~/scripts/home-monitors.sh'

## Portable monitor
alias mon-port-left='xrandr --output DP1 --auto --scale 2x2 --output $MAIN_DISPLAY --auto --pos 3840x0'
alias mon-port-left-vert='xrandr --output $MAIN_DISPLAY --auto --pos 3840x0 --output HDMI1 --auto --scale 2x2 --rotate left'
alias mon-port-right='xrandr --output DP1 --auto --scale 2x2 --right-of $MAIN_DISPLAY'
alias mon-port-right-vert='xrandr --output DP1 --auto --scale 2x2 --right-of $MAIN_DISPLAY --rotate left'

######################################################################
## Scripts
######################################################################

alias chimes='. ~/scripts/chimes.sh'
alias lines='. ~/scripts/lines.sh'
alias timer='. ~/scripts/timer.sh'
alias stopwatch='. ~/scripts/stopwatch.sh'

## Self processes
alias tt=". ~/scripts/track-time.sh"
alias hs="nmcli device wifi connect iPhone"
