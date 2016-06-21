. ./lib/build/atom.sh

function fedora_build {
  printf "Running fedora_build in ./lib/build/fedora.sh. ==>\n"
  # Get dependencies
  sudo dnf install -y make gcc gcc-c++ glibc-devel git-core libgnome-keyring-devel tar patch nodejs-devel \
    rpmdevtools alsa-lib GConf2-devel libXtst libnotify gtk2-devel python
  sudo npm install -g node-gyp
  atom_build
}

export -f fedora_build
