#!/bin/bash
# Wagashi Linux — Sync current Plasma wallpaper to SDDM
# Runs on logout via plasma-workspace shutdown hook
# Requires: /usr/share/sddm/themes/wagashi/backgrounds writable by group 'sddm-bg'

SDDM_BG_TARGET="/usr/share/sddm/themes/wagashi/backgrounds/current.jpg"

# Find the current wallpaper from Plasma's config
WALLPAPER=$(kreadconfig6 --file plasma-org.kde.plasma.desktop-appletsrc \
    --group "Containments" --group "1" --group "Wallpaper" \
    --group "org.kde.image" --group "General" --key "Image" 2>/dev/null)

# Strip file:// prefix if present
WALLPAPER="${WALLPAPER#file://}"

if [ -z "$WALLPAPER" ] || [ ! -f "$WALLPAPER" ]; then
    exit 0
fi

# Copy directly — no privilege escalation needed, the target dir
# is writable by the 'sddm-bg' group (see install step)
cp "$WALLPAPER" "$SDDM_BG_TARGET" 2>/dev/null

exit 0
