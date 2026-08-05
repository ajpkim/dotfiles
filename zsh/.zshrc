# Stop here for non-interactive shells
[[ -o interactive ]] || return

##################################################
# Prompt
##################################################

autoload -Uz vcs_info
autoload -Uz colors
colors

setopt PROMPT_SUBST

# Show the current Git branch in green
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{green}(%b)%f'

# Refresh Git information before each prompt
precmd() {
  vcs_info
}

PROMPT='%F{13}%D{%H:%M}%f %F{14}%~%f${vcs_info_msg_0_}%(?.. %F{9}[exit:%?]%f)
%# '

##################################################
# Scripts
##################################################
export SCRIPTS="$HOME/scripts"
source $SCRIPTS/gpt_files.sh

##################################################
# ls colors
##################################################

# Enable colored output
export CLICOLOR=1

# Make directories bright cyan instead of dark blue
export LSCOLORS='Gxfxcxdxbxegedabagacad'

##################################################
# Aliases
##################################################

if [[ -f "$HOME/.zsh_aliases" ]]; then
  source "$HOME/.zsh_aliases"
fi

##################################################
# pyenv
##################################################

export PYENV_ROOT="$HOME/.pyenv"

[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
fi

##################################################
# go
##################################################

[[ -d "$HOME/go/bin" ]] && export PATH="$PATH:$HOME/go/bin"
