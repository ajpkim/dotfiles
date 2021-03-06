## Common use
alias org='cd ~/org'

## ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Dotfile management
alias dotfiles='/usr/bin/git --git-dir=/home/ajpkim/.dotfiles --work-tree=$HOME'

### System info
alias bat='cat /sys/class/power_supply/BAT0/capacity'

### Utilities
alias chime='paplay $CHIME'  # defined in .bashrc
alias logout='pkill -KILL -u ajpkim'

### Tools
alias xcc='xclip -selection clipboard'
alias ss='flameshot gui'
alias ve='source venv/bin/activate'

### Applications
alias ff='firefox'
alias e='emacsclient --create-frame'
alias et='emacsclient -nw'
alias lynx='lynx -accept_all_cookies'
alias py='python3'

alias acer-right='xrandr --output DP-1 --mode 1920x1080 --right-of eDP-1'
alias acer-left='xrandr --output DP-1 --mode 1920x1080 --left-of eDP-1'

### Scripts
alias off-monitors='. ~/scripts/turn-off-monitors.sh'
alias on-monitors='. ~/scripts/turn-on-monitors.sh'
