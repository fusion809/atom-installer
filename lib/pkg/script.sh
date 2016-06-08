#!/bin/bash
function sed_script {
  sed -i -e "/\"package-generator\": \".*\",/a \
              \"script\": \"${_script_ver}\"," package.json
}

export -f sed_script
