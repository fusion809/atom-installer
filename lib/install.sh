#!/bin/bash
function atom_install {
  if [[ $DEST_TYPE == "system" ]]; then
    if `comex dpkg`; then
      if [[ $ARCH == "x86_64" ]]; then
        script/grunt mkdeb || die "Running script/grunt mkdeb failed! ==>\n"
        printf "Going to attempt to install the Atom package built by script/grunt mkdeb at $SRC_DEST/atom/out/atom-${pkgver}-amd64.deb. ==>\n"
        sudo dpkg -i "$SRC_DEST/atom/out/atom-${pkgver}-amd64.deb" && sudo apt-get -f install || die "Installing $SRC_DEST/atom/out/atom-${pkgver}-amd64.deb failed. You may need to run 'sudo dpkg -i $SRC_DEST/atom/out/atom-${pkgver}-amd64.deb && sudo apt-get -f install'"
      else
        script/grunt mkdeb || die "Running script/grunt mkdeb failed! ==>\n"
        printf "Going to attempt to install the Atom package built by script/grunt mkdeb at $SRC_DEST/atom/out/atom-${pkgver}-i386.deb. ==>\n"
        sudo dpkg -i "$SRC_DEST/atom/out/atom-${pkgver}-i386.deb" && sudo apt-get -f install || die "Installing $SRC_DEST/atom/out/atom-${pkgver}-i386.deb failed. You may need to run 'sudo dpkg -i $SRC_DEST/atom/out/atom-${pkgver}-i386.deb && sudo apt-get -f install'"
      fi
    elif `comex dnf`; then
      script/grunt mkrpm && sudo dnf install -y "$SRC_DEST/atom/out/rpm/atom*.rpm"
    elif `comex yum`; then
      script/grunt mkrpm && sudo yum install -y "$SRC_DEST/atom/out/rpm/atom*.rpm"
    elif `comex zypper`; then
      script/grunt mkrpm && sudo zypper in -y "$SRC_DEST/atom/out/rpm/*.rpm"
    else
      sudo script/grunt install --channel=stable --install-dir $INST_DEST
    fi
  else
    script/grunt install --channel=stable --install-dir $INST_DEST
    chmod +x "$INST_DEST/share/applications/atom.desktop"
    printf "The Atom executable is now found at $INST_DEST/bin/atom \n"
  fi
}

export -f atom_install
