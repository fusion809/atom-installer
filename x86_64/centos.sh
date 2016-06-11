#!/bin/bash

function centatom {
  method

  if [[ $preference == "A" ]]; then

    printf "Attempting to download the latest official 64-bit binary RPM package release from https://atom.io/download/rpm to /tmp/atom.x86_64.rpm.==>\n"
    curl -L https://atom.io/download/rpm > /tmp/atom.x86_64.rpm || die "This is odd, apparently cURL is failing to download Atom to /tmp/atom.x86_64.rpm. Guessing either a network issue or permissions issue on /tmp.==>\n"
    printf "Attempting to install this binary with yum.==>\n"
    sudo yum install -y /tmp/atom.x86_64.rpm || die "Installing Atom with yum failed!\n Please file a new issue at https://github.com/fusion809/atom-installer/issues/new reporting this error!\n"

  else

    centos_build

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
    centatom
  fi

else

  centatom

fi
