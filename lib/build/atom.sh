#!/bin/bash
function atom-build {
  export GHUB=$HOME/GitHub

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
