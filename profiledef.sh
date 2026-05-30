#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="Wagashi"
iso_label="ARCH_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Nekki.mov <https://wagashi.rednek.org>"
iso_application="Wagashi Linux"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="wagashi"
buildmodes=('iso')
bootmodes=('bios.syslinux' 'uefi.grub')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '6' '-b' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/local/bin/hikaru"]="0:0:755"
  ["/usr/local/bin/dango"]="0:0:755"
  ["/usr/local/bin/hikaru-gui"]="0:0:755"
  ["/root/.config/autostart/hikaru.desktop"]="0:0:644"
  ["/root/Desktop/hikaru.desktop"]="0:0:755"
)
