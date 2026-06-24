#!/usr/bin/env bash
#
# Wagashi Linux — Ayu (KDE) post-install customization
# Executed automatically inside the chroot by archiso during ISO build.

set -e -u

# ─── SDDM background sync group ────────────────────────────────────────────
# Allows the logged-in user to write the current wallpaper into SDDM's
# background folder without needing pkexec at logout time.

groupadd -f sddm-bg

mkdir -p /usr/share/sddm/themes/wagashi/backgrounds
chgrp sddm-bg /usr/share/sddm/themes/wagashi/backgrounds
chmod 775 /usr/share/sddm/themes/wagashi/backgrounds

# Seed an initial background so SDDM has something before first logout
cp /usr/share/wallpapers/Wagashi-Ayu-Light/contents/images/1920x1080.jpg \
   /usr/share/sddm/themes/wagashi/backgrounds/current.jpg 2>/dev/null || true

# ─── Add the live/default user to the sddm-bg group ────────────────────────
# Hikaru creates the real user during install; this just ensures any
# user created from /etc/skel inherits group membership correctly.
# (Actual usermod for the installed user happens in Hikaru's post-install step.)

echo "Wagashi customize_airootfs.sh completed."
