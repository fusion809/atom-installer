#!/bin/bash

# 64-bit RPM binary can be used to install Atom on Mageia, but it requires one to
# uninstall the core program, apm, as it conflicts with Atom's /usr/bin/apm executable
mageia_build
