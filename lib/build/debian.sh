. ./lib/build/atom.sh

function debian_build {
  # Get dependencies
  sudo apt-get install -y build-essential git libgnome-keyring-dev fakeroot

  ## Node.js
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

  # Build
  atom_build
}

export -f debian_build
