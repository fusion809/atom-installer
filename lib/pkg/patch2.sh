#!/bin/bash
function sed_patch2 {

  _language_patch2_url="https://github.com/fusion809/language-patch2"
  
  sed -i -e "/\"dependencies\": {/a \
            \"language-patch2\": \"${_language_patch2_url}\"," package.json

  sed -i -e "/\"language-liquid\": \".*\",/a \
              \"language-patch2\": \"${_language_patch2_ver}\"," package.json
}

export -f sed_patch2
