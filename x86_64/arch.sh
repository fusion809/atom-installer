#!/bin/bash
export AUR=https://aur.archlinux.org/cgit/aur.git/snapshot/
export GIT=https://aur.archlinux.org/

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
