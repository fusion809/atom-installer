#!/bin/bash
for i in ./lib/pkg/*.sh
do
  source "$i"
done

function sed_pkg {
  # This function seds the Atom package.json file
  pkg_ver

  cd $SRC_DEST/atom

  if [[ "$1" == "custom" ]]; then

    sed_about

    sed_priv

    sed_themes

    sed_rust

    sed_icons

    sed_git

    sed_fortran

    sed_docker

    sed_d

    sed_gentoo

    sed_gfm

    sed_ini

    sed_julia

    sed_lua

    sed_lisp

    sed_liquid

    sed_matlab

    sed_swift

    sed_pascal

    sed_viml

    sed_shellscript

    sed -i -e "/\"notifications\": \".*\",/a \
                \"nuclide\": \"${_nuclide_ver}\"," package.json # nuclide

    sed_termplus
    
    sed_script

    sed_pigments

    sed_sync

    sed -i -e "/\"markdown-preview\": \".*\",/a \
                \"minimap\": \"${_minimap_ver}\"," package.json

    sed -i -e "s|^\"|    \"|g"  package.json # fixing spacing issues

  else
    sed -i -e '/exception-reporting/d' \
           -e '/metrics/d' \
           -e "s/\"electronVersion\": \".*\"/\"electronVersion\": \"${_electron_ver}\"/g" \
           -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",\n    \"language-liquid\": \"${_language_liquid_ver}\",/g" \
           -e "s/\"about\": \".*\"/\"about-arch\": \"${_about_arch_ver}\"/g" \
           -e "s/\"language-shellscript\": \".*\"/\"language-shellscript\": \"${_language_shellscript_ver}\"/g" \
           package.json
  fi

}

export -f sed_pkg
