#!/bin/bash
function sed_ini {
  _language_ini_desktop_url="https://github.com/fusion809/language-ini-desktop"
  
  sed -i -e "/\"dependencies\": {/a \
            \"language-ini-desktop\": \"${_language_ini_desktop_url}\"," package.json

  sed -i -e "/\"language-hyperlink\": \".*\",/a \
              \"language-ini-desktop\": \"${_language_ini_desktop_ver}\"," package.json
}

export -f sed_ini
