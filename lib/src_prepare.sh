#!/bin/bash
source "./lib/mod_desktop.sh"
source "./lib/sed_pkg.sh"
source "./lib/src_modules.sh"

function src_prepare {
  #First and only input is either custom or nothing.

  printf "Running sed_pkg in lib/sed_pkg.sh. ==>\n"
  sed_pkg

  printf "Running mod_desktop in lib/mod_desktop.sh. ==>\n"
  mod_desktop

  printf "Running src_modules in lib/src_modules.sh. ==>\n"
  src_modules
}

export -f src_prepare
