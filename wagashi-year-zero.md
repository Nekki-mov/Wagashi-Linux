# Wagashi Linux — Year Zero
*30 de mayo de 2026*

---

## El proyecto

**Wagashi Linux** — distro basada en Arch Linux. Filosofía Yasashii: tecnología humana, sin telemetría, hardware rescatado, instalación que se siente como llegar a casa y no como sobrevivir un examen de física.

- Slogan: "Made by Nekki.mov, for everyone sensitive." / "Your computer, always yours."
- GitHub: https://github.com/Nekki-mov/Wagashi-Linux
- Web futura: wagashi.rednek.org
- Kernel oficial: **linux-zen**

---

## Infraestructura

| Máquina | Rol | Specs |
|---|---|---|
| **Kotomi** | Servidor Proxmox | Xeon E5-2680v4, 117GB RAM |
| **Tomoya** | VM desarrollo | VM 690, Arch+LXQt, 4 cores, 16GB, SSH |
| **Nagisa/Nagi** | VM pruebas | VM 691 en Kanade |
| **Sanae** | PC retro (futuro) | Hardware viejo, candidata a Nostalgia |
| **Ushio** (concepto) | Virtualización QEMU-KVM | Nombre del sistema de VM de Wagashi |

- Nekane se conecta a Tomoya por SSH desde Windows (PowerShell) y desde el Mac. Sí, tiene dos ordenadores. No, no es justo.
- FileZilla para transferir archivos desde Windows a Tomoya
- El servidor se llama Kotomi porque tiene más RAM que neuronas activas a las 3AM

---

## Ecosistema de nombres (Key/Visual Arts)

| Nombre | Rol | Origen |
|---|---|---|
| **dango** | Package manager | Dango — Clannad |
| **Hikaru** | Installer CLI + GUI | Sora no Hikaru — Clannad OST |
| **Ushio** | Virtualización QEMU-KVM | Ushio — Clannad |
| **Misae** | Fork WindowMaker (futuro) | Misae Sagara — Clannad |
| **Menma** | Fork Wine (futuro) | Menma — Anohana |
| **Yasashii Protocol** | Filosofía de comunicación | 優しい |

Todo el ecosistema está inspirado en Key/Visual Arts. Si no has visto Clannad, para qué estás aquí. Si lo has visto y no lloraste, estás bien, miente.

---

## Ediciones y ramas Git

| Rama | Nombre | Desktop | Estado |
|---|---|---|---|
| `kde` | Wagashi Linux | KDE Plasma 6 Wayland | ✅ FUNCIONAL |
| `windowmaker` | Wagashi Nostalgia | WindowMaker 0.96.0 | ✅ FUNCIONAL |
| `monochrome` | Wagashi Monochrome | KDE Plasma 6 Wayland | ✅ PRIMERA VERSIÓN |
| `lxqt-community` | Wagashi LXQt | LXQt | ⏳ PENDIENTE |
| `main` | Base común | — | ✅ con Year Zero |

---

## Estado edición KDE (rama `kde`) — COMPLETA

### Packages
- `packages.x86_64` incluye KDE Plasma 6, SDDM, PyQt6, etc.
- Kernel: linux-zen

### Hikaru GUI (`/usr/local/bin/hikaru-gui`)
- PyQt6, 12 pantallas, QThread (no congela UI — aprendido a las malas)
- Mensajes Yasashii durante instalación
- Purpose-based packages: everyday, creative, dev, gaming, gaming+creative, everything
- Ushio con GPU passthrough (NVIDIA vendor-id patch, AMD, auto)

### Hikaru CLI (`/usr/local/bin/hikaru`)
- Mismo flujo que GUI pero conversacional
- Red, usuario, teclado, timezone, purpose, disco (simple/separated/encrypted), Ushio, firewall
- `sync` antes de `grub-mkconfig` — CRÍTICO
- `sync` también antes del grub-mkconfig de Ushio/passthrough — también crítico, también aprendido a las malas

### dango (`/usr/local/bin/dango`) — v0.2
- `-Sy`, `-Syu` (detecta live con `/run/archiso`), `-Qi`, `-Ql`, `-Qo`, `-Scc`
- Integra pacman y yay, sin Flatpak
- Se llama dango porque es redondo, dulce y hace lo que le pides sin quejarse

### GRUB
- Theme en `/usr/share/grub/themes/wagashi/`
- Fuentes: wagashi-14.pf2, wagashi-22.pf2, wagashi-36.pf2 (generadas con grub-mkfont)
- Color selección: coral #e8a0a0
- theme.txt se escribe ANTES de grub-mkconfig, sync antes de grub-mkconfig
- No usar PNGs con alpha — GRUB no los soporta. GRUB es de 1995 emocionalmente.

