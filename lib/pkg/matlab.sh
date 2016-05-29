#!/bin/bash
function sed_matlab {
  sed -i -e "/\"language-makefile\": \".*\",/a \
              \"language-matlab\": \"${_language_matlab_ver}\"," package.json # MATLAB
}

export -f sed_matlab
