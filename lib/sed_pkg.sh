#!/bin/bash
for i in ./lib/pkg/*.sh
do
  source "$i"
done

function sed_pkg {
  # This function seds the Atom package.json file
  pkg_ver

  cd $SRC_DEST/atom

  printf "About to sed about=>\n"
  sed_about

  printf "About to sed electron=>\n"
  sed_elect

  printf "About to sed privacy=>\n"
  sed_priv

  printf "About to sed gfm2=>\n"
  sed_gfm

  printf "About to sed liquid=>\n"
  sed_liquid

  printf "About to sed unix shell=>\n"
  sed_shellscript

  printf "About to sed archlinux=>\n"
  sed_archlinux

  printf "About to sed patch2=>\n"
  sed_patch2

  printf "About to sed ini-desktop=>\n"
  sed_ini

}

export -f sed_pkg
