#!/bin/bash
source "./lib/pkg/*.sh"

function sed_pkg {
  # This function seds the Atom package.json file
  pkg_ver

  cd $SRC_DEST/atom

  if [[ "$1" == "custom" ]]; then

    sed_about

    ## package.json edits
    sed_priv

    sed -i -e "/\"atom-light-syntax\": \".*\"/a \
                \"dark-bint-syntax\": \"${_dark_bint_syntax_ver}\"," package.json # install dark-bint-syntax

    # sed -i -e "/\"bracket-matcher\": \".*\",/a \
    #            \"browser-plus\": \"0.0.60\"," package.json

    sed -i -e "/\"atom-light-ui\": \".*\",/a \
               \"fusion-ui\": \"${_fusion_ui_ver}\"," package.json # install fusion-ui theme

    sed -i -e "/\"archive-view\": \".*\",/a \
                \"atom-language-rust\": \"${_atom_language_rust_ver}\"," package.json

    sed -i -e "/\"find-and-replace\": \".*\",/i \
                \"file-icons\": \"${_file_icons_ver}\"," package.json # file-icons

    sed -i -e "/\"git-diff\": \".*\",/a \
                \"git-plus\": \"${_git_plus_ver}\",\n    \"git-time-machine\": \"${_git_time_machine_ver}\"," package.json # git packages

    sed -i -e "/\"language-css\": \".*\",/a \
                \"language-d\": \"${_language_d_ver}\",\n    \"language-docker\": \"${_language_docker_ver}\",\n    \"language-fortran\": \"${_language_fortran_ver}\"," package.json

    sed -i -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",/g" package.json # GFM2

    sed -i -e "/\"language-gfm2\": \".*\",/i \
                \"language-gentoo\": \"${_language_gentoo_ver}\"," package.json # gentoo

    sed -i -e "/\"language-hyperlink\": \".*\",/a \
                \"language-ini2\": \"${_language_ini2_ver}\",\n    \n\"language-julia\": \"${_language_julia_ver}\"," package.json # Julia

    sed -i -e "/\"language-less\": \".*\",/a \
                \"language-liquid\": \"${_language_liquid_ver}\",\n    \"language-lisp\": \"${_language_lisp_ver}\",\n    \"language-lua\": \"${_language_lua_ver}\"," package.json # Add Liquid, Lisp, Lua

    sed -i -e "/\"language-makefile\": \".*\",/a \
                \"language-matlab\": \"${_language_matlab_ver}\"," package.json # MATLAB

    sed -i -e "/\"language-perl\": \".*\",/i \
                \"language-pascal\": \"${_language_pascal_ver}\",\n    \"language-swift\": \"${_language_swift_ver}\"," package.json # pascal

    sed -i -e "/\"language-toml\": \".*\",/a \
                \"language-viml\": \"${_language_viml_ver}\"," package.json   # Add VimL

    sed -i -e "s/\"language-shellscript\": \".*\"/\"language-shellscript\": \"${_language_shellscript_ver}\"/g" package.json

    sed -i -e "/\"notifications\": \".*\",/a \
                \"nuclide\": \"${_nuclide_ver}\"," package.json # nuclide

    sed -i -e "/\"package-generator\": \".*\",/a \
                \"package-sync\": \"${_package_sync_ver}\",\n    \"pigments\": \"${_pigments_ver}\",\n    \"script\": \"${_script_ver}\",\n    \"terminal-plus\": \"${_terminal_plus_ver}\"," package.json

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
