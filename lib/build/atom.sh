#!/bin/bash
source "./lib/build/default.sh"
source "./lib/dest.sh"
source "./lib/method.sh"
source "./lib/src_build.sh"
source "./lib/src_method.sh"
source "./lib/install.sh"
source "./lib/version.sh"
source "./lib/test.sh"

function atom_build {
  export GHUB=$HOME/GitHub

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
    printf "Do you want to build Atom with my preferences applied? [y/n; default: y] "
    read ynp

    if [[ $ynp == "n" ]]; then
      src_build
    else
      src_build custom
    fi

    # Install it
    atom_install

  else

    default

  fi
}

export -f atom_build
