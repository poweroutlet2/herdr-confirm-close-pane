#!/bin/sh
# Action entrypoint. Runs without a TTY, so it just opens the confirmation
# overlay and hands the focused pane id (the pane we want to close) to it via
# HERDR_TARGET_PANE_ID.
set -eu

herdr="${HERDR_BIN_PATH:-herdr}"
target="${HERDR_PANE_ID:-}"

exec "$herdr" plugin pane open \
  --plugin confirm-close-pane \
  --entrypoint confirm \
  --placement overlay \
  --focus \
  --env "HERDR_TARGET_PANE_ID=$target"
