#!/bin/bash
export REPO=https://github.com/fusion809/atom-installer
export GHUB=$HOME/GitHub

if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

cd $GHUB

if ! [[ -d $GHUB/atom-installer ]]; then
  printf "Getting the atom-installer repository locally ==>"
  if which git >/dev/null 2>&1; then
    git clone $REPO $GHUB/atom-installer
  elif which curl >/dev/null 2>&1; then
    curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUB
  elif which wget >/dev/null 2>&1; then
    wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/atom-installer-master/atom-installer/ -C $GHUB
  fi
else
  printf "The atom-installer repository is already locally present!"
  printf "Update your local copy? [y/n]"
  read yn
  if [[ $yn == "y" ]]; then
    if which git >/dev/null 2>&1; then
      cd $GHUB/atom-installer
      git pull origin master
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
