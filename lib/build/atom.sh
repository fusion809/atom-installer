#!/bin/bash
source "./lib/build/default.sh"
source "./lib/dest.sh"
source "./lib/method.sh"
source "./lib/src_build.sh"
source "./lib/get_atom_src.sh"
source "./lib/src_prepare.sh"
source "./lib/install.sh"
source "./lib/version.sh"
source "./lib/test.sh"

function atom_build {

  printf "Running atom_build in ./lib/build/atom.sh. ==>\n"
  export GHUB=$HOME/GitHub

  if ! [[ -n $INDIR ]]; then
    export RELDIR=$(dirname "$0" | sed 's|.||g')
    if [[ -n $RELDIR ]]; then
      export INDIR="$PWD/$RELDIR"
    else
      export INDIR=$PWD
    fi
  else
    unset INDIR
    export RELDIR=$(dirname "$0" | sed 's|.||g')
    if [[ -n $RELDIR ]]; then
      export INDIR="$PWD/$RELDIR"
    else
      export INDIR=$PWD
    fi
  fi

  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi

  printf "Do you want to just use the default settings (A) or would you rather choose your own settings (B)? \n[Available options: A/B. A is the default.]\n"
  read settings

  if [[ $settings = "B" ]]; then
    # Set the dest variables
    dest

    # Set the pkgver variable
    version

    # Get the source code
    get_atom_src

    # Compile the source
    src_prepare

    src_build

    # Install it
    atom_install

  else

    default

  fi
}

export -f atom_build
