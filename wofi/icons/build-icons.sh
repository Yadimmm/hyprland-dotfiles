#!/bin/bash
set -e

DIR="$HOME/.config/wofi/icons"

for name in power reboot logout; do
  svg="$DIR/$name.svg"
  png="$DIR/$name.png"

  # Si no existe PNG o el SVG es más nuevo, regenera
  if [[ ! -f "$png" || "$svg" -nt "$png" ]]; then
    rsvg-convert -w 192 -h 192 "$svg" -o "$png"
  fi
done
