#!/bin/bash
function sed_themes {
  sed -i -e "s/\"atom-light-syntax\": \".*\"/\"dark-bint-syntax\": \"${_dark_bint_syntax_ver}\",/g" \
         -e "s/\"atom-light-ui\": \".*\",/\"fusion-ui\": \"${_fusion_ui_ver}\",/g" \
         -e "/atom-dark/d" \
         -e "/base16/d" \
         -e "/solarized-dark/d" \
         -e "/one-/d" package.json # delete one- themes
}

export -f sed_themes
