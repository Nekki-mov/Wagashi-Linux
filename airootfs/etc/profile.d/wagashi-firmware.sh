#!/bin/bash
# Wagashi — cargar firmware Broadcom si existe y no está ya cargado
FIRMWARE_SRC="/usr/share/wagashi/firmware/brcm"
FIRMWARE_DST="/usr/lib/firmware/brcm"
if [ -d "$FIRMWARE_SRC" ] && [ "$(id -u)" = "0" ]; then
    cp "$FIRMWARE_SRC"/* "$FIRMWARE_DST"/ 2>/dev/null
    if lsmod | grep -q brcmfmac; then
        modprobe -r brcmfmac 2>/dev/null
        sleep 1
        modprobe brcmfmac 2>/dev/null
    fi
fi
