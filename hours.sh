#!/bin/bash

die() {
  echo "$@" >&2
  exit 1
}

CONFIG_FILE="$HOME/.worklog"
test -f "$CONFIG_FILE" || \
  die "no config file found; run \`touch $CONFIG_FILE\` to correct this"

. "$CONFIG_FILE"
test "$DATA_DIR" != "" || \
  die "DATA_DIR variable not defined; please add it to $CONFIG_FILE"

test -d "$DATA_DIR" || \
  die "DATA_DIR=$DATA_DIR is not a directory; run \`mkdir -p $DATA_DIR\` to correct it"

PRG=$0

usage() {
  echo "Usage: $PRG command (arguments...)"
  echo ""
  echo "  Commands:"
}

CMD=`shift`

case "$CMD" in
  *)
    echo "unknown command: $CMD" >&2
    echo "" >&2
    usage >&2
    exit 1
    ;;
esac

