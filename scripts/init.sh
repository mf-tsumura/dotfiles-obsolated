#!/bin/bash

# when any command returns non-0, exit this script
set -e

die() {
  echo "$@" >&2
  exit 1
}

mkdir_p() {
  local target
  target=$1
  if [[ ! -d $target ]]; then
    mkdir -p "$target"
  fi
}

symlink() {
  local entity link
  entity=$1
  link=$2

  if [[ -L $link ]]; then
    unlink "$link"
    ln -s "$entity" "$link"
  elif [[ -e $link ]]; then
    die "A file already exists at $link"
  else
    local parent
    parent=$(dirname "$link")
    if [[ ! -d "$parent" ]]; then
      mkdir_p "$parent"
    fi
    ln -s "$entity" "$link"
  fi
}

link () {
  local dotfiles root
  dotfiles="$HOME/dotfiles"
  root="$HOME"
  symlink "$dotfiles/$1" "$root/$1"
}

dir () {
  mkdir_p "$HOME/$1"
}

# Don't suffix slash after directory name
link ".config/git/config"
link ".config/zsh" # directory
link ".tmux.conf"
link ".vimrc"
link ".vim/ftplugin" # directory
link ".zshenv"

unset -f die mkdir_p symlink link dir
