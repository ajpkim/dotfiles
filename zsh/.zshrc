# If not running interactively, don't do anything
# [[ $- != *I* ]] && return

##################################################
## Aliases
##################################################
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi


export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
