#!/bin/bash
for i in ./lib/pkg/*.sh
do
  source "$i"
done

function sed_pkg {
  # This function seds the Atom package.json file
  export _about_arch_ver=$(pkg_det fusion809/about)
  export _dark_bint_syntax_ver=$(pkg_det Murriouz/dark-bint-syntax)
  export _electron_ver="0.36.12"
  export _fusion_ui_ver=$(pkg_det fusion809/fusion-ui)
  export _language_archlinux_ver=$(pkg_det fusion809/language-archlinux)
  export _language_gfm2_ver=$(pkg_det fusion809/language-gfm2)
  export _language_ini_desktop_ver=$(pkg_det fusion809/language-ini-desktop)
  export _language_liquid_ver=$(pkg_det puranjayjain/language-liquid)
  export _language_patch2_ver=$(pkg_det fusion809/language-patch2)
  export _language_unix_shell_ver=$(pkg_det fusion809/language-shellscript)

  cd $SRC_DEST/atom

  patch -Np1 -i $INDIR/resources/packages.patch
}

export -f sed_pkg
