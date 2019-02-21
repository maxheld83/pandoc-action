#!/bin/sh

set -e

mkdir $OUT_DIR

# "args" from main.workflow get append to below call
sh -c "pandoc $*"
