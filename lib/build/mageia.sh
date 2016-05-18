#!/bin/bash
. ./lib/build/atom.sh
. ./lib/build/node.sh

function mageia_build {
  # Get dependencies
  sudo urpmi git curl libgnome-keyring-devel make gcc gcc-c++
  node_build
  atom_build
}

export -f mageia_build
