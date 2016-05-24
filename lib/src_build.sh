#!/bin/bash
function src_build {
  sed -i -e 's|MimeType=text/plain;|MimeType=application/javascript;application/json;application/postscript;application/x-csh;application/x-desktop;application/x-httpd-eruby;application/x-httpd-php;application/x-httpd-php3;application/x-httpd-php4;application/x-httpd-php5;application/x-latex;application/x-msdos-program;application/x-ruby;application/x-sh;application/x-shellscript;application/x-sql;application/x-tcl;application/x-tex;application/xhtml+xml;application/xml;application/xml-dtd;application/xslt+xml;text/css;text/csv;text/html;text/plain;text/xml;text/xml-dtd;text/x-asm;text/x-bibtex;text/x-boo;text/x-c++;text/x-c++hdr;text/x-c++src;text/x-c;text/x-chdr;text/x-csh;text/x-csrc;text/x-dsrc;text/x-diff;text/x-eiffel;text/x-fortran;text/x-go;text/x-haskell;text/x-java;text/x-java-source;text/x-lua;text/x-makefile;text/x-markdown;text/x-objc;text/x-pascal;text/x-perl;text/x-php;text/x-python;text/x-ruby;text/x-scala;text/x-scheme;text/x-sh;text/x-tcl;text/x-tex;text/x-vala;text/yaml;|g' \
         -e 's/GNOME;GTK;Utility;//g' \
         -e 's/Comment/Description/g' resources/linux/atom.desktop.in
  sed -i -e "/exception-reporting/d" \
	       -e "/metrics/d" \
         -e "s/language-gfm/language-gfm2/g" \
         -e "s/0.85.0/0.87.0/g" \
         -e 's/"language-gfm2": "0.87.0",/"language-gfm2": "0.87.0",\n    "language-liquid": "0.5.1",/g' \
         -e 's/"package-generator": "1.0.0",/"package-generator": "1.0.0",\n    "package-sync": "1.1.0",/g' package.json
  script/build
}

export -f src_build
