#!/bin/bash
# Wagashi — cargar firmware Broadcom si existe y no está ya cargado
FIRMWARE_SRC="/usr/share/wagashi/firmware/brcm"
FIRMWARE_DST="/usr/lib/firmware/brcm"
if [ -d "$FIRMWARE_SRC" ] && [ "$(id -u)" = "0" ]; then
    mkdir -p "$FIRMWARE_DST"
    cp "$FIRMWARE_SRC"/brcmfmac43602-pcie.bin "$FIRMWARE_DST"/ 2>/dev/null
    cp "$FIRMWARE_SRC"/brcmfmac43602-pcie.clm_blob "$FIRMWARE_DST"/ 2>/dev/null
    cp "$FIRMWARE_SRC"/brcmfmac43602-pcie.txcap_blob "$FIRMWARE_DST"/ 2>/dev/null
    cp "$FIRMWARE_SRC/brcmfmac43602-pcie.Apple Inc.-MacBookPro12,1.bin" "$FIRMWARE_DST/" 2>/dev/null
    if lsmod | grep -q brcmfmac; then
        modprobe -r brcmfmac 2>/dev/null
        sleep 1
        modprobe brcmfmac 2>/dev/null
    fi
fi
