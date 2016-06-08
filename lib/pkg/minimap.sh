#!/bin/bash
function sed_minimap {
  sed -i -e "/\"markdown-preview\": \".*\",/a \
              \"minimap\": \"${_minimap_ver}\"," package.json
}

export -f sed_minimap
