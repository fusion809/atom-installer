. ./lib/build/atom.sh

function gentoo_build {
  printf "Running gentoo_build in ./lib/build/gentoo.sh. ==>\n"
  
  printf "Would you like to install Atom using Portage (option A) or would you prefer to use a more reliable method (option B)? [A/B/?; B is the default]\n"
  read portmethod

  if [[ $portmethod == "A" ]]; then
    printf "Warning! This installer will be using Portage to install Atom, which is unreliable.\n"
    # Get dependencies
    sudo sed -i -e 's/USE="/USE="-bindist/g' /etc/portage/make.conf
    if ! [[ -d /usr/portage ]]; then
      sudo mkdir /usr/portage
    fi
    sudo emerge-webrsync
    sudo emerge -o --autounmask-write app-editors/atom
    sudo etc-update --automode -5

    sudo emerge app-editors/atom

    if ! [[ -f /usr/bin/atom ]]; then
      printf "Emerging the app-editors/atom failed! One common issue, if you did not make it app-editors/atom before an error arose, is a circular dependency issue with app-crypt/gcr, app-crypt/gnupg and app-crypt/pinentry. The solution involves adjusting USE flags. \n\nWould you like to install Atom the old fashion way from source code (A), or would you rather keep trying to install it with Portage (B)? [Options: A/B. A is the default, if you leave this question unanswered]\n"
      read answer

      if [[ $answer == "B" ]]; then
        printf "Good luck! If you change your mind run 'source ./lib/other.sh' from your local copy of the atom-installer repository (usually in ~/GitHub or ~/GitHub/mine).\n"
        exit 1
      else
        source "./lib/other.sh"
      fi
    fi
  else

}

export -f gentoo_build
