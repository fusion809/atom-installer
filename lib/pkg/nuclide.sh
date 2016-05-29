#!/bin/bash
function sed_nuclide {
  sed -i -e "/\"notifications\": \".*\",/a \
              \"nuclide\": \"${_nuclide_ver}\"," package.json # nuclide
}

export -f sed_nuclide
