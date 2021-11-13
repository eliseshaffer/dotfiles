export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="amuse"
DISABLE_AUTO_TITLE="true"

plugins=(brew chruby sudo vagrant z git nvm)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh_functions
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.environment

if [[ -f "/opt/homebrew/opt/chruby/share/chruby/chruby.sh" ]]; then
    source "/opt/homebrew/opt/chruby/share/chruby/chruby.sh"
fi

# Update tab title in iterm to current directory
function precmd {
  # sets the tab title to current dir
  echo -e "\033];${PWD##*/}\007"
}

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh

export PROMPT='
%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)  %{$fg_bold[red]%} $(ruby_prompt_info)%{$reset_color%}  %{$fg_bold[green]%} $(nvm version)%{$reset_color%}  %{$fg_bold[magenta]%} %@%{$reset_color%}
%1{🌸%}  '

export RPROMPT=''

compdef _appcmp app

export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
eval "$(/opt/homebrew/bin/brew shellenv)"
