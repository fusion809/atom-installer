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
  sed -i -e "s/\"about\": \".*\",/\"about-arch\": \"${_about_arch_ver}\",/g" package.json

  printf "About to sed electron=>\n"
  sed -i -e "s/\"electronVersion\": \".*\"/\"electronVersion\": \"${_electron_ver}\"/g" package.json

  printf "About to sed privacy=>\n"
  sed -i -e "/exception-reporting/d" \
         -e "/metrics/d" package.json

  printf "About to sed gfm2=>\n"
  sed -i -e "s\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",/g" package.json

  printf "About to sed liquid=>\n"
  sed -i -e "/\"language-less\": \".*\",/a \
              \"language-liquid\": \"${_language_liquid_ver}\"," package.json

  printf "About to sed unix shell=>\n"
  sed -i -e "s/\"language-shellscript\": \".*\"/\"language-unix-shell\": \"${_language_unix_shell_ver}\"/g" package.json

  printf "About to sed archlinux=>\n"
  sed -i -e "/\"language-c\": \".*\",/a \
              \"language-archlinux\": \"${_language_archlinux_ver}\"," package.json

  printf "About to sed patch2=>\n"
  _language_patch2_url="https://github.com/fusion809/language-patch2"

  sed -i -e "/\"dependencies\": {/a \
            \"language-patch2\": \"${_language_patch2_url}\"," \
         -e "/\"language-liquid\": \".*\",/a \
              \"language-patch2\": \"${_language_patch2_ver}\"," package.json

  printf "About to sed ini-desktop=>\n"
  sed_ini

  _language_ini_desktop_url="https://github.com/fusion809/language-ini-desktop"

  sed -i -e "/\"dependencies\": {/a \
            \"language-ini-desktop\": \"${_language_ini_desktop_url}\"," \
         -e "/\"language-hyperlink\": \".*\",/a \
              \"language-ini-desktop\": \"${_language_ini_desktop_ver}\"," package.json

}

export -f sed_pkg
