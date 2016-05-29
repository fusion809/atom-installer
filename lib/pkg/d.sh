#!/bin/bash
function sed_d {
  sed -i -e "/\"language-css\": \".*\",/a \
              \"language-d\": \"${_language_d_ver}\"," package.json
}

export -f sed_d
