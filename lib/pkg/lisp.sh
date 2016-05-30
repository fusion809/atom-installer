#!/bin/bash
function sed_lisp {
  sed -i -e "/\"language-less\": \".*\",/a \
              \"language-lisp\": \"${_language_lisp_ver}\"," package.json
}

export -f sed_lisp
