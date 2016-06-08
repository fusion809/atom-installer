#!/bin/bash
function pkg_det {

  if ! [[ -d /tmp/$1 ]]; then
    git clone -q https://github.com/$1 /tmp/$1
  else
    git -C /tmp/$1 pull -q origin master
  fi

  printf "$(sed -n "s/\"version\": //p" /tmp/$1/package.json | sed 's/"//g' | sed 's/,//g' | sed 's/ //g')"
}

export -f pkg_det

function pkg_ver {
  export _about_arch_ver=$(pkg_det fusion809/about)
  export _dark_bint_syntax_ver=$(pkg_det Murriouz/dark-bint-syntax)
  export _electron_ver=0.36.12
  export _fusion_ui_ver=$(pkg_det fusion809/fusion-ui)
  export _language_archlinux_ver=$(pkg_det fusion809/language-archlinux)
  export _language_gfm2_ver=$(pkg_det fusion809/language-gfm2)
  export _language_ini_desktop_ver=$(pkg_det fusion809/language-ini-desktop)
  export _language_liquid_ver=$(pkg_det puranjayjain/language-liquid)
  export _language_patch2_ver=$(pkg_det fusion809/language-patch2)
  export _language_unix_shell_ver=$(pkg_det fusion809/language-shellscript)
}

export -f pkg_ver
