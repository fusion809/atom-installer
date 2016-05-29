#!/bin/bash
source "./lib/src_prepare.sh"

function default {
  export SRC_DEST=$GHUB

  version

  if [[ -d $SRC_DEST/atom ]]; then
    rm -rf $SRC_DEST/atom
  fi

  get_atom_src curl

  src_prepare custom

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
      sudo apt-get install -y atom*.deb
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
