. ./lib/build/atom.sh
. ./lib/build/node.sh

function pclinuxos_build {
  # Get dependencies
  sudo apt-get install -y gcc gcc-c++ make git \
    libgnome-keyring-devel fakeroot
  node_build
  atom_build
}

export -f pclinuxos_build
