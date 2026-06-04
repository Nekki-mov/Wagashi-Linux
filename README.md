# Wagashi Linux — Ayu (KDE Edition)

**2026. The primary edition. The one people will screenshot — for the right reasons.**

This is Wagashi Linux with KDE Plasma 6 on Wayland.  
Soft. Warm. Carefully tuned. Modern without being cold.  
It exists now. It feels like now.

---

## What's here

A complete, bootable Arch-based system with:

- **linux-zen** kernel
- **KDE Plasma 6** on Wayland
- **SDDM** as the display manager
- **Hikaru GUI** — a graphical installer that feels like arriving somewhere, in English, Spanish, and Japanese
- **dango** — a package manager that talks like a person
- **Ushio** — virtualization with GPU passthrough, configured at install time
- **Plymouth** splash screen — the dango, OLED black, yours
- **GRUB** with a custom Wagashi theme

---

## Installing

Boot the ISO. Hikaru starts automatically.  
It'll ask you a few questions. Nothing complicated.

When it's done, it'll say: *welcome home.*  
That's it.

---

## What Hikaru sets up

- User, password, hostname
- Keyboard layout and timezone
- Disk partitioning — simple, separated, or encrypted
- Purpose-based package selection — everyday, creative, development, gaming, or everything
- Ushio virtualization with optional GPU passthrough
- Firewall and automatic updates
- Plymouth, GRUB theme, branding — all of it

You don't have to think about any of that. Hikaru does.

---

## dango

```bash
sudo dango -S firefox        # install
sudo dango -R firefox        # remove
sudo dango -Syu              # update everything
sudo dango -Ss firefox       # search
```

Pacman and AUR, unified. No Flatpak. Intentionally.

---

## Building

```bash
git checkout Ayu-KDE
sudo mkarchiso -v -w ~/wagashi-work -o ~/wagashi-out ~/wagashi
```

---

*Made by Nekki.mov, for everyone sensitive.*  
*Your computer, always yours.*
