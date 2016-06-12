#!/bin/bash
source "./lib/src_prepare.sh"

function default {
  printf "Running default in ./lib/build/default.sh. ==>\n"

  export SRC_DEST=$GHUB

  version

  get_atom_src curl

  src_prepare

  src_build

  if `comex dnf`; then

    script/grunt mkrpm
    sudo dnf install -y out/rpm/atom*.rpm

  elif `comex yum`; then

    script/grunt mkrpm
    sudo yum install -y out/rpm/atom*.rpm

  elif `comex zypper`; then

    script/grunt mkrpm
    sudo zypper in -y out/rpm/atom*.rpm

  elif `comex apt-get`; then

    if `comex dpkg`; then
      script/grunt mkdeb
      cd out
      ARCH=$(uname -m)
      if [[ $ARCH == "x86_64" ]]; then
        sudo dpkg -i atom-${pkgver}-amd64.deb && sudo apt-get -f install
      else
        sudo dpkg -i atom-${pkgver}-i386.deb && sudo apt-get -f install
      fi
      cd -
    elif `comex rpm`; then
      script/grunt mkrpm
      sudo rpm -i out/rpm/atom*.rpm
      sudo apt-get -f install
    fi

  else

    script/grunt install --install-dir $HOME/.local

  fi
}

export -f default
