#!/bin/bash
. ./lib/build/atom.sh

function opensuse_build {
  printf "Running opensuse_build in ./lib/build/opensuse.sh. ==>\n"
  
  # Get dependencies
  sudo zypper in -y nodejs nodejs-devel make gcc gcc-c++ glibc-devel \
    git-core libgnome-keyring-devel rpm-build rpmdevtools
  atom_build
}

export -f opensuse_build
