#!/bin/bash

if comex atom; then                       # Check if Atom is already installed

  printf "Atom is already installed!"

else

  method

  if [[ $method == "A" ]]; then
    atomaur bin
  else
    atomaur
  fi

fi
