#!/bin/bash

# This is a quick install script to install Atom ASAP
export REPO=https://github.com/fusion809/atom-installer
export GHUB=$HOME/GitHub
export GHUBM=$HOME/GitHub/mine

if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

if [[ -d $GHUBM ]]; then
  cd $GHUBM

  if ! [[ -d $GHUBM/atom-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the atom-installer repository locally ==>\n"
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUBM/atom-installer
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUBM
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUBM
    fi
  else
    printf "The atom-installer repository is already locally present! "
    printf "\n"
    printf "Update your local copy? [y/n] "
    read yn
    if [[ $yn == "y" ]]; then
      if which git >/dev/null 2>&1; then
        cd $GHUBM/atom-installer
        git pull origin master
        cd .
      elif which curl >/dev/null 2>&1; then
        rm -rf $GHUBM/atom-installer
        curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUBM
      elif which wget >/dev/null 2>&1; then
        rm -rf $GHUBM/atom-installer
        wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUBM
      fi
    else
      printf "Suit yourself!"
    fi

  fi

  cd $GHUBM/atom-installer
  ./installer.sh
else
  cd $GHUB

  if ! [[ -d $GHUB/atom-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the atom-installer repository locally ==>\n"
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUB/atom-installer
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUB
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUB
    fi
  else
    printf "The atom-installer repository is already locally present! "
    printf "\n"
    printf "Update your local copy? [y/n] "
    read yn
    if [[ $yn == "y" ]]; then
      if which git >/dev/null 2>&1; then
        cd $GHUB/atom-installer
        git pull origin master
        cd .
      elif which curl >/dev/null 2>&1; then
        rm -rf $GHUB/atom-installer
        curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUB
      elif which wget >/dev/null 2>&1; then
        rm -rf $GHUB/atom-installer
        wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUB
      fi
    else
      printf "Suit yourself!"
    fi

  fi

  cd $GHUB/atom-installer
  ./installer.sh
fi
