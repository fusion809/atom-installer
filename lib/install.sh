#!/bin/bash
function atom_install {
  if `comex dpkg`; then
    if [[ $ARCH == "x86_64" ]]; then
      script/build --create-debian-package || die "Running script/build --create-debian-package failed! ==>\n"
      printf "Going to attempt to install the Atom package built by script/grunt mkdeb at $SRC_DEST/atom/out/atom-${pkgver}-amd64.deb. ==>\n"
      sudo dpkg -i "$SRC_DEST/atom/out/atom-${pkgver}-amd64.deb"
      sudo apt-get -f install
    else
      script/build --create-debian-package || die "Running script/build --create-debian-package failed! ==>\n"
      printf "Going to attempt to install the Atom package built by script/grunt mkdeb at $SRC_DEST/atom/out/atom-${pkgver}-i386.deb. ==>\n"
      sudo dpkg -i "$SRC_DEST/atom/out/atom-${pkgver}-i386.deb"
      sudo apt-get -f install
    fi
  elif `comex dnf`; then
    script/build --create-rpm-package && sudo dnf install -y "$SRC_DEST/atom/out/rpm/atom*.rpm"
  elif `comex yum`; then
    script/build --create-rpm-package && sudo yum install -y "$SRC_DEST/atom/out/rpm/atom*.rpm"
  elif `comex zypper`; then
    script/build --create-rpm-package && sudo zypper in -y "$SRC_DEST/atom/out/rpm/*.rpm"
  fi
}

export -f atom_install
