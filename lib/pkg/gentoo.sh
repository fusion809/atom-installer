#!/bin/bash
function sed_gentoo {
  sed -i -e "/\"language-gfm\": \".*\",/i \
              \"language-gentoo\": \"${_language_gentoo_ver}\"," package.json
}

export -f sed_gentoo
