#!/bin/bash

if comex atom; then                       # Check if Atom is already installed

  printf "Atom is already installed!"

else

  printf "Would you rather install Atom from: A) the Entropy repositories or B) from source (slower, but more reliable)? [A/B] "
  read preference

  if [[ $preference == "A" ]]; then
    sudo equo i app-editors/atom
  elif [[ $preference == "B" ]]; then
    sabayon-build
  fi
fi
