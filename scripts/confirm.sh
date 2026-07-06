#!/bin/sh
# Runs inside a real herdr pane (it has a TTY). Asks y/n once; on "y" closes the
# target pane, then exits. Exiting dismisses this overlay automatically.
set -u

herdr="${HERDR_BIN_PATH:-herdr}"
target="${HERDR_TARGET_PANE_ID:-${HERDR_PANE_ID:-}}"

printf 'Close this pane? (y/n): '

# Read a single key without echoing. Restore the terminal on any exit path.
saved=''
if saved=$(stty -g 2>/dev/null); then
  trap 'stty "$saved" 2>/dev/null || true' EXIT INT TERM
  stty -echo -icanon min 1 time 0 2>/dev/null || true
  key=$(dd bs=1 count=1 2>/dev/null)
else
  # No TTY available: fall back to a normal line read.
  key=$(read line && printf '%s' "$line")
fi
printf '\n'

case "$key" in
  y|Y)
    if [ -n "$target" ]; then
      "$herdr" pane close "$target" >/dev/null 2>&1 || true
      printf 'closed.\n'
    fi
    ;;
  *)
    printf 'cancelled.\n'
    ;;
esac
