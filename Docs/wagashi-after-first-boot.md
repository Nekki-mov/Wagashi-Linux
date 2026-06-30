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
| **Ayu** (KDE, 2026) | ✅ Functional | ✅ Original art (the lamps) | ✅ EN/ES/JA |
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
Ana. Mochi. Menma. Misae. The web. The repo.  
Year Zero was about existence. After The First Boot is about identity.

---

## The ecosystem — what's being built

Everything has a name. Everything has a reason. This is what's coming.

### Ana
*The guide.*

A graphical learning companion — not a tutorial, not a wizard, not a chatbot.  
A library. Always available. Never mandatory.

Four books:
- 📖 Basics
- 📖 When something isn't working
- 📖 I want to learn more
- 📖 Places worth visiting

Ana speaks in first person. Ana never makes people feel stupid.  
Ana is patient, warm, direct, curious, playful, spirited, optimistic, honest.  
Ana is for everyone. Including the person who just turned on a computer for the first time.

Three languages. EN/ES/JA. From day one.

See: `Docs/ANA.md`

### Mochi
*The face of dango.*

A graphical package manager — the friendly frontend to dango's engine.  
Search, browse, install. Categories. Descriptions. One click.

Covers: official Arch repos + AUR + Wagashi repo.  
Does not cover: Flatpak. Intentionally.

Named after mochi because it's the same family as dango — just softer, rounder, more approachable.

### Wagashi Repository
*Packages made here, distributed from here.*

A proper Arch-compatible package repository for Wagashi-native software.  
dango, Hikaru, Ana, Mochi — everything built for Wagashi lives here.

Hosted on Kotomi. Distributed via HTTPS.  
Included in `/etc/pacman.conf` out of the box.

### Menma
*Windows compatibility.*

A fork of Wine, deeply integrated and configured out of the box.  
The goal: first-class Windows application support, not "it might work."  
Named after Menma from Anohana — she's always there even when you can't see her.

### Misae
*A fork of WindowMaker.*

For when Mishio needs to grow into something of its own.  
Named after Misae Sagara from Clannad.

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

## Log — the wallpaper that fought back

*Late June 2026*

The Ayu wallpaper bug deserves its own paragraph, because it took an entire night and taught us more about how Plasma actually works than any documentation would have.

What looked like a one-line fix turned out to be five separate failures, stacked:

1. A stale `Wagashi-Ayu-Dark` package was still being installed by both `hikaru` and `hikaru-gui`, long after the decision had been made to keep only one wallpaper — the lamps, which work beautifully in both light and dark. Dark was removed entirely, from the repo and from both installers.
2. The `appletsrc` skel file was never reaching the installed system, because `useradd -m` copies from `/mnt/etc/skel/`, not from the live ISO's skel — and nothing was populating `/mnt/etc/skel/` before the user was created. Fixed by copying it explicitly, right before `useradd -m`, in both installers.
3. `LookAndFeelPackage=org.kde.breezedark.desktop` in `kdeglobals` was silently overriding the wallpaper with Breeze Dark's own default — solved by keeping `ColorScheme=BreezeDark` for the dark theme, without pulling in the full look-and-feel package.
4. Plasma assigns containment numbers dynamically. A hardcoded `[Containments][1]` in the skel `appletsrc` doesn't reliably match what Plasma generates on first login, which is why direct config editing kept failing.
5. The actual fix had already been written once before — for Sayuri, back on May 31st, as `wagashi-firstrun`: a small script that waits for the desktop to settle, then applies the wallpaper via `plasma-apply-wallpaperimage` with a `kwriteconfig6` fallback, registered as an autostart entry pointing at a fixed binary. It was ported to Ayu, adapted for its package-style wallpaper structure (`contents/images/`, not a flat file), wired into both `hikaru` and `hikaru-gui`, and registered in `profiledef.sh`.

Confirmed working via `fastfetch` and a clean install: Breeze Dark active, the lamps on the desktop, from the very first login.

**The lesson, again:** when something has already been solved once in another edition, look there first. We didn't, and it cost a night.

**Still open, intentionally parked:** `sync-sddm-wallpaper.sh`, which is meant to mirror the desktop wallpaper onto the SDDM login screen, doesn't currently work — and it's not worth chasing. The SDDM theme is getting fully replaced during ricing, with its own background baked into the QML. Whether that future theme should sync dynamically with the desktop wallpaper or stay fixed is a ricing decision, not a bug.

### Also shipped this session

- **GPU driver autodetection** (`_host_gpu_packages()`) in both installers: reads `lspci` and installs the right driver for the detected card — `nvidia-open-dkms` for RTX/GTX 16xx, `nvidia-dkms` for GTX 900–10xx/Titan, `nvidia-470xx-dkms` (AUR) for older NVIDIA, `vulkan-radeon` + `libva-mesa-driver` for AMD, `vulkan-intel` + `intel-media-driver` for Intel. No prompts, no visible extra steps — it just happens during install.
- **Broadcom WiFi suspend/resume hook** (`wagashi-broadcom-wifi-fix`), a `systemd-sleep` script that reloads `brcmfmac` after resume. This targets a known issue on the MacBook Pro 12,1 and similar hardware with the Broadcom BCM4352 chipset. Confirmed: `brcmfmac` (in-kernel) is the correct driver for this hardware — `broadcom-wl` would be a regression, not an upgrade, and was deliberately not used.

---

## Ricing plan

This is what we're building toward. Not a deadline — a direction.

### Wagashi Ayu (KDE, 2026)
The primary edition. The one people will screenshot.

- [x] Wallpaper — the lamps. Final. Works in both light and dark.
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
