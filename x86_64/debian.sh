#!/bin/bash
printf "Do you want to install Atom from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B] "
read preference

sudo apt-get install -y curl

if [[ $preference == "A" ]]; then

  curl -sL https://atom.io/download/deb > /tmp/atom-amd64.deb          # Download latest binary
  sudo dpkg -i /tmp/atom-amd64.deb                                     # Install it with dpkg
  sudo apt-get -f install                                              # Install missing dependencies

elif [[ $preference == "B" ]]; then

  debian-build

fi
