#!/bin/bash

export LD=$(lsb_release -sd | sed 's/"//g')
export ARCH=$(uname -m)
export VER=$(lsb_release -sr)

# Load the test function
source "lib/test.sh"

echo $VER
DISTROS=('Arch'
'CentOS'
'Debian'
'Fedora'
'Gentoo')
for I in "${DISTROS[@]}"
do
  i=$(echo $I | tr '[:upper:]' '[:lower:]') # convert distro string to lowercase
  if [[ $LD == "$I"* ]]; then
    ./$ARCH/${i}.sh
  fi
done
