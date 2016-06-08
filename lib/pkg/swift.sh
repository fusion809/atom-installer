#!/bin/bash
function sed_swift {
  sed -i -e "/\"language-perl\": \".*\",/i \
              \"language-swift\": \"${_language_swift_ver}\"," package.json # pascal
}

export -f sed_swift
