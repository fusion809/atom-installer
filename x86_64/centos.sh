#!/bin/bash
printf "Do you want to install Atom from A) a Debian binary (faster) or would you prefer B) a source install (slower, but more reliable)? [A/B; default is B] "
read preference

if [[ $preference == "A" ]]; then

  curl -sL https://atom.io/download/rpm > /tmp/atom.x86_64.rpm         # Download latest binary
  sudo yum install -y /tmp/atom.x86_64.rpm                             # Install it with yum

else

  centos_build

fi
