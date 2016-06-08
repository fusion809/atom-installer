#!/bin/bash
function sed_gfm {
  sed -i -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",/g" package.json # GFM2
}

export -f sed_gfm
