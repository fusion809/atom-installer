. ./lib/build/atom.sh
. ./lib/build/node.sh

function ubuntu_build {
  printf "Running ubuntu_build in ./lib/build/ubuntu.sh. ==>\n"
  # Get dependencies
  sudo apt-get install -y build-essential git libgnome-keyring-dev fakeroot nodejs npm patch

  # Upgrade NPM to the minimum needed
  npmver=$(npm --version)
  if [[ $npmver < "1.4.28" ]]; then
    sudo npm install -g --loglevel error npm@1.4.28
  fi

  if ! [[ -f /usr/bin/node ]]; then
    sudo ln -s /usr/bin/nodejs /usr/bin/node
  fi
  # Build
  atom_build
}

export -f ubuntu_build
