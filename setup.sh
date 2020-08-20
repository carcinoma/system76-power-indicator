#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root." 2>&1
    exit 1
fi

LIB_DIR="/usr/lib/system76-power-indicator"
AUTOSTART_FILE="/etc/xdg/autostart/system76-power-indicator.desktop"

cp -R usr /
cp -R etc /
chown -R root:root ${LIB_DIR}
chmod 755 ${LIB_DIR}
chmod 755 ${LIB_DIR}/icons
chmod 644 ${LIB_DIR}/icons/*
chmod 755 ${LIB_DIR}/system76-power-indicator
chown root:root ${AUTOSTART_FILE}
chmod 644 ${AUTOSTART_FILE}

echo "Autostart System76 Power Indicator?"
select yn in "Yes" "No"; do
    case ${yn} in
        Yes ) 	break;;
        No ) 	rm -f ${AUTOSTART_FILE}
        		break;;
    esac
done

echo -e "\nTo start System76 Power Indicator now, use the command\n"
echo -e "\t$LIB_DIR/system76-power-indicator & disown"

echo -e "\nSetup complete."
exit 0
