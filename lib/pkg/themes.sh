#!/bin/bash
function sed_themes {
  sed -i -e "/\"atom-light-syntax\": \".*\"/a \
              \"dark-bint-syntax\": \"${_dark_bint_syntax_ver}\"," package.json # install dark-bint-syntax

  sed -i -e "/\"atom-light-ui\": \".*\",/a \
             \"fusion-ui\": \"${_fusion_ui_ver}\"," package.json # install fusion-ui theme

  sed -i -e "/atom-dark/d" package.json # delete atom-dark-ui/syntax themes

  sed -i -e "/base16/d" package.json # delete base16 themes

  sed -i -e "/solarized-dark/d" package.json # delete solarized themes

  sed -i -e "/one-/d" package.json # delete one- themes
}

export -f sed_themes
