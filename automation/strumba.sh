#!/bin/bash
set -uo pipefail

silently() { "$@" >/dev/null 2>&1; }

concurrency="$1"

declare -a routes=("" "milhappy" "milsad")
while :; do
  for i in $(eval "echo {1..$concurrency}"); do
    echo curl -sS http://localhost:4000/${routes[$(( $RANDOM % 3 ))]}
    silently curl -sS http://localhost:4000/${routes[$(( $RANDOM % 3 ))]} &
  done

  echo "waiting"
  wait
done
