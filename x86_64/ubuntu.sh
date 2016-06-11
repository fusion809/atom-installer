#!/bin/bash
method

sudo apt-get install -y curl

if [[ $preference == "A" ]]; then

  curl -L https://atom.io/download/deb > /tmp/atom-amd64.deb             # Download latest binary
  sudo dpkg -i /tmp/atom-amd64.deb                                       # Install it with dpkg
  if `comex apt-fast`; then
    sudo apt-fast -f install
  else
    sudo apt-get -f install                                              # Install missing dependencies
  fi

else

  ubuntu_build

fi
