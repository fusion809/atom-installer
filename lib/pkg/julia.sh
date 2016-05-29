#!/bin/bash
function sed_julia {
  sed -i -e "/\"language-json\": \".*\",/a \
              \"language-julia\": \"${_language_julia_ver}\"," package.json # Julia
}

export -f sed_julia
