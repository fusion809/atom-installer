#!/bin/bash
function sed_priv {
  # Remove the exception-reporting & metrics packages
  sed -i -e "/exception-reporting/d" \
         -e "/metrics/d" package.json
}

export -f sed_priv
