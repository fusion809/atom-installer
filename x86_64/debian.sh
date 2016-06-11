#!/bin/bash
function debatom {
  method

  sudo apt-get install -y curl

  if [[ $preference == "A" ]]; then

    printf "Downloading the latest Debian binary for Atom from https://atom.io/download/deb to /tmp/atom-amd64.deb. ==>\n"
    curl -L https://atom.io/download/deb > /tmp/atom-amd64.deb             # Download latest binary
    printf "Running 'sudo dpkg -i /tmp/atom-amd64.deb' to install Atom. ==>\n"
    sudo dpkg -i /tmp/atom-amd64.deb                                       # Install it with dpkg

    if `comex apt-fast`; then

      printf "Running 'sudo apt-get -f install' to install missing dependencies. ==>\n"
      sudo apt-fast -f install || die "It appears, 'sudo apt-fast -f install' has failed, which likely indicates an issue with your Debian system. ==>\n"

    else

      printf "Running 'sudo apt-fast -f install' to install missing dependencies. ==>\n"
      sudo apt-get -f install || die "It appears, 'sudo apt-get -f install' has failed, which likely indicates an issue with your Debian system. ==>\n"

    fi

  else

    debian_build

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
    debatom
  fi

else

  debatom

fi
