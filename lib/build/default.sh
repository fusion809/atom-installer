function default {
  export SRC_DEST=$GHUB

  version

  if [[ -d $SRC_DEST/atom-$pkgver ]]; then
    rm -rf $SRC_DEST/atom-$pkgver
  fi

  curl -sL https://github.com/atom/atom/archive/v$pkgver.tar.gz | tar xz --transform="s/atom-${pkgver}/atom"-C $SRC_DEST
  cd $SRC_DEST/atom

  src_build custom

  if `comex dnf`; then

    script/grunt mkrpm
    sudo dnf install -y out/rpm/atom*.rpm

  elif `comex yum`; then

    script/grunt mkrpm
    sudo yum install -y out/rpm/atom*.rpm

  elif `comex zypper`; then

    script/grunt mkrpm
    sudo zypper in -y out/rpm/atom*.rpm

  elif `comex apt-get`; then

    if `comex dpkg`; then
      script/grunt mkdeb
      cd out
      sudo apt-get install -y atom*.deb
      cd -
    elif `comex rpm`; then
      script/grunt mkrpm
      sudo rpm -i out/rpm/atom*.rpm
      sudo apt-get -f install
    fi

  else

    script/grunt install --install-dir $HOME/.local

  fi
}

export -f default
