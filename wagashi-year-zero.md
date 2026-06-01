# Wagashi Linux — Year Zero
*30–31 de mayo / 1 de junio de 2026*

---

## El proyecto

**Wagashi Linux** — distro basada en Arch Linux. Filosofía Yasashii: tecnología humana, sin telemetría, hardware rescatado, instalación que se siente como llegar a casa y no como sobrevivir un examen de física.

- Slogan: "Made by Nekki.mov, for everyone sensitive." / "Your computer, always yours."
- GitHub: https://github.com/Nekki-mov/Wagashi-Linux
- Web futura: wagashi.rednek.org
- Kernel oficial: **linux-zen**

---

## Por qué existe esto

Wagashi Linux existe porque alguien creyó que la tecnología podía ser amable.

Esa persona era Ana. Nos introdujo a Linux — y dejó la convicción de que un ordenador, con el software adecuado, puede sentirse como llegar a casa.

Ella es la razón por la que este proyecto existe. Ella es la razón por la que le importan las personas que lo usan.

*Ana Mamés, 2002–2017.*

---

## Infraestructura

| Máquina | Rol | Specs |
|---|---|---|
| **Kotomi** | Servidor Proxmox | Xeon E5-2680v4, 117GB RAM |
| **Tomoya** | VM desarrollo | VM 690, Arch+LXQt, SSH, IP 192.168.1.107 |
| **Kanade** | VM pruebas Proxmox | IP 10.0.0.5 |
| **Sanae** | PC retro (futuro) | Hardware viejo, candidata a Mishio |
| **Kurumi** | OPNsense (pendiente) | Ethernet USB recién llegado |

- Nekane se conecta a Tomoya por SSH desde Windows (PowerShell) y desde el Mac.
- FileZilla para transferir archivos desde Windows a Tomoya.
- El servidor se llama Kotomi porque tiene más RAM que neuronas activas a las 3AM.

---

## Ecosistema de nombres

| Nombre | Rol | Origen |
|---|---|---|
| **dango** | Package manager | Dango — Clannad |
| **Hikaru** | Installer CLI + GUI | Sora no Hikaru — Clannad OST |
| **Ushio** | Virtualización QEMU-KVM | Ushio — Clannad |
| **Ana** | Guía del sistema | Ana Mamés, 2002–2017 |
| **Misae** | Fork WindowMaker (futuro) | Misae Sagara — Clannad |
| **Menma** | Fork Wine (futuro) | Menma — Anohana |
| **Yasashii Protocol** | Filosofía de comunicación | 優しい |

---

## Ediciones y ramas Git

| Rama | Nombre | Desktop | Instalador | Estado |
|---|---|---|---|---|
| `kde` | **Wagashi Ayu** | KDE Plasma 6 Wayland | Hikaru GUI | ✅ FUNCIONAL |
| `windowmaker` | **Wagashi Mishio** | WindowMaker 0.96.0 | Hikaru CLI | ✅ FUNCIONAL |
| `monochrome` | **Wagashi Sayuri** | KDE Plasma 6 Wayland | Hikaru GUI | ✅ COMPILADA Y FUNCIONAL |
| `lxqt-community` | **Wagashi Nayuki** | LXQt | CLI + GUI | ⏳ PENDIENTE |
| `main` | Base común | — | — | ✅ con Year Zero |

Los nombres son personajes de *Kanon* (Key Visual Arts). Porque los nombres importan y estas ediciones los merecen.

---

## Releases planeadas

| Release | Nombre |
|---|---|
| 1.0 | Natto |
| 2.0 | Mochi |
| 3.0 | Dorayaki |
| 4.0 | Daifuku |
| 5.0 | Monaka |
| 6.0 | Anmitsu |
| 7.0 | Dango |
| 8.0 | Taiyaki *(final, con ricing completo)* |

---

## Estado edición Ayu (rama `kde`) — FUNCIONAL

### Packages
- `packages.x86_64` incluye KDE Plasma 6, SDDM, PyQt6, konsole, ttf-bitstream-vera, etc.
- Kernel: linux-zen
- multilib habilitado en pacman.conf

### Hikaru GUI (`/usr/local/bin/hikaru-gui`)
- PyQt6, 12 pantallas, QThread (no congela UI — aprendido a las malas)
- Detección automática de edición vía `/etc/os-release` — carga paleta Ayu o Sayuri
- Paleta Ayu: tonos cálidos dorados, fondo azul oscuro, Noto Serif para títulos
- Mensajes Yasashii durante instalación
- Purpose-based packages: everyday, creative, dev, gaming, gaming+creative, everything
- Ushio con GPU passthrough (NVIDIA vendor-id patch, AMD, auto)
- Todo centrado en columna de 640px

### Hikaru CLI (`/usr/local/bin/hikaru`)
- Terminal, todo centrado, paleta ANSI (blanco roto, grises, coral)
- Red, usuario, teclado, timezone, purpose, disco (simple/separated/encrypted), Ushio, firewall
- `sync` antes de `grub-mkconfig` — CRÍTICO
- Whispers para texto secundario, coral para preguntas importantes

