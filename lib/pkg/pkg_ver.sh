#!/bin/bash
function pkg_det {

  if ! [[ -d /tmp/$1 ]]; then
    git clone https://github.com/$1 /tmp/$1
  else
    cd /tmp/$1
    git pull origin master
    cd -
  fi

  printf "$(sed -n "s/\"version\": //p" /tmp/$1/package.json | sed 's/"//g' | sed 's/,//g' | sed 's/ //g')"
}

export -f pkg_det

function pkg_ver {
  _about_arch_ver=$(pkg_det fusion809/about)
  _dark_bint_syntax_ver=$(pkg_det Murriouz/dark-bint-syntax)
  _electron_ver=0.36.12
  _fusion_ui_ver=$(pkg_det fusion809/fusion-ui)
  _language_archlinux_ver=$(pkg_det fusion809/language-archlinux)
  _language_gfm2_ver=$(pkg_det fusion809/language-gfm2)
  _language_ini_desktop_ver=$(pkg_det fusion809/language-ini-desktop)
  _language_liquid_ver=$(pkg_det puranjayjain/language-liquid)
  _language_patch2_ver=$(pkg_det fusion809/language-patch2)
  _language_unix_shell_ver=$(pkg_det fusion809/language-shellscript)
}

export -f pkg_ver
