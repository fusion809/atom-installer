#!/bin/bash
function sed_archlinux {
  sed -i -e "/\"language-c\": \".*\",/a \
              \"language-archlinux\": \"${_language_archlinux_ver}\"," package.json
}

export -f sed_archlinux
