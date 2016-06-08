#!/bin/bash
function sed_pascal {
  sed -i -e "/\"language-perl\": \".*\",/i \
              \"language-pascal\": \"${_language_pascal_ver}\"," package.json
}

export -f sed_pascal
