#!/bin/bash
. ./lib/build/atom.sh

function sabayon-build {
  # Get dependencies
  sudo equo i -o --bdeps app-editors/atom
  atom-build
}

export -f sabayon-build
