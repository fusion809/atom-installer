#!/bin/bash

# This is a quick install script to install Atom ASAP
export REPO=https://github.com/fusion809/atom-installer
export GHUB=$HOME/GitHub
export GHUBM=$HOME/GitHub/mine

if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

###########################################################################################################################################
# Get the atom-installer repo if not present and update it, if not.
if [[ -d $GHUBM ]]; then
  cd $GHUBM

  if ! [[ -d $GHUBM/atom-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the atom-installer repository locally. ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUBM/atom-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUBM
    fi
  else
    printf "Updating your local copy of atom-installer. ==>\n"
    ## git
    if [[ -d $GHUBM/atom-installer/.git ]]; then
      cd $GHUBM/atom-installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUBM/atom-installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUBM/atom-installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUBM
    fi

  fi

  cd $GHUBM/atom-installer
  ./installer.sh

else
  cd $GHUB

  if ! [[ -d $GHUB/atom-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the atom-installer repository locally. ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUB/atom-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUB
    fi
  else
    printf "Updating your local copy of atom-installer. ==>\n"

    ## git
    if [[ -d $GHUB/atom-installer/.git ]]; then
      cd $GHUB/atom-installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUB/atom-installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUB/atom-installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUB
    fi
  fi

  cd $GHUB/atom-installer
  ./installer.sh
fi
