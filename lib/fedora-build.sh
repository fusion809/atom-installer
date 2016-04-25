. /lib/atom-build.sh

function fedora-build {
  # Get dependencies
  sudo dnf copr enable nibbler/nodejs
  sudo dnf install -y nodejs npm build-essential git \
    libgnome-keyring-dev fakeroot
  atom-build
}

export -f fedora-build
