# Options
setopt HIST_SAVE_NO_DUPS # No duplicates in zsh history

# Path
path+=('/Users/sqibo/.local/share/bob/nvim-bin')
export PATH

# Keyd keybinds on Linux
# cp /etc/keyd/default.conf $XDG_CONFIG_HOME/keyd/default.conf # save local keyd config to dotfiles repo

# ZSH setup
#compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
source $ZDOTDIR/.zshenv
source $ZDOTDIR/aliases

# bun completions
[ -s "/Users/sqibo/.bun/_bun" ] && source "/Users/sqibo/.bun/_bun"

# NVM completions
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

if [[ $(uname -n) == "Mac" ]]; then
	source $ZDOTDIR/mac.zsh
elif [[ $(uname -n) == "nixos" ]]; then
	source $ZDOTDIR/nixos.zsh
fi

# Start
uwufetch -wr  # display and reads cached info add -i to use images
