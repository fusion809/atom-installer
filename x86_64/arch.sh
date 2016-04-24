#!/bin/bash
# Load the test function
source "lib/test.sh"

# Check if Atom is already installed
if comex atom; then
  printf "Atom is already installed!"
elif comex git; then
  printf "Git is installed!"
fi
