#!/bin/bash
function atom-build {
  export GHUB=$HOME/GitHub

  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi

  # Set the dest variables
  dest

  # Set the pkgver variable
  version

  # Get the source code
  src-method

  # Compile the source
  src-build

  # Install it
  atom-install
}

export -f atom-build
