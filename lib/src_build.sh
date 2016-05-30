#!/bin/bash

function src_build {

  until ./script/build; do :; done
}

export -f src_build
