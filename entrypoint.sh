#!/bin/sh

set -e

if ! [[ -z "${OUT_DIR}" ]]; then
  echo "Creating output directory $OUT_DIR..."
  mkdir --parent $OUT_DIR
fi

# "args" from main.workflow get append to below call
sh -c "pandoc $*"
