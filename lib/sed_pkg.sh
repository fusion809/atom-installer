#!/bin/bash
function sed_pkg {

  _about_arch_ver=1.5.15
  _dark_bint_syntax_ver=0.8.4
  _electron_ver=0.36.12
  _file_icons_ver=1.7.12
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
  _language_ini2_ver=1.17.2
  _language_julia_ver=0.6.0
  _language_liquid_ver=0.5.1
  _language_lisp_ver=0.2.0
  _language_lua_ver=0.9.4
  _language_matlab_ver=0.2.1
  _language_pascal_ver=0.18.1
  _language_viml_ver=1.0.0
  _language_shellscript_ver=0.22.3
  _minimap_ver=4.24.3
  _nuclide_ver=0.139.0
  _package_sync_ver=1.1.0
  _pigments_ver=0.27.1
  _script_ver=3.7.3
  _terminal_plus_ver=0.14.5
  _atom_language_rust_ver=0.8.0

  cd $SRC_DEST/atom

  if [[ "$1" == "custom" ]]; then

    ## package.json edits
    sed -i -e "/exception-reporting/d" \
             -e "/metrics/d" package.json

    sed -i -e "s/\"about\": \".*\"/\"about-arch\": \"${_about_arch_ver}\"/g" package.json # switching about with about-arch

    sed -i -e "s/\"electronVersion\": \".*\"/\"electronVersion\": \"${_electron_ver}\"/g" package.json              # change electron ver

    sed -i -e "/\"atom-light-syntax\": \".*\"/a \
                \"dark-bint-syntax\": \"${_dark_bint_syntax_ver}\"," package.json # install dark-bint-syntax

    sed -i -e "/\"atom-light-ui\": \".*\",/a \
               \"fusion-ui\": \"${_fusion_ui_ver}\"," package.json # install fusion-ui theme

    sed -i -e "/\"archive-view\": \".*\",/a \
                \"atom-language-rust\": \"${_atom_language_rust_ver}\"," package.json

    sed -i -e "/\"find-and-replace\": \".*\",/i \
                \"file-icons\": \"${_file_icons_ver}\"," package.json # file-icons

    sed -i -e "/\"git-diff\": \".*\",/a \
                \"git-plus\": \"${_git_plus_ver}\",\n    \"git-time-machine\": \"${_git_time_machine_ver}\",\n    \"go-debug\": \"0.1.12\",\n    \"node-debug\": \"1.7.0\",\n    \"python-debug\": \"1.0.0\"," package.json # git packages

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
                \"language-pascal\": \"${_language_pascal_ver}\",\n    \"language-swift\": \"0.4.0\"," package.json # pascal

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

  if ! [[ -d node_modules ]]; then
    mkdir node_modules
  fi

  curl -sL https://github.com/fusion809/about/archive/v${_about_arch_ver}.tar.gz | tar xz -C node_modules
  mv node_modules/about-${_about_arch_ver} node_modules/about-arch

  cp $INDIR/resources/about-arch.patch node_modules/about-arch
  cd node_modules/about-arch
  patch -Np1 < about-arch.patch
  cd -

  sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
  ./script/build || die "Fail fixing verbosity of script/build"
}

export -f sed_pkg
