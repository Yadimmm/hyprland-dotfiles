#!/bin/bash
LOCK="/tmp/wofi-powermenu.lock"
exec 9>"$LOCK"
flock -n 9 || exit 0

ICON_DIR="$HOME/.config/wofi/icons"

choice=$(
  printf "img:%s:text:Apagar\nimg:%s:text:Reiniciar\nimg:%s:text:Cerrar sesión\n" \
    "$ICON_DIR/power.png" \
    "$ICON_DIR/reboot.png" \
    "$ICON_DIR/logout.png" |
  wofi --dmenu --allow-images --columns 3 \
    --width 820 --height 260 \
    --style "$HOME/.config/wofi/powermenu.css" \
    --prompt ""
)

case "$choice" in
  *Apagar*) systemctl poweroff ;;
  *Reiniciar*) systemctl reboot ;;
  *Cerrar*) loginctl terminate-user "$USER" ;;
esac
