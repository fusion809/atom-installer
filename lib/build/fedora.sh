. ./lib/build/atom.sh

function fedora_build {
  # Get dependencies
  sudo dnf copr enable nibbler/nodejs || sudo dnf install -y 'dnf-command(copr)' \
    && sudo dnf copr enable -y nibbler/nodejs
  sudo dnf update
  sudo dnf install -y make gcc gcc-c++ glibc-devel git-core libgnome-keyring-devel tar nodejs npm rpmdevtools
  atom_build
}

export -f fedora_build
