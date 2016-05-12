#!/bin/bash
. ./lib/atom-build.sh

function opensuse-build {
  # Get dependencies
  sudo zypper install -y nodejs nodejs-devel make gcc gcc-c++ glibc-devel \
    git-core libgnome-keyring-devel
  atom-build
}

export -f opensuse-build
