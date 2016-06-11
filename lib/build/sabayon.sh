#!/bin/bash
. ./lib/build/atom.sh

function sabayon_build {
  printf "Running sabayon_build in ./lib/build/sabayon.sh. ==>\n"
  # Get dependencies
  sudo equo i -o --bdeps app-editors/atom || die "Installing Atom's build dependencies with equo failed!\n"
  atom_build
}

export -f sabayon_build
