#!/bin/bash
. ./lib/build/atom.sh
. ./lib/build/node.sh

function mageia-build {
  # Get dependencies
  sudo urpmi git curl libgnome-keyring-devel make gcc gcc-c++
  node-build
  atom-build
}

export -f mageia-build
