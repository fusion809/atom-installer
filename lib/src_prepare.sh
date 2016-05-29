#!/bin/bash
source "./lib/sed_pkg.sh"
source "./lib/src_modules.sh"

function src_prepare {
  #First and only input is either custom or nothing.

  sed_pkg "$1"

  src_modules
}
