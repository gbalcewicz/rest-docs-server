#!/bin/bash

DOCS_DIR=/docs
nohup inotifywait -qmr -e close_write -e create -e delete --format "%w%f" $1 |
  while read file; do
      DOC_DIR=$(echo ${file#$DOCS_DIR} | cut -d "/" -f2)
      flock -n /tmp/dockbuild.${DOC_DIR}.lock -c "/bin/build-docs ${DOC_DIR}";
  done > /dev/null 2>&1 &
