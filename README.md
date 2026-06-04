# Wagashi Linux

**Made by Nekki.mov, for everyone sensitive.**

Wagashi Linux is an Arch-based Linux distribution built around a single idea:  
your computer should feel like somewhere you actually want to be.

Not a hacker tool. Not a rice showcase. Not a statement.  
A place. Calm, intentional, and quietly yours.

---

## What's in here

This repository contains the full source for every edition of Wagashi Linux.  
Each branch is its own thing — same soul, different shape.

| Branch | Edition | Year | Desktop |
|---|---|---|---|
| `Ayu-KDE` | **Wagashi Ayu** | 2026 | KDE Plasma 6, Wayland |
| `Mishio-Nostalgia` | **Wagashi Mishio** | 1996 | WindowMaker 0.96 |
| `Sayuri-Monochrome` | **Wagashi Sayuri** | 2077 | KDE Plasma 6, Wayland — Monochrome |
| `Nayuki-LXQt` | **Wagashi Nayuki** | 2008 | LXQt |

`main` contains what's common to all editions: the philosophy, the tools, the voice.

---

## The ecosystem

Everything has a name. Everything has a reason.

| Name | Role |
|---|---|
| **Wagashi Linux** | The OS |
| **dango** | Package manager — wraps pacman and yay, Yasashii voice |
| **Hikaru** | Installer — CLI and GUI, guided and calm |
| **Ushio** | Virtualization — QEMU-KVM, GPU passthrough ready |
| **Ana** | System guide — named after the person who made this possible |
| **Yasashii Protocol** | How the system speaks to you |

---

## Philosophy

Technology with soul.  
Every old computer deserves a second life.  
Nothing should make you feel stupid.  
Not built to impress — built to be lived in.

If it doesn't feel Yasashii, it's not done yet.

---

## Building

You'll need `archiso` and a machine running Arch Linux.

```bash
git checkout Ayu-KDE   # or Mishio-Nostalgia, Sayuri-Monochrome, Nayuki-LXQt
sudo mkarchiso -v -w ~/wagashi-work -o ~/wagashi-out ~/wagashi
```

Each branch builds its own ISO independently.

---

## Contributing

Read `VISION.md` first. It's the emotional bible of the project.  
If something contradicts it, change the thing — not the document.

The Yasashii Protocol applies to code, commits, and conversations.  
Be honest. Be brief. Be kind.

---

*Your computer, always yours.*