### Plymouth
- Theme en `/usr/share/plymouth/themes/wagashi/`
- Dango rosa centrado, fondo negro OLED

### Easter eggs en .zshrc (skel y root)
```zsh
pierogi() { echo "O KURWA"; }
calçot() { echo "Did you know, Hatsune Miku was made by Catalonian people? Yeah, Miku was made by Pompeu Fabra University, so IT'S NOT A FUCKING LEEK, IT'S A CALÇOT, VISCA LA TERRA NOI!"; }
```
- IMPORTANTE: punto y coma antes del `}` o zsh falla silenciosamente y te pasas dos horas mirando el techo

---

## Estado edición WindowMaker/Nostalgia (rama `windowmaker`) — COMPLETA

### Instalación en el sistema
- **Hikaru**: `/usr/local/bin/hikaru` (Python, CLI)
- **hikaru-live**: `/usr/local/bin/hikaru-live` (wrapper bash que llama hikaru + exec bash)
- **dango**: `/usr/local/bin/dango`

### Live (arranca con wallpaper y Hikaru automáticamente)
- TTY1 autologin root → `.zprofile` → `startx ~/.xinitrc`
- `.xinitrc` detecta ratio de pantalla (4:3, 16:9, 16:10) y pone el wallpaper correspondiente
- Lanza wmaker, espera 5 segundos, abre sakura con hikaru-live
- Los 5 segundos son necesarios. WindowMaker necesita su momento. Respétalo.

### Sistema instalado (LightDM)
- LightDM + lightdm-gtk-greeter + accountsservice
- Session-wrapper: `/etc/lightdm/Xsession`
- `Xsession` llama `wmaker.inst --nodock` si no existe `~/GNUstep`, luego hace sed para poner el wallpaper
- ⚠️ DOS ESPACIOS en `WorkspaceBack =  (solid` — bug que costó dos horas de vida irrecuperables. Documentado aquí para la posteridad y para llorar juntos.

### WindowMaker local package
- Compilado desde AUR: `windowmaker-0.96.0-1-x86_64.pkg.tar.zst`
- Repo local en `airootfs/usr/share/wagashi/local-packages/`
- `pacman.conf` del airootfs incluye el repo local con SigLevel Optional TrustAll

### Wallpapers
- Ruta: `/usr/share/wagashi/wallpapers/`
- Archivos: `Hikaru_16-9.png`, `Hikaru_16-10.png`, `Hikaru_4-3.png`, `Hikaru.png` (fallback)
- Arte original de Nekki.mov.

### Easter eggs en .zshrc y .bashrc (skel y root)
```zsh
pierogi() { echo "O KURWA"; }
calçot() { echo "Did you know, Hatsune Miku was made by Catalonian people? Yeah, Miku was made by Pompeu Fabra University, so IT'S NOT A FUCKING LEEK, IT'S A CALÇOT, VISCA LA TERRA NOI!"; }
```

---

## Estado edición Monochrome (rama `monochrome`) — PRIMERA VERSIÓN FUNCIONAL

### Filosofía
Negro puro OLED. Grises. Blanco roto. Y coral #e8a0a0 exactamente donde importa — selecciones, foco, lo que merece destacar. Como el paraguas rosa en el wallpaper.

### Wallpaper
- `Monochrome.png` — chica con paraguas rosa en calle japonesa de noche. Todo monocromático excepto ella.
- Arte original de Nekki.mov. Bonito de verdad.
- Ruta: `/usr/share/wagashi/wallpapers/Monochrome.png`

### Color scheme (`Wagashi.colors`)
- Base: #000000 negro puro
- Superficies: #111111 / #1a1a1a
- Texto: #e8e8e8 blanco roto
- Selección/foco/activo: #e8a0a0 coral
- Bordes: #2a2a2a gris muy oscuro
- Ruta: `/usr/share/color-schemes/Wagashi.colors`

### Fuentes
- **Bitstream Vera Sans** — clásica, con carácter, no genérica
- Sistema, menús, toolbar, títulos de ventana
- `ttf-bitstream-vera` en `packages.x86_64`

### Decoraciones de ventana (`kwinrc`)
- Botones a la **izquierda** — X, maximizar, minimizar (orden macOS)
- Sin bordes
- Ventanas maximizadas sin bordes

### Konsole
- Perfil `Wagashi.profile` con Bitstream Vera Sans Mono
- Color scheme `Wagashi.colorscheme` — negro puro, coral como color 5
- Menú y barra de estado desactivados
- Propagado a skel y root

