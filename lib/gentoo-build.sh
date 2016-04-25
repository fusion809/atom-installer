. ./lib/atom-build.sh

function gentoo-build {
  # Get dependencies
  sudo sed -i -e 's/USE="/USE="-bindist' /etc/portage/make.conf
  if ! [[ -d /usr/portage ]]; then
    sudo mkdir /usr/portage
  fi
  sudo emerge-webrsync
  sudo emerge -o --autounmask-write app-editors/atom
  sudo etc-update --automode -5
  sudo emerge -o app-editors/atom || echo "Sorry, you are going to have to deal with any issues here yourself. \n One common issue is a circular dependency issue with app-crypt/gcr, app-crypt/gnupg and app-crypt/pinentry. The solution involves adjusting USE flags."
  atom-build
}

export -f gentoo-build
