#!/bin/bash
. ./lib/build/atom.sh
. ./lib/build/node.sh

function mageia_build {
  printf "Running mageia-build in ./lib/build/mageia.sh. ==>\n"

  # Get dependencies
  sudo urpmi git curl libgnome-keyring-devel make gcc gcc-c++
  node_build
  atom_build
}

export -f mageia_build
