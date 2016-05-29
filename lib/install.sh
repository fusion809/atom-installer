#!/bin/bash
function atom_install {
  if [[ $DEST_TYPE == "system" ]]; then
    if `comex dpkg`; then
      if [[ $ARCH == "x86_64" ]]; then
        script/grunt mkdeb && sudo dpkg -i out/atom-${pkgver}-amd64.deb && sudo apt-get -f install
      else
        script/grunt mkdeb && sudo dpkg -i out/atom-${pkgver}-i386.deb && sudo apt-get -f install
      fi
      sudo apt-get -f install
    elif `comex dnf`; then
      script/grunt mkrpm && sudo dnf install -y out/rpm/atom*.rpm
    elif `comex yum`; then
      script/grunt mkrpm && sudo yum install -y out/rpm/atom*.rpm
    elif `comex zypper`; then
      script/grunt mkrpm && sudo zypper in -y out/rpm/*.rpm
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
