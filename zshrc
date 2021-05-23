export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="amuse"
DISABLE_AUTO_TITLE="true"

plugins=(brew chruby sudo vagrant z git)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh_functions
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.environment

if [[ -f "/usr/local/share/chruby/chruby.sh" ]]; then
    source "/usr/local/share/chruby/chruby.sh"
    source "/usr/local/share/chruby/auto.sh"
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
%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) 💎 $(ruby_prompt_info)  ⏰  %{$fg_bold[red]%}%*%{$reset_color%}
%1{🌸%}  '

export RPROMPT=''

compdef _appcmp app

export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
