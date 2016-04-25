#!/bin/bash

# Script for easy pushing changes to repo
./perms.sh
git add --all
git commit -m "$1"
git push origin master
