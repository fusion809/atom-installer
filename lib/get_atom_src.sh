#!/bin/bash

function get_atom_src {
  # If input is given to this function it is to be the download method: curl/wget/git. If none is provided it will ask the user to set the download method.

  if [[ -n "$1" ]]; then

    SRC_METHOD="$1"

  else

    # Get the source code
    printf "How would you like to get the source code? \n[curl/git/wget/?; default: curl]\n"
    read SRC_METHOD

  fi

  # Test to see what SRC_METHOD is defined as
  if [[ $SRC_METHOD == "?" ]]; then

    printf "curl and wget are the fastest methods and they chew up less bandwidth.\n
    While git uses up more bandwidth but it also makes upgrading the package faster."

  elif [[ $SRC_METHOD == "wget" ]]; then

    if [[ -d $SRC_DEST/atom-$pkgver ]]; then
      rm -rf $SRC_DEST/atom-$pkgver
    fi

    wget -cO- https://github.com/atom/atom/archive/v$pkgver.tar.gz | tar xz --transform="s/atom-$pkgver/atom/" -C $SRC_DEST

  cd $SRC_DEST/atom

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

    curl -L https://github.com/atom/atom/archive/v$pkgver.tar.gz | tar xz --transform="s/atom-$pkgver/atom/" -C $SRC_DEST

    cd $SRC_DEST/atom

  fi

}

export -f get_atom_src