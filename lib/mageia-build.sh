. ./lib/atom-build.sh

function mageia-build {
  # Get dependencies
  sudo urpmi git curl libgnome-keyring-devel make gcc gcc-cpp
  . ./lib/node-build.sh
  atom-build
}

export -f fedora-build