### dango (`/usr/local/bin/dango`) — v0.2
- `-Sy`, `-Syu`, `-Qi`, `-Ql`, `-Qo`, `-Scc`
- Integra pacman y yay, sin Flatpak
- Se llama dango porque es redondo, dulce y hace lo que le pides sin quejarse

### GRUB
- Theme en `/usr/share/grub/themes/wagashi/`
- Fuentes: wagashi-14.pf2, wagashi-22.pf2, wagashi-36.pf2
- Color selección: coral #e8a0a0
- theme.txt se escribe ANTES de grub-mkconfig, sync antes de grub-mkconfig
- No usar PNGs con alpha — GRUB es de 1995 emocionalmente

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

## Estado edición Mishio (rama `windowmaker`) — FUNCIONAL

### Instalación en el sistema
- **Hikaru CLI**: `/usr/local/bin/hikaru`
- **hikaru-live**: `/usr/local/bin/hikaru-live` (wrapper bash que llama hikaru + exec bash)
- **dango**: `/usr/local/bin/dango`

### Live
- TTY1 autologin root → `.zprofile` → `startx ~/.xinitrc`
- `.xinitrc` detecta ratio de pantalla (4:3, 16:9, 16:10) y pone el wallpaper correspondiente
- Lanza wmaker, espera 5 segundos, abre sakura con hikaru-live
- Los 5 segundos son necesarios. WindowMaker necesita su momento. Respétalo.

### Sistema instalado (LightDM)
- LightDM + lightdm-gtk-greeter + accountsservice
- `Xsession` llama `wmaker.inst --nodock` si no existe `~/GNUstep`, luego hace sed para poner el wallpaper
- ⚠️ DOS ESPACIOS en `WorkspaceBack =  (solid` — bug que costó dos horas de vida irrecuperables.

### WindowMaker local package
- Compilado desde AUR: `windowmaker-0.96.0-1-x86_64.pkg.tar.zst`
- Repo local en `airootfs/usr/share/wagashi/local-packages/`

### Wallpapers
- Ruta: `/usr/share/wagashi/wallpapers/`
- Archivos: `Hikaru_16-9.png`, `Hikaru_16-10.png`, `Hikaru_4-3.png`, `Hikaru.png` (fallback)
- Arte original de Nekki.mov.

---

## Estado edición Sayuri (rama `monochrome`) — COMPILADA Y FUNCIONAL

### Filosofía
Negro puro OLED. Grises. Blanco roto. Y coral #e8a0a0 exactamente donde importa.  
Inspirada en *Iroduku* y *Violet Evergarden*: la belleza en la contención, el peso de un solo color.  
Como el paraguas rosa en el wallpaper.

### Wallpaper
- `Monochrome.png` — chica con paraguas rosa en calle japonesa de noche. Todo monocromático excepto ella.
- Arte original de Nekki.mov.
- Ruta: `/usr/share/wagashi/wallpapers/Monochrome.png`

### Color scheme (`Wagashi.colors`)
- Base: #000000 negro puro
- Superficies: #111111 / #1a1a1a
- Texto: #e8e8e8 blanco roto
- Selección/foco/activo: #e8a0a0 coral
- Bordes: #2a2a2a gris muy oscuro

### Fuentes
- **Bitstream Vera Sans** — clásica, con carácter, no genérica
- `ttf-bitstream-vera` en `packages.x86_64`

### Hikaru GUI (Sayuri)
- Mismo archivo que Ayu — detecta edición automáticamente
- Paleta Sayuri: negro puro, grises casi invisibles, coral como único color, Bitstream Vera Sans para títulos
- Fondo `#000000`, textos en `#e8e8e8`, secciones en `#282828`, acento en `#e8a0a0`

### Decoraciones de ventana (`kwinrc`)
- Botones a la **izquierda** — X, maximizar, minimizar (orden macOS)
- Sin bordes, ventanas maximizadas sin bordes

### Konsole
- Perfil `Wagashi.profile` con Bitstream Vera Sans Mono
- Color scheme `Wagashi.colorscheme` — negro puro, coral como color 5
- Menú y barra de estado desactivados

### wagashi-firstrun
- Espera a que Plasma esté listo vía dbus antes de aplicar el wallpaper
- Configura el panel (full width, bottom, 44px)
- Se marca como ejecutado para no repetirse
- Propagado a root y skel

### SDDM
- Fondo: `Monochrome.png`
- Tema: breeze (placeholder hasta ricing)

### Pendiente (ricing Sayuri)
- Tema Plasma propio: **Wagashi Monochrome**
- Reemplazar Breeze Dark por tema propio
- Iconos monocromáticos
- Konsole con transparencia opcional

---

## Hikaru — estado actual

### CLI (Mishio / Nayuki)
- Todo centrado con padding calculado por ancho de terminal
- Paleta ANSI completa: blanco roto, grises, coral
- Respiración real — espacios en blanco con peso
- Whispers para lo secundario, coral para lo importante
- Pantalla final silenciosa

