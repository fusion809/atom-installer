#!/bin/bash

function fedatom {
  method

  if [[ $preference == "A" ]]; then

    curl -sL https://atom.io/download/rpm > /tmp/atom.x86_64.rpm         # Download latest binary
    sudo dnf install -y /tmp/atom.x86_64.rpm                             # Install it with dpkg

  else

    fedora_build

  fi
}

if comex atom; then                       # Check if Atom is already installed

  . ./lib/version.sh
  version

  printf "Atom is already installed"
  INSVER=$(atom --version | grep 'Atom' | sed 's/Atom\s*: //g')

  if [[ $INSVER == $pkgver ]]; then
    printf " and it is the latest available version ($pkgver)!\n Do you want to proceed with the installation anyway? [y/n]\n"
    read proc
    if [[ $proc == "y" ]]; then
      fedatom
    else
      exit
    fi
  else
    printf " but it is an outdated version ($INSVER as opposed to the latest version, $pkgver). So an upgrade of Atom will proceed. ==>\n"
    fedatom
  fi

else

  fedatom

fi
