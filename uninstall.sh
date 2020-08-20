#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root." 2>&1
    exit 1
fi

LIB_DIR="/usr/lib/system76-power-indicator"
AUTOSTART_FILE="/etc/xdg/autostart/system76-power-indicator.desktop"

rm -f ${AUTOSTART_FILE}
rm -rf ${LIB_DIR}

echo "Uninstall complete."
exit 0
