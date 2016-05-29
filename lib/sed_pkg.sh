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


  if [[ "$1" == "custom" ]]; then

    sed_themes

    sed_rust

    sed_icons

    sed_git

    sed_fortran

    sed_docker

    sed_d

    sed_gentoo

    sed_ini

    sed_julia

    sed_lua

    sed_lisp

    sed_matlab

    sed_swift

    sed_pascal

    sed_viml

    sed_nuclide

    sed_termplus

    sed_script

    sed_pigments

    sed_sync

    sed_minimap

    sed_spacing

  elif [[ "$1" == "themes" ]]; then

    sed_themes

  fi

}

export -f sed_pkg
