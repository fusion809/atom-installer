#!/bin/bash

printf "Do you want to install Atom from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B] "
read preference

if [[ $preference == "A" ]]; then

  curl -sL https://atom.io/download/rpm > /tmp/atom.x86_64.rpm         # Download latest binary
  sudo dnf install -y /tmp/atom.x86_64.rpm                             # Install it with dpkg

elif [[ $preference == "B" ]]; then

  fedora-build

fi
