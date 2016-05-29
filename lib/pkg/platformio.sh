#!/bin/bash
function sed_platformio {
  sed -i -e "/\"package-generator\": \".*\",/a \
              \"platformio-ide\": \"${_platformio_ide_ver}\",\n    \"platformio-ide-terminal\": \"${_platformio_ide_terminal_ver}\"," package.json
}

export -f sed_platformio
