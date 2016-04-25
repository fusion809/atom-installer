#!/bin/bash
printf "Do you want to install Atom from A) a binary package or would you prefer B) a source install? [A/B] "
read preference

if [[ $preference == "A" ]]; then
  curl -sL https://atom.io/download/rpm > atom.x86_64.rpm
  sudo yum install -y atom.x86_64.rpm
elif [[ $preference == "B" ]]; then
  # Get dependencies
  curl -sL https://rpm.nodesource.com/setup_5.x | sudo bash -
  sudo yum install -y python nodejs-devel npm gcc gcc-c++ make glibc-devel git-core

  # Get the source code
  git clone https://github.com/atom/atom
  cd atom
  git fetch -p
  git checkout $(git describe --tags `git rev-list --tags --max-count=1`)
  script/build

  printf "Do you want to install Atom to a local directory or system-wide? [local/system] "
  read DEST_TYPE
  printf "Where do you want to install Atom to? "
  read DEST

  if [[ $DEST_TYPE == "local" ]]; then
    script/grunt install --channel=stable --install-dir $DEST
  elif [[ $DEST_TYPE == "system" ]]; then
    sudo script/grunt install --channel=stable --install-dir $DEST
  fi
fi
