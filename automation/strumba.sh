#!/bin/bash
set -uo pipefail

silently() { "$@" >/dev/null 2>&1; }

concurrency="$1"
interval="$2"

declare -a routes=(index.html milhappy.html milsad.html)

while :; do
  for i in $(eval "echo {1..$concurrency}"); do
    echo "request $i"
    echo curl -sS http://localhost:4000/${routes[$(( $RANDOM % 3 ))]} &
  done

  wait
  sleep "$interval"
done
