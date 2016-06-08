#!/bin/bash
for i in ./lib/pkg/*.sh
do
  source "$i"
done

function sed_pkg {
  # This function seds the Atom package.json file
  pkg_ver

  cd $SRC_DEST/atom

  sed_about

  sed_elect

  sed_priv

  sed_gfm

  sed_liquid

  sed_shellscript

  sed_archlinux

  sed_patch2

  sed_ini

}

export -f sed_pkg
