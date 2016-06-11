#!/bin/bash

# 64-bit RPM binary can be used to install Atom on Mageia, but it requires one to
# uninstall the core program, apm, as it conflicts with Atom's /usr/bin/apm executable

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
    mageia_build
  fi

else

  mageia_build

fi