### GUI (Ayu / Sayuri)
- Un solo archivo — detecta edición vía `/etc/os-release`
- Paleta Ayu: dorados cálidos, fondo azul oscuro, Noto Serif
- Paleta Sayuri: negro puro, coral únicamente, Bitstream Vera Sans
- Todo centrado en columna 640px
- Progresbar de 2px — discreta, presente
- Pantalla final: "done." en coral, silencio total

---

## Lo hecho en Year Zero (cronológico)

### 30 de mayo
- ✅ Commit final rama `windowmaker` — Wagashi Mishio completa
- ✅ Limpieza de artifacts de build del repo
- ✅ `.gitignore` en todas las ramas
- ✅ Easter eggs en `main`, `kde`, `windowmaker`
- ✅ `sync` antes de `grub-mkconfig` en Hikaru CLI
- ✅ Year Zero primera versión

### 31 de mayo
- ✅ Wagashi Monochrome — primera versión funcional
- ✅ README de Monochrome escrito con voz propia
- ✅ pacman.conf arreglado en TODAS las ramas — eliminado CacheDir roto, añadido multilib
- ✅ mirrorlist añadido a airootfs en rama monochrome
- ✅ ISO Sayuri compilada (2.3GB) y transferida a Kanade
- ✅ Sayuri bootea, KDE levanta, Hikaru GUI funciona, instalación completa
- ✅ wagashi-firstrun con plasma-apply-wallpaperimage
- ✅ Konsole config (perfil + colorscheme) en skel y root

### 1 de junio
- ✅ Ediciones renombradas con nombres de Kanon (Ayu, Mishio, Sayuri, Nayuki)
- ✅ profiledef.sh actualizado en TODAS las ramas
- ✅ Hikaru CLI reescrito — centrado, paleta ANSI, coral, respiración real
- ✅ Hikaru GUI reescrito — detección automática de edición, paletas Ayu/Sayuri diferenciadas
- ✅ VISION.md reescrito — filosofía completa, Ana documentada, ediciones actualizadas
- ✅ wagashi-firstrun con dbus-wait para wallpaper fiable
- ✅ Hikaru GUI propagado a root autostart para live

---

## Bugs conocidos / Notas técnicas críticas

1. **GRUB**: No soporta PNGs con alpha — solo RGB sin alpha. No discutas con GRUB.
2. **GRUB orden**: theme.txt ANTES de grub-mkconfig, `sync` antes de grub-mkconfig. Siempre.
3. **wmaker.inst**: Necesario antes del primer arranque de WindowMaker. Nadie lo documenta. Nosotros sí.
4. **WorkspaceBack DOS ESPACIOS**: `WorkspaceBack =  (solid` — el sed DEBE tener dos espacios. Bug de dos horas. Inmortalizado aquí.
5. **ufw en chroot**: `ufw --force enable` — sin --force se cuelga esperando a systemd que no existe.
6. **systemctl enable**: Separados, no en cadena. La cadena rompe. Siempre rompe cuando más urge.
7. **Username**: Siempre minúsculas — mayúscula causa confusión existencial con `/home/`.
8. **sakura -e**: No acepta comandos compuestos con `;` — usar script wrapper.
9. **mkarchiso y espacio**: Usar siempre `~/wagashi-work` y `~/wagashi-out` — `/tmp` se queda sin espacio.
10. **pacman.conf CacheDir**: NO poner CacheDir con path de usuario — rompe mkarchiso porque corre como root. Aprendido con sufrimiento real.
11. **mirrorlist en airootfs**: Debe estar en `airootfs/etc/pacman.d/mirrorlist` — mkarchiso lo necesita dentro del chroot.
12. **plasma-apply-wallpaperimage**: Ejecutar solo después de que Plasma esté listo. Usar dbus-send para esperar. Sleep no es suficiente.
13. **Punto y coma en zsh functions**: Obligatorio antes del `}`. Sin él, silencio desconcertante y tarde perdida.
14. **Git y los artifacts**: `.gitignore` en todas las ramas antes de hacer cualquier build. La lección más cara del proyecto.
15. **mkarchiso -C**: El flag `-C` es para el pacman.conf, no para el directorio de caché. Confundirlos da un error críptico que parece otra cosa.

---

## Pendiente inmediato

- [ ] Wallpaper Sayuri funcionando en live y sistema instalado (dbus-wait en firstrun)
- [ ] Recompilar Sayuri con hikaru-gui nuevo y firstrun corregido
- [ ] Compilar Ayu (kde) — pacman.conf ya arreglado
- [ ] Edición Nayuki (LXQt) — primer commit base

## A largo plazo

- [ ] Ricing completo Sayuri — tema Plasma propio Wagashi Monochrome
- [ ] Ricing Ayu — tema Plasma con identidad visual propia
- [ ] Ana — guía del sistema, primera versión
- [ ] Misae — fork de WindowMaker
- [ ] Menma — fork de Wine
- [ ] Repo propio de paquetes Wagashi
- [ ] Web en wagashi.rednek.org
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
> "Let the art do the talk."

---

*Made by Nekki.mov, for everyone sensitive. 🍡*
