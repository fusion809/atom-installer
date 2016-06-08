#!/bin/bash
. ./lib/build/atom.sh

function opensuse_build {
  # Get dependencies
  sudo zypper in -y nodejs nodejs-devel make gcc gcc-c++ glibc-devel \
    git-core libgnome-keyring-devel rpm-build rpmdevtools
  atom_build
}

export -f opensuse_build
