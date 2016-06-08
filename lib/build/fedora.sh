. ./lib/build/atom.sh

function fedora_build {
  # Get dependencies
  sudo dnf install -y make gcc gcc-c++ glibc-devel git-core libgnome-keyring-devel tar nodejs npm rpmdevtools
  sudo npm install -g npm@1.4.28 --loglevel error
  atom_build
}

export -f fedora_build
