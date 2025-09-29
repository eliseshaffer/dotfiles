bindkey -e
autoload -U +X compinit && compinit

source $HOME/.functions.sh
source $HOME/.aliases
source $HOME/.mise.sh

compdef _appcmp app

eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/catppuccin-macchiato.toml)"
