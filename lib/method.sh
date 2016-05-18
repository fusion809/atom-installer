#!/bin/bash
function method {
  printf "Do you want to install Atom from A) a binary package (faster and safer) or would you prefer B) a source install (slower)? \n[Available options: A/B. If left blank the default of option B will be used]\n"
  read method
}

export -f method
