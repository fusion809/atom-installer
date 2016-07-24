#!/bin/bash

function opatom {
  method

  if [[ $preference == "A" ]]; then

    printf "Attempting to get the latest RPM binary for Atom from https://atom.io/download/rpm. ==>\n"
    curl -L https://atom.io/download/rpm > /tmp/atom.x86_64.rpm          # Download latest binary
    printf "Attempting to install said binary... ==>\n"
    sudo zypper install -y /tmp/atom.x86_64.rpm                          # Install it with dpkg

  else

    printf "Running opensuse_build in ./lib/build/opensuse.sh"
    opensuse_build

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
      opatom
    else
      exit
    fi
  else
    printf " but it is an outdated version ($INSVER as opposed to the latest version, $pkgver). So an upgrade of Atom will proceed. ==>\n"
    opatom
  fi

else

  opatom

fi
