# Wagashi Linux — Nayuki (LXQt Community Edition)

**2008. Lightweight. For the computer someone was about to throw away.**

This is Wagashi Linux with LXQt — fast, modest, and respectful of old hardware.  
It's community-maintained. Nekki built the foundation and stepped back.  
What happens next is up to you.

2008 is the year people started throwing away computers that still worked.  
Nayuki is for those computers. And for the people who kept them.

---

## What's here

A complete, bootable Arch-based system with:

- **linux-zen** kernel
- **LXQt** desktop
- **LightDM** as the display manager — no terminal on first boot
- **Hikaru CLI** — the conversational installer in English, Spanish, and Japanese
- **Hikaru GUI** — the graphical installer, Dango Family palette — English, Spanish, and Japanese
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

## Who this is for

People who don't know much about Linux but have an old computer and want to use it.  
People who know a lot about Linux and want something lightweight and principled.  
Maintainers who want to build something good on a solid foundation.

All of the above.

---

## Contributing

This edition is yours to build on.  
Read `VISION.md` before you start — it's the emotional bible of the project.  
The Yasashii Protocol applies here too.

Some specific things that would make this edition better:

- Power management tuned for old hardware and laptops
- Testing on real machines from 2010–2015
- A lighter default application set where possible
- Documentation for contributors

If you build something good, open a PR.  
If you're not sure where to start, open an issue.

The door is open.

---

## Building

```bash
git checkout Nayuki-LXQt
sudo mkarchiso -v -w ~/wagashi-work -o ~/wagashi-out ~/wagashi
```

---

*Made by Nekki.mov, for everyone sensitive.*  
*Your computer, always yours.*
