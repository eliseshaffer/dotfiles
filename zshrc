bindkey -e
autoload -U +X compinit && compinit

if [[ $(uname -m) = "x86_64" ]]; then
  export HOMEBREW_DIR="/usr/local"
else
  export HOMEBREW_DIR="/opt/homebrew"
fi

source $HOMEBREW_DIR/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.functions.sh
source $HOME/.aliases
source $HOME/.mise.sh

compdef _appcmp app

eval "$($HOMEBREW_DIR/bin/brew shellenv)"

ssh-add --apple-use-keychain -q

eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/catppuccin-macchiato.toml)"
