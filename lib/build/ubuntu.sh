. ./lib/build/atom.sh
. ./lib/build/node.sh

function ubuntu_build {
  # Get dependencies
  curl -L "https://projects.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/nodejs" > /tmp/PKGBUILD
  nodelver=$(sed -n 's/pkgver=//p' /tmp/PKGBUILD)
  nodever=$(node --version | sed 's/v//g')
  if ! [[ $nodever == $nodelver ]]; then
    if curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -; then
      sudo apt-get install -y nodejs
    else
      node_build
    fi
  fi
  sudo apt-get install -y build-essential git libgnome-keyring-dev \
    fakeroot
  atom_build
}

export -f ubuntu_build
