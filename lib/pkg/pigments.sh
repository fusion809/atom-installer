#!/bin/bash
function sed_pigments {
  sed -i -e "/\"package-generator\": \".*\",/a \
              \"pigments\": \"${_pigments_ver}\"," package.json
}

export -f sed_pigments
