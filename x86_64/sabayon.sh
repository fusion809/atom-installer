#!/bin/bash

if comex atom; then                       # Check if Atom is already installed

  printf "Atom is already installed!"

else

  method

  if [[ $preference == "A" ]]; then
    printf "Installing Atom with 'sudo equo i app-editors/atom'. ==>\nIf this fails please file a bug report at https://bugs.sabayon.org, as any such error is likely unrelated to this installer.\n"
    sudo equo i app-editors/atom
  else
    sabayon_build
  fi
fi