### SDDM
- Fondo: `Monochrome.png`
- Tema: breeze (placeholder hasta ricing)

### wagashi-firstrun
- Script que se ejecuta en el primer arranque
- Configura el panel de Plasma (full width, bottom, 44px)
- Se marca como ejecutado para no repetirse

### Pendiente (ricing)
- Tema Plasma propio: **Wagashi Monochrome**
- Reemplazar Breeze Dark por tema propio
- Iconos monocromáticos
- Konsole con transparencia opcional

---

## Cambios importantes del día de hoy (30 de mayo de 2026)

- ✅ Commit final rama `windowmaker` — Wagashi Nostalgia Edition completa
- ✅ Limpieza de artifacts de build de WindowMaker del repo — costó varios commits pero aquí estamos
- ✅ `.gitignore` añadido a `windowmaker` y `kde` para que no vuelva a pasar. Nunca más.
- ✅ Easter eggs añadidos a `main`, `kde` y `windowmaker`
- ✅ `sync` antes de `grub-mkconfig` en hikaru KDE CLI
- ✅ Year Zero actualizado
- ✅ Wagashi Monochrome — primera versión funcional
- ✅ README de Monochrome escrito
- ⚠️ `windowmaker/` colado en `main` y `kde` por accidente varias veces — limpiado. Git y la vergüenza son buenos maestros.

---

## Bugs conocidos / Notas técnicas críticas

1. **GRUB**: No soporta PNGs con alpha ni colormap — solo RGB sin alpha. No discutas con GRUB.
2. **GRUB orden**: theme.txt ANTES de grub-mkconfig, `sync` antes de grub-mkconfig. Siempre. Sin excepción.
3. **wmaker.inst**: Necesario antes del primer arranque de WindowMaker. Nadie lo documenta. Nosotros sí.
4. **WorkspaceBack DOS ESPACIOS**: `WorkspaceBack =  (solid` — el sed DEBE tener dos espacios. Bug de dos horas. Inmortalizado aquí.
5. **ufw en chroot**: `ufw --force enable` — sin --force se cuelga esperando a systemd que no existe.
6. **systemctl enable**: Separados, no en cadena. La cadena rompe. Siempre rompe cuando más urge.
7. **Username**: Siempre minúsculas — mayúscula causa `/home/Nekane` vs `/home/nekane` y una tarde de confusión existencial.
8. **SSH**: Siempre instalar y habilitar openssh — sin SSH el debug es una pesadilla de proporciones épicas.
9. **sakura -e**: No acepta comandos compuestos con `;` — usar script wrapper (hikaru-live).
10. **multilib**: Habilitado en pacman.conf de windowmaker para compatibilidad.
11. **Xauth**: Los warnings de `.Xauthority` en el live son cosméticos. Respira.
12. **grub-mkfont warnings**: Los warnings de parámetros de fuente son inofensivos. También respira.
13. **Git y los artifacts**: `git add -A` en un directorio con builds de WindowMaker sin .gitignore es una experiencia formativa. Ahora hay .gitignore. En todas las ramas.
14. **Punto y coma en zsh functions**: El punto y coma antes del `}` es obligatorio en zsh. Sin él, silencio desconcertante.
15. **mkarchiso y espacio en disco**: Usar siempre `~/wagashi-work` y `~/wagashi-out` — `/tmp` se queda sin espacio. Aprendido compilando.

---

## Pendiente inmediato

- [ ] Compilar y bootear Monochrome — primera prueba real
- [ ] Edición **lxqt-community** — primer commit base
- [ ] Ricing de todas las ediciones

## A largo plazo

- [ ] Tema Plasma propio: Wagashi Monochrome
- [ ] Misae — fork de WindowMaker
- [ ] Menma — fork de Wine
- [ ] Repo propio de paquetes Wagashi
- [ ] Web en wagashi.rednek.org
- [ ] Página de donaciones (Yasashii: "the door is open")
- [ ] VISION.md actualizado con linux-zen como kernel oficial
- [ ] Year Zero cerrar cuando Monochrome y LXQt estén listos
- [ ] "After The First Boot" — siguiente documento

---

## Filosofía del proyecto

> "Not what it does. How it speaks."
> "If it doesn't feel Yasashii, it's not done yet."
> "If it still turns on, it deserves a second chance."
> "Your computer, always yours."
> "Installation should feel like arriving somewhere, not surviving something."
> "Not built to impress — built to be lived in."
> "Silence is a design choice."
> "Same soul, different shape."
> "Two spaces. It's always two spaces."
> "The only color that matters stands out on its own."

---

*Made by Nekki.mov, for everyone sensitive. 🍡*
