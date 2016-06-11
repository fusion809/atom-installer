#!/bin/bash

function atomarch {
  method

  if [[ $preference == "A" ]]; then
    printf "Installing Atom from 64-bit Debian binary release. If you experience any issues please report them to https://aur.archlinux.org/packages/atom-editor-bin.==>\n"
    atomaur bin
  else
    atomaur
  fi
}

export -f atomarch

if `comex atom`; then                       # Check if Atom is already installed

  . ./lib/version.sh
  version

  printf "Atom is already installed"
  INSVER=$(atom --version | grep 'Atom' | sed 's/Atom\s*: //g')

  if [[ $INSVER == $pkgver ]]; then

    printf " and is the latest version available!\n"

  else

    printf " but it is an out-dated version. So a package upgrade will be performed!\n"
    atomarch

  fi

else

  atomarch

fi
