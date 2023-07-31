function myreadlink() {
  (
  cd "$(find ~/ -name "$1")"        # or  cd ${1%/*}
  echo "$PWD/$(basename "$1")" # or  echo $PWD/${1##*/}
  )
}

pick_brewfile() {
  echo "Please select the file from the list:"

  files=($(ls brew/*.brewfile))
  files+=('New')

  select file in $files; do
    case $file in
      New)
        create_brewfile
        ;;
      *)
        link_brewfile $file
        ;;
    esac
    break;
  done
}

cd_and_load_node() {
  cd $@
  if [[ -f ".nvmrc" ]]; then 
    nvm use --silent
  fi
}

create_brewfile() {
  echo "TODO: This feature isn't ready yet."
  echo "Please create the file in $DOTFILES/brew/ and run again."
}

link_brewfile() {
  target="$DOTFILES_ROOT/$file"
  dst="$HOME/Brewfile"
  ln -sFfn "$target" "$dst"
}

# Finds first direction matchern pattern in ${1} and cd's to it
function app() {
    APP_DIRECTORY="$(find "${CODE_HOME}" -name "${1}" -maxdepth 2 )"
    APP_DIRECTORY="${APP_DIRECTORY%%$'\n'*}"
    if [[ ${APP_DIRECTORY} == "" ]]; then
        cd_and_load_node "${CODE_HOME}"
    else
        echo "Switching to app directory: ${APP_DIRECTORY}"
        cd_and_load_node "${APP_DIRECTORY}"
    fi
}

function change_profile() {
  echo "Switching Theme to: ${1}"
  echo -e "\033]50;SetProfile=$1\a"
  export ITERM_PROFILE=${1}
}

function toggle_profile() {
  if [[ ${COLOR} == "dark" ]]; then
    change_profile $LIGHT_MODE_ITERM
    export COLOR="light"
  else
    change_profile $DARK_MODE_ITERM
    export COLOR="dark"
  fi
}

function ruby_version() {
  ruby --version | cut -d ' ' -f1-2 | sed 's/\ /-/'
  #echo 'ruby-2.6.7'
}

function draft() {
  git add . && git commit -m "DRAFT: ${1}"
}

function git_clone_and_cd() {
  directory=$( echo "${1}" | awk -F '/' '{print $NF}' )
  directory=${directory%.*}
  git clone "${1}"
  echo "switching to ${directory}"&& cd "$directory"
}

function code_dirs() {
  find "$HOME/code" -type d -maxdepth 2 -mindepth 1 | grep -vE '.*dotfiles.*' | grep -vE '^\\.'
}

function _appcmp() {
  for file in "$(code_dirs)"; do
    compadd $(echo "$file" | cut -d/ -f5-5)
  done
}


function _gitcheckoutbranch(){
  git checkout -b "${1}" && git push -u origin "${1}"
}

