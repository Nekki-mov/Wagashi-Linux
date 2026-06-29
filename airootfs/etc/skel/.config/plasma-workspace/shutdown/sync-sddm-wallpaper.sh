#!/bin/bash
SDDM_BG_TARGET="/usr/share/sddm/themes/wagashi/backgrounds/current.jpg"
WALLPAPER=$(kreadconfig6 --file plasma-org.kde.plasma.desktop-appletsrc \
    --group "Containments" --group "1" --group "Wallpaper" \
    --group "org.kde.image" --group "General" --key "Image" 2>/dev/null)
WALLPAPER="${WALLPAPER#file://}"
if [ -z "$WALLPAPER" ]; then
    exit 0
fi
if [ -d "$WALLPAPER" ]; then
    REAL_IMAGE=$(find "$WALLPAPER/contents/images" -type f \( -iname "*.jpg" -o -iname "*.png" \) 2>/dev/null | sort -V | tail -n1)
    if [ -z "$REAL_IMAGE" ]; then
        exit 0
    fi
    WALLPAPER="$REAL_IMAGE"
fi
if [ ! -f "$WALLPAPER" ]; then
    exit 0
fi
cp "$WALLPAPER" "$SDDM_BG_TARGET" 2>/dev/null
exit 0
