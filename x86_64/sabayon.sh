#!/bin/bash

if comex atom; then                       # Check if Atom is already installed

  printf "Atom is already installed!"

else

  method

  if [[ $preference == "A" ]]; then
    sudo equo i app-editors/atom
  else
    sabayon_build
  fi
fi
