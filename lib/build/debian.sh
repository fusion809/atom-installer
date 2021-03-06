. ./lib/build/atom.sh
. ./lib/build/node.sh

function debian_build {
  printf "Running debian_build in ./lib/build/debian.sh. ==>\n"
  # Get dependencies
  sudo apt-get install -y build-essential git patch libgnome-keyring-dev fakeroot nodejs npm

  # Upgrade NPM to the minimum needed
  if [[ $(npm --version) < "1.4.28" ]]; then
    sudo npm install -g --loglevel error npm@1.4.28
  fi

  if ! [[ -f /usr/bin/node ]]; then
    sudo ln -s /usr/bin/nodejs /usr/bin/node
  fi

  # Build
  atom_build
}

export -f debian_build
