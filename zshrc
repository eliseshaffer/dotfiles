export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="amuse"
DISABLE_AUTO_TITLE="true"
if [[ $(uname -m) = "x86_64" ]]; then
  export HOMEBREW_DIR="/usr/local"
else
  export HOMEBREW_DIR="/opt/homebrew"
fi

plugins=(brew chruby sudo vagrant z git nvm)
source $HOMEBREW_DIR/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh_functions
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.environment

if [[ -f "${HOMEBREW_DIR}/opt/chruby/share/chruby/chruby.sh" ]]; then
    source "${HOMEBREW_DIR}/opt/chruby/share/chruby/chruby.sh"
    source "$HOMEBREW_DIR/share/chruby/auto.sh"
fi

# Update tab title in iterm to current directory
function precmd {
  # sets the tab title to current dir
  echo -e "\033];${PWD##*/}\007"
}

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh

nvm use

export PROMPT='
%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)  %{$fg_bold[red]%} $(ruby_version)%{$reset_color%}  %{$fg_bold[green]%} $(node --version)%{$reset_color%}  %{$fg_bold[magenta]%} %@%{$reset_color%}
%1{🌸%}  '

export RPROMPT=''

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

ssh-add --apple-use-keychain

[[ -f ~/.overrides ]] && source ~/.overrides
[[ -f ~/.zshrc.private ]] && source ~/.zshrc.private
