# Wagashi Linux — After The First Boot
*June 2026 — onwards*

> *"Computing can also be an act of care."*

---

## Where we left off

Year Zero ended with a commit message.

```
Year Zero — cerrado. お帰りなさい。
```

That's not how most projects close a chapter.  
Most projects close chapters with version numbers, changelogs, release notes.  
We closed ours with "welcome home" in Japanese.

That tells you everything you need to know about where we're going.

---

## What Year Zero taught us

Year Zero was supposed to be a proof of concept.  
It turned into something else.

By the end of it, we had:
- Four editions with names, years, and souls
- An installer that looks like "the opening screen of a visual novel"
- A firewall guarded by a gorilla
- A package manager named after a round sweet
- Documentation that made someone cry while listening to Girls Dead Monster

None of that was planned.  
All of it was inevitable.

The lesson: **Wagashi Linux doesn't get decided. It gets discovered.**

---

## The state of things

As After The First Boot begins, this is what exists:

| Edition | Status | Wallpaper | i18n |
|---|---|---|---|
| **Ayu** (KDE, 2026) | ✅ Functional | Pending | ✅ EN/ES/JA |
| **Mishio** (WindowMaker, 1996) | ✅ Functional | ✅ Original art | ✅ EN/ES/JA |
| **Sayuri** (Monochrome, 2077) | ✅ Functional | ✅ Original art | ✅ EN/ES/JA |
| **Nayuki** (LXQt, 2008) | ✅ Functional | ✅ Original art | ✅ EN/ES/JA |

All four editions boot. All four install. All four speak three languages.  
None of them are riced yet.

That's the work.

---

## What comes next

After The First Boot is about three things:

**1. Ricing**  
Making Wagashi Linux look like what it already feels like.  
This is where the color themes stop being documentation and start being reality.

**2. The system finding its voice**  
i18n for dango. i18n for system messages. The Yasashii Protocol, everywhere.  
Not just the installer — the whole thing.

**3. The things we promised**  
Ana. Menma. Misae. The web. The repo.  
Year Zero was about existence. After The First Boot is about identity.

---

## A note on how this document works

Same as Year Zero.  
Honest. Chronological. Unfiltered.

If something breaks spectacularly, it goes in.  
If something works on the first try, that also goes in — with appropriate suspicion.  
If someone has an opinion about the firewall being called "the gorilla's domain," that goes in too.

The bugs section will grow.  
The philosophy section will not change.  
The humor will be earned.

---

## Ricing plan

This is what we're building toward. Not a deadline — a direction.

### Wagashi Ayu (KDE, 2026)
The primary edition. The one people will screenshot.

- [ ] Wallpaper — original art (boceto: Lawson at night, snow, two silhouettes, dangos on a bench)
- [ ] KDE color scheme — Clannad · Sunfield or custom Wagashi palette
- [ ] SDDM theme — Wagashi branded, warm
- [ ] Conky — optional, warm tones, minimal
- [ ] Firefox/VLC — Wagashi-flavored defaults

### Wagashi Mishio (WindowMaker, 1996)
Already has strong bones. Needs dockapps.

- [ ] wmclock — analog, NeXTSTEP style
- [ ] wmmon or wmcpuload — CPU monitor
- [ ] wmnet — network traffic
- [ ] wmix — volume control
- [ ] wmbattery — for laptops

### Wagashi Sayuri (KDE Monochrome, 2077)
The one that looks like a future that hasn't arrived yet.

- [ ] KDE theme — full Wagashi Monochrome, replace Breeze Dark
- [ ] Monochromatic icons
- [ ] Konsole — transparency optional, always Bitstream Vera Mono
- [ ] Conky — Bitstream Vera Mono, coral for values, silence everywhere else
- [ ] SDDM — QML with looping video background (monochrome rain, Japanese street, one pink umbrella)

### Wagashi Nayuki (LXQt, 2008)
For the computer someone was about to throw away.

- [ ] LXQt theme — Clannad · Dango Family (light)
- [ ] LXQt theme — Clannad · Firefly (dark)
- [ ] Desktop icons — pcmanfm-qt configured correctly
- [ ] Power management — tuned for old hardware

---

## Infrastructure

| Machine | Role | Notes |
|---|---|---|
| **Kotomi** | Proxmox server | Still has more RAM than active neurons at 3AM |
| **Tomoya** | Dev VM | Arch + LXQt, SSH, IP 192.168.1.107 |
| **Kanade** | Test VM | ISO testing |
| **Sanae** | Retro PC (future) | Candidate for real-hardware Mishio testing |

---

*Made by Nekki.mov, for everyone sensitive. 🍡*
