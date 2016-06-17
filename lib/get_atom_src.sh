#!/bin/bash

function get_atom_src {
  # If input is given to this function it is to be the download method: curl/wget/git. If none is provided it will ask the user to set the download method.

  if ! ([[ -f /tmp/atom-v$pkgver.tar.gz ]] || [[ -d $SRC_DEST/atom/.git ]]); then
    if [[ -n "$1" ]]; then

      SRC_METHOD="$1"

    else

      # Get the source code
      printf "How would you like to get the source code? \n[curl/git/wget/?; default: curl]\n"
      read SRC_METHOD

    fi
  fi

  . ./lib/version.sh
  version

  if [[ -f $SRC_DEST/atom/package.json ]]; then
    SRCVER=$(cat $SRC_DEST/atom/package.json | grep 'version' | sed 's/ "version": //g')
  fi

  if ([[ -d $SRC_DEST/atom ]] && [[ $SRCVER == "$pkgver" ]]); then
    printf "It seems you already have the source code for this version of Atom at $SRC_DEST/atom.\nWould you like to delete this source tree and extract/git clone it anew? [y/n]\n"
    read cleanyn
  else
    export cleanyn='y'
  fi

  if [[ $cleanyn == "y" ]]; then
    # Test to see what SRC_METHOD is defined as
    if [[ $SRC_METHOD == "?" ]]; then

      printf "curl and wget are the fastest methods and they chew up less bandwidth.\n
      While git uses up more bandwidth but it also makes upgrading the package faster."

    elif [[ $SRC_METHOD == "wget" ]]; then

      if [[ -d $SRC_DEST/atom-$pkgver ]]; then
        rm -rf $SRC_DEST/atom-$pkgver
      elif [[ -d $SRC_DEST/atom ]]; then
        rm -rf $SRC_DEST/atom
      fi

      if ! [[ -f /tmp/atom-v$pkgver.tar.gz ]]; then
        wget -cO- https://github.com/atom/atom/archive/v$pkgver.tar.gz > /tmp/atom-v$pkgver.tar.gz
      fi
      tar -xzf /tmp/atom-v$pkgver.tar.gz --transform="s/atom-$pkgver/atom/" -C $SRC_DEST

    elif [[ $SRC_METHOD == "git" ]]; then

      printf "Cloning the Atom Git repository. This may take some time, as it is over 250 MB in size.==>\n"
      git clone https://github.com/atom/atom $SRC_DEST/atom

      git -C $SRC_DEST/atom fetch -p
      git -C $SRC_DEST/atom checkout $(git describe --tags `git rev-list --tags --max-count=1`)

    else

      if [[ -d $SRC_DEST/atom-$pkgver ]]; then
        rm -rf $SRC_DEST/atom-$pkgver
      elif [[ -d $SRC_DEST/atom ]]; then
        rm -rf $SRC_DEST/atom
      fi

      if ! [[ -f /tmp/atom-v$pkgver.tar.gz ]]; then
        curl -L https://github.com/atom/atom/archive/v$pkgver.tar.gz > /tmp/atom-v$pkgver.tar.gz
      fi
      tar -xzf /tmp/atom-v$pkgver.tar.gz --transform="s/atom-$pkgver/atom/" -C $SRC_DEST

    fi
  fi

  cd $SRC_DEST/atom

}

export -f get_atom_src
