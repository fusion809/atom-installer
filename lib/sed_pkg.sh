#!/bin/bash
for i in ./lib/pkg/*.sh
do
  source "$i"
done

function sed_pkg {
  # This function seds the Atom package.json file
  pkg_ver

  cd $SRC_DEST/atom

  sed -i -e "/exception-reporting/d" \
       -e "/metrics/d" \
       -e "/atom-dark/d" \
       -e "/atom-light/d" \
       -e "/base16/d" \
       -e "/solarized/d" \
       -e "/one/d" \
       -e "s/0.36.8/${_electron_ver}/g" \
       -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",\n    \"language-ini-desktop\": \"${_language_ini_desktop_ver}\",\n    \"language-liquid\": \"${_language_liquid_ver}\",\n    \"language-patch2\": \"${_language_patch2_ver}\",/g" \
       -e "/\"dependencies\": {/a \
                   \"language-patch2\": \"${_language_patch2_url}\"," \
       -e "s/\"language-shellscript\": \".*\",/\"language-unix-shell\": \"${_language_unix_shell_ver}\",\n    \"language-archlinux\": \"${_language_archlinux_ver}\",/g" \
       -e "s/\"about\": \".*\"/\"about-arch\": \"${_about_arch_ver}\"/g" \
       -e "/\"packageDependencies\": {/a \
            \"dark-bint-syntax\": \"${_dark_bint_syntax_ver}\",\n    \"fusion-ui\": \"${_fusion_ui_ver}\"," package.json
}

export -f sed_pkg
