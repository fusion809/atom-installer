function atom-build {
  # Get the source code
  printf "How would you like to get the source code? [curl/git/wget/?] "
  read SRC_METHOD

  printf "Where do you want to store the source code? "
  read SRC_DEST

  printf "Do you want to install Atom locally or system-wide? [local/system] "
  read DEST_TYPE

  printf "Where do you want to install Atom?"
  read INST_DEST

  git clone https://aur.archlinux.org/atom-editor.git /tmp/atom-editor
  ver=$(sed -n 's/pkgver=//p' /tmp/atom-editor/PKGBUILD)

  if [[ $SRC_METHOD == "?" ]]; then

    printf "curl and wget are the fastest methods and they chew up less bandwidth.\n
    While git uses up more bandwidth but it also makes upgrading the package faster."

  elif [[ $SRC_METHOD == "curl" ]]; then

    curl -sL https://github.com/atom/atom/archive/v$ver.tar.gz | tar xz -C $SRC_DEST
    cd $SRC_DEST/atom-$ver

  elif [[ $SRC_METHOD == "wget" ]]; then

    wget -cqO- https://github.com/atom/atom/archive/v$ver.tar.gz | tar xz -C $SRC_DEST
    cd $SRC_DEST/atom-$ver

  elif [[ $SRC_METHOD == "git" ]]; then

    git clone https://github.com/atom/atom $SRC_DEST/atom
    cd $SRC_DEST/atom
    git fetch -p
    git checkout $(git describe --tags `git rev-list --tags --max-count=1`)

  else

    printf "You must select a SRC_METHOD!"

  fi

  script/build
  if [[ $DEST_TYPE == "local" ]]; then
    script/grunt install --channel=stable --install-dir $INST_DEST
  elif [[ $DEST_TYPE = "system" ]]; then
    sudo script/grunt install --channel=stable --install-dir $INST_DEST
  fi
}
