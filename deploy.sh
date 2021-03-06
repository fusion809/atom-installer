#!/bin/bash

# Script for easy pushing changes to repo
./perms.sh
cd resources
sha512sum *.patch > Manifest
cd -
git add --all
if [[ -n $1 ]]; then
  git commit -m "$1"
else
  git commit -m "Updating"
fi
git push origin master
