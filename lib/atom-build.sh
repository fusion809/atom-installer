function atom-build {
  export GHUB=$HOME/GitHub

  # Get the source code
  printf "How would you like to get the source code? [curl/git/wget/?] "
  read SRC_METHOD

  printf "Where do you want to store the source code? [Leavy empty for $GHUB] "
  read SRC_DEST

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$GHUB
  fi

  printf "Do you want to install Atom locally or system-wide? [local/system] "
  read DEST_TYPE

  printf "Where do you want to install Atom? [Leave empty for ./install (local) and /usr (system)] "
  read INST_DEST

  if ! [[ -n $INST_DEST ]]; then
    if [[ $DEST_TYPE == "local" ]]; then
      INST_DEST=install
    else
      INST_DEST=/usr
    fi
  fi
  if ! [[ -d /tmp/atom-editor ]]; then
    git clone https://aur.archlinux.org/atom-editor.git /tmp/atom-editor
  else
    cd /tmp/atom-editor
    git pull origin master
  fi
  ver=$(sed -n 's/pkgver=//p' /tmp/atom-editor/PKGBUILD)

  if [[ $SRC_METHOD == "?" ]]; then

    printf "curl and wget are the fastest methods and they chew up less bandwidth.\n
    While git uses up more bandwidth but it also makes upgrading the package faster."

  elif [[ $SRC_METHOD == "curl" ]]; then

    if [[ -d $SRC_DEST/atom-$ver ]]; then
      rm -rf $SRC_DEST/atom-$ver
    fi
    curl -sL https://github.com/atom/atom/archive/v$ver.tar.gz | tar xz -C $SRC_DEST
    cd $SRC_DEST/atom-$ver

  elif [[ $SRC_METHOD == "wget" ]]; then

    if ! [[ -d $SRC_DEST/atom-$ver ]]; then
      rm -rf $SRC_DEST/atom-$ver
    fi
    wget -cqO- https://github.com/atom/atom/archive/v$ver.tar.gz | tar xz -C $SRC_DEST
    cd $SRC_DEST/atom-$ver

  elif [[ $SRC_METHOD == "git" ]]; then
    if ! [[ -d $SRC_DEST/atom ]]; then
      git clone https://github.com/atom/atom $SRC_DEST/atom
    fi
    cd $SRC_DEST/atom
    git fetch -p
    git checkout $(git describe --tags `git rev-list --tags --max-count=1`)

  else

    printf "You must select a SRC_METHOD!"

  fi

  mkdir -p $INST_DEST

  script/build
  if [[ $DEST_TYPE == "local" ]]; then
    script/grunt install --channel=stable --install-dir $INST_DEST
    printf "The Atom executable is now found at $INST_DEST/bin/atom \n"
  elif [[ $DEST_TYPE = "system" ]]; then
    sudo script/grunt install --channel=stable --install-dir $INST_DEST
  fi
}

export -f atom-build
