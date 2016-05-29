#!/bin/bash
function sed_sync {
  sed -i -e "/\"package-generator\": \".*\",/a \
              \"package-sync\": \"${_package_sync_ver}\"," package.json
}

export -f sed_sync
