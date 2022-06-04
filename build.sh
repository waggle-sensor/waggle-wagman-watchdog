#!/bin/bash -e

# Note: keeping old "sage" name to ensure Debian name matches in upgrades

docker run --rm \
  -e NAME="sage-wagman-watchdog" \
  -e DESCRIPTION="Waggle NX Wagman Watchdog Service" \
  -v "$PWD:/repo" \
  waggle/waggle-deb-builder:latest