#!/bin/bash
method

sudo apt-get install -y curl

if [[ $preference == "A" ]]; then

  curl -sL https://atom.io/download/rpm > /tmp/atom.x86_64.rpm         # Download latest binary
  sudo rpm -i /tmp/atom.x86_64.rpm                                     # Install it with dpkg
  sudo apt-get -f install                                              # Install missing dependencies

else

  pclinuxos_build

fi
