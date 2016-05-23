#!/bin/bash
source "./lib/build/node.sh"
source "./lib/build/atom.sh"

printf "\n\nGreetings, you seem to be using an operating system that is not officially supported by this installer. Despite this, provided you are using some distribution of Linux this installer can still be used to install Atom from source, provided you have the following packages installed:
* alsa-lib
* gconf
* Git
* GTK+ 2
* GNOME Keyring development headers (usually provided by a package called libgnome-keyring-devel or alike)
* libnotify
* libxtst
* Node.js > 0.12.x
* NPM
* nss
* Python 2.7
This script will test for each of these dependencies and tell you which one you need to install. If a package is installed yet still this script returns a output indicating it is not, you will need to add the package's executable to your PATH.\n"

# File checks
## libgnome-keyring
if ! [[ -f /usr/include/gnome-keyring*/gnome-keyring.h ]]; then
  printf "The development headers for the GNOME Keyring do not seem to be installed.\n"
fi

## alsa-lib
if ! [[ -f /usr/lib/pkgconfig/alsa.pc ]]; then
  printf "alsa-lib does not seem to be installed.\n"
fi

## gtk2
if ! [[ -d /usr/lib/pkgconfig/gtk+-2.0.pc ]]; then
  printf "GTK2 development headers were not detected.\n"
fi

## libxtst
if ! [[ -f /usr/lib/pkgconfig/xtst.pc ]]; then
  printf "libxtst does not seem to be installed.\n"
fi

# executable check
## nss
if ! `comex certutil`; then
  printf "nss does not seem to be installed.\n"
fi

## g++
if ! `comex g++`; then
  printf "C++ support in GCC was not detected. Please install it, or if it is installed, add its executable to your system PATH.\n"
fi

## gcc
if ! `comex gcc`; then
  printf "GCC was not detected. Please install it, or if it is installed add its executable to your system PATH.\n"
fi

## gconf
if ! `comex gconfpkg`; then
  printf "gconf does not seem to be installed.\n"
fi

## git
if ! `comex git`; then
  printf "Git does not appear to be installed.\n"
fi

## make
if ! `comex make`; then
  printf "GNU Make was not detected please install it, or add it to your PATH.\n"
fi

## python2
if `comex python`; then

  if ! `python --version | sed 's/Python //g' | grep "2.7" >/dev/null 2>&1`; then
    if `comex python2`; then
      export PYTHONPATH=/usr/bin/python2
    fi
  fi

elif `comex python2`; then

  export PYTHONPATH=/usr/bin/python2

elif ! `comex python2`; then

  printf "Python 2.7 was not found. Please install it, or if it is already installed add its executable script to your PATH.\n"

fi

printf "Have you installed all the dependencies? [y/n]\n If you answer y, atom_build will be run!\n"
read depsyn

if [[ $depsyn == "y" ]]; then
  atom_build
fi
