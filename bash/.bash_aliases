#####################################################################
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
alias gd='git diff'
alias gch='git checkout'
alias gbr='git branch'
alias gp='git push'
alias gp-iv-gh='git push iverson && git push github'
alias gpa='git remote | xargs -L1 git push'  # Push to all remotes
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
alias habits='$SCRIPTS/habits.sh'
alias genreport='$SCRIPTS/gen_report.sh'

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

## NH monitors & Desk
alias mon-nh='xrandr --output DP-1-1 --mode 3840x2160 --left-of eDP-1 --set audio off && feh --bg-scale $HOME/pictures/bg-img/wallpaper.jpg && xrandr --output DP-4 --mode 3840x2160 --left-of DP-1-1 --set audio off --rotate left && feh --bg-scale $HOME/pictures/bg-img/wallpaper.jpg'
alias desk='no-monitors && mon-nh && source ~/.xinitrc'

## Main LG monitor
alias lg-mon='xrandr --output DP-4-1 --mode 3840x2160 --right-of eDP-1 --set audio off && feh --bg-scale $HOME/pictures/bg-img/wallpaper.jpg'

## Portable monitor
alias mon-port-left='xrandr --output DP-1 --auto --output $MAIN_DISPLAY --auto --pos 3840x0'
alias mon-port-left-vert='xrandr --output $MAIN_DISPLAY --auto --pos 3840x0 --output DP-1 --auto --rotate left'
alias mon-port-right='xrandr --output DP-1 --auto --right-of $MAIN_DISPLAY'
alias mon-port-right-vert='xrandr --output DP-1 --auto --right-of $MAIN_DISPLAY --rotate left'

## Luer WeWork setup
alias mon-ww='xrandr --output DP-3 --auto --right-of eDP-1 && xrandr --output DP-1 --auto --right-of DP-3'

## Dad desk (plug main hdmi into laptop)
alias mon-dad='xrandr --output DP-4 --auto --right-of eDP-1 --set audio off && feh --bg-scale $HOME/pictures/bg-img/wallpaper.jpg && xrandr --output DP-1-2 --auto --right-of DP-4 --set audio off && feh --bg-scale $HOME/pictures/bg-img/wallpaper.jpg'

######################################################################
## Scripts
######################################################################
alias fixnames='. $HOME/scripts/clean_filenames.sh'
alias chimes='. ~/scripts/chimes.sh'
alias lines='. ~/scripts/lines.sh'
alias timer='. ~/scripts/timer.sh'
alias stopwatch='. ~/scripts/stopwatch.sh'

## Self processes
alias tt="et ~/work/tracking/data/hours.csv"
alias hs="nmcli device wifi connect iPhone"
