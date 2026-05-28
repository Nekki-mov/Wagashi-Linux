# Wagashi Linux — Year Zero
*28 de mayo de 2026. El día en que esto se volvió real.*

---

## El momento

```
Wagashi Linux 7.0.10-zen1-1-zen (tty1)

wagashi login: root (automatic login)

Welcome to Wagashi Linux.
Your computer, always yours.

* To install, run: hikaru
* For Wi-Fi: iwctl
* Ethernet should work automatically.

Made by Nekki.mov, for everyone sensitive.
wagashi#
```

Eso apareció en pantalla. En una VM real. Desde cero.

---

## Lo que se construyó en un día

### El nombre
Empezamos con DangOS. Pasamos por Yasashii. Llegamos a **Wagashi Linux** — y encajó sin esfuerzo. No suena a distro. Suena a lugar.

### El ecosistema
Todo tiene nombre. Todo tiene origen. Todo viene de Key/Visual Arts.

| Nombre | Rol | Origen |
|---|---|---|
| **Wagashi Linux** | El sistema operativo | Wagashi — dulces japoneses tradicionales |
| **dango** | Package manager | Dango — Clannad |
| **Hikaru** | Installer | Sora no Hikaru — Clannad OST |
| **Ushio** | Virtualización | Ushio — Clannad |
| **Misae** | Fork de WindowMaker | Misae Sagara — Clannad |
| **Menma** | Fork de Wine | Menma — Anohana |
| **Yasashii Protocol** | Filosofía de comunicación | Yasashii (優しい) — gentil, amable |

### Las ediciones

Cuatro sabores del mismo lugar:

| Rama | Nombre | Desktop | Para quién |
|---|---|---|---|
| `kde` | Wagashi Linux | KDE Plasma 6 en Wayland | La edición principal |
| `windowmaker` | Wagashi Nostalgia | WindowMaker | Para los que piensan que 1994 fue un buen año |
| `monochrome` | Wagashi Monochrome | KDE monocromático | Tecnología como arte sin color |
| `lxqt-community` | Wagashi LXQt | LXQt | Hardware rescatado, mantenido por la comunidad |

### Lo que funciona hoy

**ISO KDE arrancable** con linux-zen, branding Wagashi completo en motd y os-release.

**ISO WindowMaker arrancable** — Wagashi Nostalgia. WindowMaker compilado desde AUR e incluido como paquete local. Arranca con autologin en TTY1, lanza WindowMaker via startx, abre Hikaru CLI en Sakura automáticamente.

**GRUB theme propio** — "Wagashi Linux" en wagashi-36.pf2, "your computer, always yours." susurrado debajo, selección en coral #e8a0a0, negro OLED puro. Sin imágenes — GRUB y los PNGs tienen una historia complicada.

**Plymouth splash screen** — el dango rosa centrado, "Wagashi Linux", "your computer, always yours." Negro OLED puro.

**Hikaru CLI** — installer conversacional completo. Red, usuario, teclado, timezone, purpose, disco, Ushio, firewall. Habla como una persona. Instala Wagashi Linux de verdad. Ahora con GPU passthrough funcional.

**Hikaru GUI** — installer gráfico en PyQt6. Negro OLED. Dango emoji. 12 pantallas. QThread para que la UI nunca se congele. Log Yasashii con las últimas 3 frases — sin frío, sin terminal. Incluye purpose-based package selection y Ushio completo.

**dango v0.2** — package manager con personalidad. Integra pacman y yay. Detecta si está en el live y se comporta distinto. `-Sy` para el live, `-Syu` con aviso, `-Ql`, `-Qi`, `-Qo`, `-Scc`. Sin Flatpak. Intencionalmente.

**Ushio** — GPU passthrough funcional. NVIDIA con vendor-id patch, AMD limpio, auto con detección y pregunta si hay ambigüedad. IOMMU configurado automáticamente según CPU.

**KDE Plasma 6 en Wayland** con autologin via SDDM. Welcome Center deshabilitado en el live.

**WindowMaker** arrancando en el live con autologin TTY1 + startx + wmaker.inst automático.

**Hikaru en Sakura** — porque xterm existe pero no tiene por qué ser lo que la gente ve.

