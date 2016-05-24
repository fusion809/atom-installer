. ./lib/build/atom.sh

function centos_build {

  # Get dependencies
  sudo yum install -y python gcc gcc-c++ make \
    glibc-devel git-core libgnome-keyring-devel rpmdevtools

  ## Node.js
  curl -L "https://projects.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/nodejs" > /tmp/PKGBUILD
  nodelver=$(sed -n 's/pkgver=//p' /tmp/PKGBUILD)
  nodever=$(node --version | sed 's/v//g')
  if ! [[ $nodever == $nodelver ]]; then
    if curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -; then
      sudo yum install -y nodejs-devel
    else
      node_build
    fi
  fi

  # Build
  atom_build
}

export -f centos_build
