#!/bin/bash

function sabatom {
  method

  if [[ $preference == "A" ]]; then

    printf "Installing Atom with 'sudo equo i app-editors/atom'. ==>\nIf this fails please file a bug report at https://bugs.sabayon.org, as any such error is likely unrelated to this installer.\n"
    sudo equo i app-editors/atom

  else

    sabayon_build

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
    sabatom
  fi

else

  sabatom

fi
