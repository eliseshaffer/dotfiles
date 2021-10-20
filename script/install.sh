#! /usr/bin/env bash

pushd "$(dirname "$0")/.."
export DOTFILES_ROOT=$(pwd -P)
#set -e

. ./zsh_functions

EXCLUDES="completion|script|brew|README.md"

install_brew () {
  echo 'Installing homebrew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  brew tap Homebrew/bundle
}

install_oh_my_zsh() {
  echo "Installing oh-my-zsh"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_dotfiles () {
  echo 'Linking dotfiles'

  dotfiles=$(find . -maxdepth 1 -name "*" -print | sed "s/.\///" | grep "^\w" |
            grep -E -v $EXCLUDES)

  for src in $dotfiles
  do
    target="$DOTFILES_ROOT/$src"
    dst="$HOME/.$src"
    ln -sFfn "$target" "$dst"
    echo "ln -sFfn $target $dst"
  done
}

configure_control_esc () {
  pushd ~/.hammerspoon/Spoons/ControlEscape.spoon/
  /bin/bash script/setup
  popd
}

install_ruby () {
  ruby-install $(cat ~/.ruby-version)
}

install_brew
pick_brewfile
brew bundle --file "$HOME/Brewfile"

install_oh_my_zsh
install_dotfiles
install_ruby
configure_control_esc

