#!/bin/bash
# Wagashi — aplica wallpaper por defecto en el primer login y se autoelimine
sleep 5
WALLPAPER=$(find /usr/share/wallpapers/Wagashi-Ayu-Light/contents/images -type f \( -iname "*.jpg" -o -iname "*.png" \) | sort -V | tail -n1)
if [ -n "$WALLPAPER" ]; then
    qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
var allDesktops = desktops();
for (var i = 0; i < allDesktops.length; i++) {
    var d = allDesktops[i];
    d.wallpaperPlugin = 'org.kde.image';
    d.currentConfigGroup = ['Wallpaper', 'org.kde.image', 'General'];
    d.writeConfig('Image', 'file://$WALLPAPER');
}
"
fi
rm -- "$0"
rm ~/.config/autostart/wagashi-set-wallpaper.desktop
