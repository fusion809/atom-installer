#!/bin/bash

if comex atom; then                       # Check if Atom is already installed

  printf "Atom is already installed!"

else

  printf "Would you rather install Atom from: A) a Debian binary (faster) or B) from source (slower, but more reliable)? [A/B] "
  read preference

  if [[ $preference == "A" ]]; then
    atomaur bin
  elif [[ $preference == "B" ]]; then
    atomaur
  fi

fi
