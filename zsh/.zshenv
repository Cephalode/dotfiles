# RUN THE FOLLOWING TO MAKE ZSH FILES OBTAINABLE BY ZSH
# sudo ./zshsetup.sh

# XDG Directories
if [[ -z "$XDG_DATA_HOME" ]]
then
        export XDG_DATA_HOME="$HOME/.local/share"
fi
if [[ -z "$XDG_CACHE_HOME" ]]
then
        export XDG_CACHE_HOME="$HOME/.cache"
fi
if [[ -z "$XDG_STATE_HOME" ]]
then
        export XDG_STATE_HOME="$HOME/.local/state"
fi

# XDG Ninja
# export XN_PROGRAMS_DIR=$(which xdg-ninja):$XDG_CONFIG_HOME/xdg-ninja

# Default editor for CLI applications (sometimes applications open nano or something similar by default)
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"

# zsh history file
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export HISTSIZE=9999999999
export SAVEHIST=$HISTSIZE

# Programming
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
export NVM_DIR="$XDG_DATA_HOME"/nvm
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node_repl_history
export BUN_INSTALL="$HOME/.bun" 
export PATH="$BUN_INSTALL/bin:$PATH" 
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
