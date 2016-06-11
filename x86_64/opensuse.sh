#!/bin/bash

method

if [[ $preference == "A" ]]; then

  printf "Attempting to get the latest RPM binary for Atom from https://atom.io/download/rpm. ==>\n"
  curl -L https://atom.io/download/rpm > /tmp/atom.x86_64.rpm          # Download latest binary
  sudo zypper install -y /tmp/atom.x86_64.rpm                          # Install it with dpkg

else

  opensuse_build

fi
