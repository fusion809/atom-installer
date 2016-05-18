#!/bin/bash

function src_method {
  # Get the source code
  printf "How would you like to get the source code? [curl/git/wget/?; default: curl] "
  read SRC_METHOD

  # Test to see what SRC_METHOD is defined as
  if [[ $SRC_METHOD == "?" ]]; then

    printf "curl and wget are the fastest methods and they chew up less bandwidth.\n
    While git uses up more bandwidth but it also makes upgrading the package faster."

  elif [[ $SRC_METHOD == "wget" ]]; then

    if [[ -d $SRC_DEST/atom-$pkgver ]]; then
      rm -rf $SRC_DEST/atom-$pkgver
    fi
    wget -cqO- https://github.com/atom/atom/archive/v$pkgver.tar.gz | tar xz -C $SRC_DEST
    cd $SRC_DEST/atom-$pkgver

  elif [[ $SRC_METHOD == "git" ]]; then
    if ! [[ -d $SRC_DEST/atom ]]; then
      git clone https://github.com/atom/atom $SRC_DEST/atom
    fi
    cd $SRC_DEST/atom
    git fetch -p
    git checkout $(git describe --tags `git rev-list --tags --max-count=1`)

  else

    if [[ -d $SRC_DEST/atom-$pkgver ]]; then
      rm -rf $SRC_DEST/atom-$pkgver
    fi
    curl -sL https://github.com/atom/atom/archive/v$pkgver.tar.gz | tar xz -C $SRC_DEST
    cd $SRC_DEST/atom-$pkgver

  fi
}

export -f src_method