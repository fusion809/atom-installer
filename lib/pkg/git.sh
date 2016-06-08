#!/bin/bash
function sed_git_plus {
  sed -i -e "/\"git-diff\": \".*\",/a \
              \"git-plus\": \"${_git_plus_ver}\"," package.json
}

export -f sed_git_plus

function sed_git_time {
  sed -i -e "/\"git-time-machine\": \".*\",/a \
              \"git-time-machine\": \"${_git_time_machine_ver}\"," package.json # git packages
}

export -f sed_git_time

function sed_git {
  sed_git_time
  sed_git_plus
}

export -f sed_git
