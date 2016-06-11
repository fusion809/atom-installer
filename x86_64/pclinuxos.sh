#!/bin/bash

function pcatom {

  method

  sudo apt-get install -y curl

  if [[ $preference == "A" ]]; then

    printf "Downloading latest RPM binary from https://atom.io/download/rpm. ==>\n"
    curl -L https://atom.io/download/rpm > /tmp/atom.x86_64.rpm          # Download latest binary
    printf "Attempting to install Atom with 'sudo rpm -i /tmp/atom.x86_64.rpm'. ==>\n"
    sudo rpm -i /tmp/atom.x86_64.rpm                                     # Install it with dpkg
    printf "Attempting to install any missing dependencies with 'sudo apt-get -f install'. ==>\n"
    sudo apt-get -f install                                              # Install missing dependencies

  else

    pclinuxos_build

  fi
}

if comex atom; then                       # Check if Atom is already installed

  . ./lib/version.sh
  version

  printf "Atom is already installed"
  INSVER=$(atom --version | grep 'Atom' | sed 's/Atom\s*: //g')

  if [[ $INSVER == $pkgver ]]; then
    printf " and it is the latest available version ($pkgver)!\n"
    exit
  else
    printf " but it is an outdated version ($INSVER as opposed to the latest version, $pkgver). So an upgrade of Atom will proceed. ==>\n"
    pcatom
  fi

else

  pcatom

fi
