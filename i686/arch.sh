#!/bin/bash

if comex atom; then
  printf "Atom is already installed!"
elif comex git; then
  printf "Git is installed!"
fi
