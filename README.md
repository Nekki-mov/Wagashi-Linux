# Wagashi Linux — LXQt Community Edition

**Lightweight. For the computer someone was about to throw away.**

This is Wagashi Linux with LXQt — fast, modest, and respectful of old hardware.  
It's community-maintained. Nekki built the foundation and stepped back.  
What happens next is up to you.

---

## What's here

A complete, bootable Arch-based system with:

- **linux-zen** kernel
- **LXQt** desktop
- **LightDM** as the display manager
- **Hikaru CLI** — the conversational installer
- **dango** — the package manager
- The full Wagashi soul: branding, Plymouth, GRUB, Yasashii voice

Lean by design. Nothing that doesn't earn its place.

---

## The philosophy here

A slower machine is not a worthless machine.  
It's a machine that deserves better software.

Wagashi Linux believes that. This edition proves it.

If it still turns on, it deserves a second chance.

---

## Contributing

This edition is yours to build on.  
Read `VISION.md` before you start — it's the emotional bible of the project.  
The Yasashii Protocol applies here too.

Some specific things that would make this edition better:

- A lighter default application set
- Power management tuned for old hardware
- Testing on real machines from 2010–2015
- Documentation for contributors

If you build something good, open a PR.  
If you're not sure where to start, open an issue.

The door is open.

---

## Building

```bash
git checkout lxqt-community
sudo mkarchiso -v -w ~/wagashi-work -o ~/wagashi-out ~/wagashi
```

---

*Made by Nekki.mov, for everyone sensitive.*  
*Your computer, always yours.*
