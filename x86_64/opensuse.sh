#!/bin/bash

method

if [[ $preference == "A" ]]; then

  curl -sL https://atom.io/download/rpm > /tmp/atom.x86_64.rpm         # Download latest binary
  sudo zypper install -y /tmp/atom.x86_64.rpm                          # Install it with dpkg

else

  opensuse_build

fi
