# Wagashi Linux — Monochrome Edition
**The quiet one. Black, grey, and one color that matters.**

This is Wagashi Linux with KDE Plasma 6 on Wayland — stripped of noise,  
built for people who find comfort in stillness.

---

## What's here

A complete, bootable Arch-based system with:

- **linux-zen** kernel
- **KDE Plasma 6** on Wayland
- **SDDM** with the Monochrome wallpaper
- **Hikaru** — a graphical installer that feels like arriving somewhere
- **dango** — a package manager that talks like a person
- **Ushio** — virtualization with GPU passthrough, configured at install time
- **Plymouth** splash screen — the dango, OLED black, yours
- **GRUB** with a custom Wagashi theme
- **Bitstream Vera Sans** — because good type is invisible until it isn't
- **Wagashi color scheme** — black, greys, white, and coral where it counts

---

## What makes Monochrome different

Everything is black. Not dark grey. Not navy. Black.  
The only color is coral — #e8a0a0 — and it appears exactly where it needs to.  
Selections. Focus. The things that matter.

The wallpaper is a girl with a pink umbrella walking a Japanese street at night.  
Everything else is monochrome. She isn't.  
That's the whole idea.

---

## Installing

Boot the ISO. Hikaru starts automatically.  
It'll ask you a few questions. Nothing complicated.

When it's done, it'll say: *Welcome home.*  
That's it.

---

## What Hikaru sets up

- User, password, hostname
- Keyboard layout and timezone
- Disk partitioning — simple, separated, or encrypted
- Purpose-based package selection — everyday, creative, development, gaming, or everything
- Ushio virtualization with optional GPU passthrough
- Firewall
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
git checkout monochrome
sudo mkarchiso -v -w ~/wagashi-work -o ~/wagashi-out ~/wagashi
```

---

*Made by Nekki.mov, for everyone sensitive.*  
*Your computer, always yours.*
