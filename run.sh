#!/usr/bin/env bash
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
FLAKE_PATH="$SCRIPT_DIR"

UPGRADE=""
if [ "$1" = "-u" ]; then
  UPGRADE="--upgrade"
  shift
fi

exec nixos-rebuild switch $UPGRADE --flake "${FLAKE_PATH}#default" --impure
