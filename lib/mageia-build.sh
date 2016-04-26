#!/bin/bash

function mageia-build {
  # Get dependencies
  sudo urpmi git curl libgnome-keyring-devel make gcc gcc-c++
  . ./lib/atom-build.sh
  . ./lib/node-build.sh
  node-build
  atom-build
}

export -f mageia-build
