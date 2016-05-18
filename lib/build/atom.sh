#!/bin/bash
function atom_build {
  export GHUB=$HOME/GitHub

  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi

  # Set the dest variables
  dest

  # Set the pkgver variable
  version

  # Get the source code
  src_method

  # Compile the source
  src_build

  # Install it
  atom_install
}

export -f atom_build
