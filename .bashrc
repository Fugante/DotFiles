#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# # Haskell Initialization
# [ -f "/home/langtano/.ghcup/env" ] && source "/home/langtano/.ghcup/env" # ghcup-env

# Add pipenv to PATH
PATH=$PATH:/home/langtano/.local/bin

# Python pyenv
export PYENV_ROOT="$HOME/.local/share/pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Start Graphical Interface
if [ $TERM == linux ]
then
    startx
fi

# # Node Version Manager
# export NVM_DIR="$HOME/.local/share/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /usr/share/nvm/init-nvm.sh


# Usefull variables
export FUSERVER=45.33.119.61
