. ./lib/build/atom.sh
. ./lib/build/node.sh

function ubuntu-build {
  # Get dependencies
  sudo apt-get install -y curl
  if curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -; then
    sudo apt-get install -y nodejs
  else
    node-build
  fi
  sudo apt-get install -y build-essential git libgnome-keyring-dev \
    fakeroot
  atom-build
}

export -f ubuntu-build
