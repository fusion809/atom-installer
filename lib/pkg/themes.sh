#!/bin/bash
function sed_themes {
  sed -i -e "/\"atom-light-syntax\": \".*\"/a \
              \"dark-bint-syntax\": \"${_dark_bint_syntax_ver}\"," package.json # install dark-bint-syntax

  sed -i -e "/\"atom-light-ui\": \".*\",/a \
             \"fusion-ui\": \"${_fusion_ui_ver}\"," package.json # install fusion-ui theme
}

export -f sed_themes
