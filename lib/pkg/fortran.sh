#!/bin/bash
function sed_fortran {
  sed -i -e "/\"language-css\": \".*\",/a \
              \"language-fortran\": \"${_language_fortran_ver}\"," package.json
}

export -f sed_fortran
