#!/bin/bash
function sed_docker {
  sed -i -e "/\"language-css\": \".*\",/a \
              \"language-docker\": \"${_language_docker_ver}\"," package.json
}

export -f sed_docker
