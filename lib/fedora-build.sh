. ./lib/atom-build.sh

function fedora-build {
  # Get dependencies
  sudo dnf copr enable nibbler/nodejs || sudo dnf install 'dnf-command(copr)' \
    && sudo dnf copr enable nibbler/nodejs
  sudo dnf update
  sudo dnf install -y make gcc gcc-c++ glibc-devel git-core libgnome-keyring-devel
  atom-build
}

export -f fedora-build