**GitHub** — repositorio público con 5 ramas, READMEs individuales por edición, VISION.md como biblia emocional del proyecto.

---

## La filosofía que lo sostiene

**Wagashi Linux** — el lugar.  
**Yasashii Protocol** — cómo te habla el lugar.

> *"Not what it does. How it speaks."*

> *"If it doesn't feel Yasashii, it's not done yet."*

> *"If it still turns on, it deserves a second chance."*

> *"Your computer, always yours."*

> *"installation should feel like arriving somewhere, not surviving something."*

> *"Not built to impress — built to be lived in."*

> *"Silence is a design choice."*

---

## Los fails del año cero

Porque también forman parte de la historia:

- DangOS sonaba a "dang it". Lo cambiamos.
- El GRUB theme no cargaba. Tardamos horas en descubrir que GRUB no soporta PNGs con canal alpha.
- El dango era 1536x1024. Lo redimensionamos varias veces hasta que dejó de ser gigante o microscópico.
- `/tmp` se llenó compilando KDE. Dos veces.
- `plasma-wayland-session` ya no existe en KDE 6. Aprendido.
- Hikaru tenía un error de indentación que lo rompía todo. Lo reescribimos entero.
- El primer boot del sistema instalado salió en negro. Era el driver VirtIO de la VM.
- `ufw enable` dentro de un chroot sin systemd se quedaba esperando para siempre. `--force` lo arregló.
- Hikaru GUI bloqueaba la UI entera durante la instalación. Reescrito con QThread.
- El GRUB del sistema instalado seguía usando el theme.txt del live con PNGs. `grub-mkconfig` sobreescribía el nuestro. Solución: escribir el theme.txt *después* de `grub-mkconfig`.
- `select_c.png` era colormap de 1 bit después de convertirlo. Regenerado desde cero con el color coral.
- WindowMaker necesita `wmaker.inst` antes del primer arranque o falla silenciosamente. Nadie lo documenta.
- LightDM no hace autologin de root sin modificar PAM. Cambiamos a TTY1 + startx. Más simple. Más honesto.
- `wmaker.desktop` que pusimos en airootfs entraba en conflicto con el del paquete windowmaker. Borrado.
- La ISO se llamaba "Wagashi Nostalgia" con espacio. Renombrada a "Wagashi-Nostalgia".

---

## La banda sonora del año cero

Girls Dead Monster — Thousand Enemies, sonando mientras WindowMaker arrancaba por primera vez.  
LiSA. VISUAL ARTS / Key. La coherencia era perfecta y no fue planeada.

---

## Las capturas del año cero

**Captura 1 — Hikaru GUI, primera pantalla:**
```
    🍡

  Hikaru
  Light of the sky.
  Let's set things up properly.

                          [ Let's begin ]
```

**Captura 2 — GRUB del sistema instalado:**
```
        Wagashi Linux

   your computer, always yours.

        Wagashi Linux          ← coral
        Advanced Options
        UEFI Firmware Settings
```

**Captura 3 — Hikaru en Sakura sobre WindowMaker:**
```
  ✦ Hikaru
    Light of the sky.

  ✦ Welcome. Let's set up your new computer.
  ✦ I'll ask you a few questions. Nothing complicated.
  ✦ First, let's check your connection.
  ✦ You're connected. Good.
  ✦ Now, let's talk about you.
    What's your username? (lowercase, no spaces) →
```

Eso existió. Sobre WindowMaker. En 2026.

---

## El roadmap que salió de aquí

- **Misae** — fork de WindowMaker. Wayland desde el día uno. Discreta, sólida, lleva años ahí.
- **Menma** — fork de Wine. Presente aunque no debería estarlo. Hace que las cosas funcionen.
- Rice visual de todas las ediciones — cuando estén estables
- Repo propio de paquetes Wagashi
- Web (cuando llegue el momento)
- Mini FTP propio para ISOs cuando estén listas para producción
- Wine en todas las ediciones por defecto

---

## Lo que queda pendiente del día

- Rice del escritorio KDE
- Monochrome Edition
- lxqt-community primer commit
- VISION.md actualizado

---

## Lo que no queda

La duda de si esto es real.

Ya lo es. En dos ediciones.

---

*Made by Nekki.mov, for everyone sensitive.*  
*Year Zero — 28 de mayo de 2026*
