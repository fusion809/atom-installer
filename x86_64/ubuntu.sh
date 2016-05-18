#!/bin/bash
method

sudo apt-get install -y curl

if [[ $preference == "A" ]]; then

  curl -sL https://atom.io/download/deb > /tmp/atom-amd64.deb          # Download latest binary
  sudo dpkg -i /tmp/atom-amd64.deb                                     # Install it with dpkg
  sudo apt-get -f install                                              # Install missing dependencies

else

  ubuntu_build

fi
