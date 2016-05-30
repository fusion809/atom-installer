#!/bin/bash
function sed_ini {
  sed -i -e "/\"language-hyperlink\": \".*\",/a \
              \"language-ini2\": \"${_language_ini2_ver}\"," package.json
}

export -f sed_ini
