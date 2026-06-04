# Wagashi Linux — Mishio (Nostalgia Edition)

**1996. For people who think computers peaked aesthetically sometime around 1994.**

This is Wagashi Linux with WindowMaker.  
NeXTSTEP-inspired. Retrofuturist. Coherent.  
Technology as something worth caring about — and keeping.

---

## What's here

A complete, bootable Arch-based system with:

- **linux-zen** kernel
- **WindowMaker 0.96** desktop
- **LightDM** as the display manager
- **Hikaru CLI** — the conversational installer in English, Spanish, and Japanese
- **dango** — the package manager with a Yasashii voice
- Custom Wagashi theming adapted for the WindowMaker aesthetic
- Wallpapers adapted for 4:3, 16:9, and 16:10 screens — original art by Nekki.mov

---

## The aesthetic

WindowMaker doesn't try to disappear.  
It has opinions. Sharp corners, dock icons, a certain weight to everything.

Wagashi Linux meets it halfway:  
the soul stays the same — calm, intentional, yours —  
but the shape fits the tool.

1996 is the year computing had opinions.  
Mishio still does.

---

## Installing

Boot the ISO. WindowMaker loads with the Wagashi wallpaper.  
Hikaru opens automatically in a terminal. It asks, you answer. That's the whole thing.

---

## Technical notes

- WindowMaker is packaged locally — compiled from AUR and shipped in the ISO
- LightDM handles login on the installed system
- `wmaker.inst` runs automatically on first login to initialize the GNUstep environment
- ⚠️ Two spaces in `WorkspaceBack =  (solid` — this is not a typo. Don't touch it.

---

## Building

```bash
git checkout Mishio-Nostalgia
sudo mkarchiso -v -w ~/wagashi-work -o ~/wagashi-out ~/wagashi
```

---

*Made by Nekki.mov, for everyone sensitive.*  
*Your computer, always yours.*
