. ./lib/build/atom.sh

function centos_build {

  printf "Running centos_build in ./lib/build/centos.sh. ==>\n"
  # Get dependencies
  sudo yum install -y python gcc gcc-c++ make \
    glibc-devel git-core libgnome-keyring-devel patch rpmdevtools

  ## Node.js
  if ! `comex npm`; then
    if curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -; then
      sudo yum install -y nodejs-devel npm
    else
      node_build
    fi
  elif [[ $(npm --version) < "1.4.28" ]]; then
    if curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -; then
      sudo yum install -y nodejs-devel npm
    else
      node_build
    fi
  fi

  # Build
  atom_build
}

export -f centos_build
