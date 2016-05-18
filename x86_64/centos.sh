#!/bin/bash
method

if [[ $method == "A" ]]; then

  curl -sL https://atom.io/download/rpm > /tmp/atom.x86_64.rpm         # Download latest binary
  sudo yum install -y /tmp/atom.x86_64.rpm                             # Install it with yum

else

  centos_build

fi
