#!/bin/bash
for i in ./lib/pkg/*.sh
do
  source "$i"
done

  _about_arch_ver=1.5.15
  _atom_typescript_ver=8.10.2
  _dark_bint_syntax_ver=0.8.4
  _electron_ver=0.36.12
  _file_icons_ver=1.7.13
  _fusion_ui_ver=0.10.3
  _git_plus_ver=5.14.0
  _git_time_machine_ver=1.5.3
  _language_d_ver=3.2.3
  _language_docker_ver=1.1.6
  _language_fortran_ver=2.0.11
  _language_gentoo_ver=0.9.0
  _language_gfm2_ver=0.90.2
  _language_groovy_ver=0.6.0
  _language_haskell_ver=1.7.15
  _language_ini2_ver=1.17.1
  _language_julia_ver=0.6.0
  _language_liquid_ver=0.5.1
  _language_lisp_ver=0.2.0
  _language_lua_ver=0.9.4
  _language_matlab_ver=0.2.1
  _language_pascal_ver=0.18.1
  _language_viml_ver=1.0.0
  _language_shellscript_ver=0.22.3
  _linter_ver=1.11.4
  _linter_docker_ver=0.1.2
  _markdown_writer_ver=2.3.4
  _minimap_ver=4.24.3
  _nuclide_ver=0.139.0
  _package_sync_ver=1.1.0
  _pigments_ver=0.28.4
  _script_ver=3.7.3
  _terminal_plus_ver=0.14.5
  _atom_language_rust_ver=0.8.0

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

    sed_platformio

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
