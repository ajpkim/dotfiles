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
alias gp-iv-gh='git push iverson && git push github'
alias gpa='git remote | xargs -L1 git push'  # Push to all remotes
alias gl='git log'
alias gl1='git log --oneline'

######################################################################
## Utilities
######################################################################
alias xcc='xclip -selection clipboard'
alias pyve='python3 -m venv venv && source venv/bin/activate'
alias ve='source venv/bin/activate'

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
alias ff='firefox'
alias py='python3'
alias ipy='ipython'
alias jp='jupyter-notebook'