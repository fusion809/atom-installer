#!/bin/bash
function sed_viml {
  sed -i -e "/\"language-toml\": \".*\",/a \
            \"language-viml\": \"${_language_viml_ver}\"," package.json   # Add VimL
}

export -f sed_viml
