
if [[ $(uname -m) = "x86_64" ]]; then
  export HOMEBREW_DIR="/usr/local"
else
  export HOMEBREW_DIR="/opt/homebrew"
fi
autoload -U +X compinit && compinit

source $HOMEBREW_DIR/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.functions.sh
source $HOME/.aliases

if [[ -f "${HOMEBREW_DIR}/opt/chruby/share/chruby/chruby.sh" ]]; then
    source "${HOMEBREW_DIR}/opt/chruby/share/chruby/chruby.sh"
    source "$HOMEBREW_DIR/share/chruby/auto.sh"
fi

chruby ruby

if [[ -f ".nvmrc" ]]; then 
  nvm use --silent
fi

compdef _appcmp app

export PATH="$HOMEBREW_DIR/opt/postgresql@10/bin:$PATH"

export ANDROID_SDK_ROOT="$HOMEBREW_DIR/share/android-sdk"
export PATH="$HOMEBREW_DIR/opt/libxml2/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_DIR/opt/nvm/nvm.sh" ] && . "$HOMEBREW_DIR/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$HOMEBREW_DIR/opt/nvm/etc/bash_completion.d/nvm" ] && . "$HOMEBREW_DIR/opt/nvm/etc/bash_completion.d/nvm"

eval "$($HOMEBREW_DIR/bin/brew shellenv)"

if [[ $(uname -m) = "x86_64" ]]; then
  export HOMEBREW_DIR="/usr/local"
else
  export HOMEBREW_DIR="/opt/homebrew"
fi

ssh-add --apple-use-keychain -q

[[ -f ~/.overrides ]] && source ~/.overrides

eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/catppuccin-macchiato.toml)"
