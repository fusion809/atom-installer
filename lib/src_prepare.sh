#!/bin/bash
source "./lib/mod_desktop.sh"
source "./lib/sed_pkg.sh"
source "./lib/src_modules.sh"

function src_prepare {
  #First and only input is either custom or nothing.

  sed_pkg

  mod_desktop

  src_modules
}

export -f src_prepare