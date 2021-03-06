. ./lib/build/atom.sh
. ./lib/build/node.sh

function pclinuxos_build {
  printf "Running pclinuxos_build in ./lib/build/pclinuxos.sh. ==>\n"

  # Get dependencies
  sudo apt-get install -y gcc gcc-c++ make git \
    libgnome-keyring-devel fakeroot rpmdevtools patch
  node_build
  atom_build
}

export -f pclinuxos_build
