#!/bin/bash
. ./lib/build/atom.sh

function opensuse-build {
  # Get dependencies
  sudo zypper in -y nodejs nodejs-devel make gcc gcc-c++ glibc-devel \
    git-core libgnome-keyring-devel
  atom-build
}

export -f opensuse-build
