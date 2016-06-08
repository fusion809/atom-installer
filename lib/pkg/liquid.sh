function sed_liquid {
  sed -i -e "/\"language-less\": \".*\",/a \
              \"language-liquid\": \"${_language_liquid_ver}\"," package.json
}

export -f sed_liquid
