#!/bin/bash

function atomin {
  if [[ -n "$1" ]]; then
    cd /tmp/atom-editor-$1
  else
    cd /tmp/atom-editor
  fi
  makepkg -si --noconfirm
  cd .
}

export -f atomin

# Install atom-editor
function atomaur {

  # Export env variables
  export AUR=https://aur.archlinux.org/cgit/aur.git/snapshot/
  export GIT=https://aur.archlinux.org/

  if [[ -n "$1" ]]; then                     # if input provided; allowed input bin, git

    if comex yaourt; then                    # Install with yaourt if possible

      yaourt -S atom-editor-$1 --noconfirm

    elif comex git; then                      # Install with git and makepkg otherwise

      git clone $GIT/atom-editor-$1.git /tmp/atom-editor-$1
      atomin $1

    elif comex curl; then                     # Install with curl and makepkg otherwise

      curl -sL $AUR/atom-editor-$1.tar.gz | tar xz -C /tmp
      atomin $1

    elif comex wget; then                     # Install with wget and makepkg otherwise

      wget -cqO- $AUR/atom-editor-$1.tar.gz | tar xz -C /tmp
      atomin $1

    else                                      # Install curl and install with curl and makepkg otherwise

      sudo pacman -S curl --noconfirm
      curl -sL $AUR/atom-editor-$1.tar.gz | tar xz -C /tmp
      atomin $1

    fi
  else
    if comex yaourt; then                    # Install with yaourt if possible

      yaourt -S atom-editor --noconfirm

    elif comex git; then                      # Install with git and makepkg otherwise

      git clone $GIT/atom-editor.git /tmp/atom-editor
      atomin

    elif comex curl; then                     # Install with curl and makepkg otherwise

      curl -sL $AUR/atom-editor.tar.gz | tar xz -C /tmp
      atomin

    elif comex wget; then                     # Install with wget and makepkg otherwise

      wget -cqO- $AUR/atom-editor.tar.gz | tar xz -C /tmp
      atomin

    else                                      # Install curl and install with curl and makepkg otherwise

      sudo pacman -S curl --noconfirm
      curl -sL $AUR/atom-editor.tar.gz | tar xz -C /tmp
      atomin

    fi
  fi
}

export -f atomaur
