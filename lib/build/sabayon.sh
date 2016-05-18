#!/bin/bash
. ./lib/build/atom.sh

function sabayon_build {
  # Get dependencies
  sudo equo i -o --bdeps app-editors/atom
  atom_build
}

export -f sabayon_build
