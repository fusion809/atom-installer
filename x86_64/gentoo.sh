#!/bin/bash

if comex atom; then                       # Check if Atom is already installed

  . ./lib/version.sh
  version

  printf "Atom is already installed"
  INSVER=$(atom --version | grep 'Atom' | sed 's/Atom\s*: //g')

  if [[ $INSVER == $pkgver ]]; then
    printf " and it is the latest available version ($pkgver)!\n Do you want to proceed with the installation anyway? [y/n]\n"
    read proc
    if [[ $proc == "y" ]]; then
      gentoo_build
    else
      exit
    fi
  else
    printf " but it is an outdated version ($INSVER as opposed to the latest version, $pkgver). So an upgrade of Atom will proceed. ==>\n\n"
    gentoo_build
  fi

else

  gentoo_build

fi
