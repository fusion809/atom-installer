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
  export _file_icons_ver=$(pkg_det DanBrooker/file-icons)
  export _fusion_ui_ver=$(pkg_det fusion809/fusion-ui)
  export _language_archlinux_ver=$(pkg_det fusion809/language-archlinux)
  export _language_debian_ver=$(pkg_det tsbarnes/language-debian)
  export _language_gentoo_ver=$(pkg_det aegypius/language-gentoo)
  export _language_gfm2_ver=$(pkg_det fusion809/language-gfm2)
  export _language_ini_desktop_ver=$(pkg_det fusion809/language-ini-desktop)
  export _language_liquid_ver=$(pkg_det puranjayjain/language-liquid)
  export _language_patch2_url="https://github.com/fusion809/language-patch2"
  export _language_patch2_ver=$(pkg_det fusion809/language-patch2)
  export _language_rpm_spec_ver=$(pkg_det waveclaw/language-rpm-spec)
  export _language_unix_shell_ver=$(pkg_det fusion809/language-shellscript)
  export _terminal_fusion_ver=$(pkg_det fusion809/terminal-fusion)

  sed -i -e "/-ui/d" \
         -e "/-syntax/d" \
         -e "/-theme/d" \
         -e "/metrics/d" \
         -e "/exception-reporting/d" \
         -e "s/\"about\": \".*\",/\"about-arch\": \"${_about_arch_ver}\",/g" \
         -e "/language-gfm/d" \
         -e "/language-shellscript/d" \
         -e "s/0.36.8/${_electron_ver}/g" \
         -e "/\"language-yaml\": \".*\"/i \
              \"dark-bint-syntax\": \"${_dark_bint_syntax_ver}\",\n    \"file-icons\": \"${_file_icons_ver},\n    \"fusion-ui\": \"${_fusion_ui_ver}\",\n    \"language-archlinux\": \"${_language_archlinux_ver}\",\n    \"language-debian\": \"${_language_debian_ver}\",\n    \"language-gentoo\": \"${_language_gentoo_ver}\",\n    \"language-gfm2\": \"${_language_gfm2_ver}\",\n    \"language-ini-desktop\": \"${_language_ini_desktop_ver}\",\n    \"language-liquid\": \"${_language_liquid_ver}\",\n    \"language-patch2\": \"${_language_patch2_ver}\",\n    \"language-rpm-spec\": \"${_language_rpm_spec_ver}\",\n    \"language-unix-shell\": \"${_language_unix_shell_ver}\",\n    \"terminal-fusion\": \"${_terminal_fusion_ver}\"," \
         -e "/\"dependencies\": {/a \
              \"language-patch2\": \"${_language_patch2_url}\",\n    \"about-arch\": \"$SRC_DEST/atom/node_modules/about-arch\"," $SRC_DEST/atom/package.json
}

export -f sed_pkg
