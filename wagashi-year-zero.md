# Wagashi Linux — Year Zero
*30–31 de mayo / 1–2 de junio de 2026*

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
| **Tomoya** | VM desarrollo | Arch+LXQt, SSH, IP 192.168.1.107 |
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

| Rama | Nombre | Year | Desktop | Instalador | Estado |
|---|---|---|---|---|---|
| `Ayu-KDE` | **Wagashi Ayu** | 2026 | KDE Plasma 6 Wayland | Hikaru GUI | ✅ FUNCIONAL |
| `Mishio-Nostalgia` | **Wagashi Mishio** | 1996 | WindowMaker 0.96.0 | Hikaru CLI | ✅ FUNCIONAL |
| `Sayuri-Monochrome` | **Wagashi Sayuri** | 2077 | KDE Plasma 6 Wayland | Hikaru GUI | ✅ FUNCIONAL |
| `Nayuki-LXQt` | **Wagashi Nayuki** | 2008 | LXQt | CLI + GUI | ✅ FUNCIONAL |
| `main` | Base común | — | — | — | ✅ con Year Zero |

Los nombres son personajes de *Kanon* (Key Visual Arts). Porque los nombres importan y estas ediciones los merecen.

Los años no son fechas de lanzamiento. Son sentimientos.

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

## Estado edición Ayu (rama `Ayu-KDE`) — FUNCIONAL

### Packages
- `packages.x86_64` incluye KDE Plasma 6, SDDM, PyQt6, konsole, ttf-bitstream-vera, etc.
- Kernel: linux-zen
- multilib habilitado en pacman.conf
- mirrorlist global — CDN worldwide (geo.mirror.pkgbuild.com, rackspace, kernel.org, f4st)

### Hikaru GUI (`/usr/local/bin/hikaru-gui`)
- PyQt6, 12 pantallas, QThread (no congela UI — aprendido a las malas)
- Detección automática de edición vía `/etc/os-release` — carga paleta Ayu, Sayuri o Nayuki
- Paleta Ayu: tonos cálidos dorados, fondo azul oscuro, Noto Serif para títulos
- Mensajes Yasashii durante instalación
- Purpose-based packages: everyday, creative, dev, gaming, gaming+creative, everything
- Ushio con GPU passthrough (NVIDIA vendor-id patch, AMD, auto)
- Todo centrado en columna de 640px
- Resumen con disco legible (tamaño y modelo, no /dev/xxx)
- Ushio explicado en resumen: "run other operating systems inside Wagashi"
- Countdown de 10 segundos en pantalla final antes de reiniciar
- chown final al terminar la instalación — permisos correctos out of the box

### Hikaru CLI (`/usr/local/bin/hikaru`)
- Terminal, todo centrado, paleta ANSI (blanco roto, grises, coral)
- Red, usuario, teclado, timezone, purpose, disco (simple/separated/encrypted), Ushio, firewall
- `sync` antes de `grub-mkconfig` — CRÍTICO
- /etc/hosts escrito correctamente con hostname
- Easter eggs en .zshrc del usuario instalado
- chown final al terminar

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

## Estado edición Mishio (rama `Mishio-Nostalgia`) — FUNCIONAL

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

## Estado edición Sayuri (rama `Sayuri-Monochrome`) — FUNCIONAL

### Filosofía
Negro puro OLED. Grises. Blanco roto. Y coral #e8a0a0 exactamente donde importa.  
Inspirada en *Iroduku* y *Violet Evergarden*: la belleza en la contención, el peso de un solo color.  
Como el paraguas rosa en el wallpaper.  
La única edición que parece de un futuro que todavía no existe.

### Wallpaper
- `Monochrome.png` — chica con paraguas rosa en calle japonesa de noche. Todo monocromático excepto ella.
- Arte original de Nekki.mov.
- Ruta: `/usr/share/wagashi/wallpapers/Monochrome.png`

### Color scheme
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


### SDDM
- Fondo: `Monochrome.png`
- Tema: breeze (placeholder hasta ricing)

### Pendiente (ricing Sayuri)
- Tema Plasma propio: **Wagashi Monochrome**
- Reemplazar Breeze Dark por tema propio
- Iconos monocromáticos
- Konsole con transparencia opcional
- Botones a la **izquierda** — X, maximizar, minimizar (orden macOS)
- Sin bordes, ventanas maximizadas sin bordes
- Perfil `Wagashi.profile` con Bitstream Vera Sans Mono
- Color scheme `Wagashi.colorscheme` — negro puro, coral como color 5
- Menú y barra de estado desactivados

---

## Estado edición Nayuki (rama `Nayuki-LXQt`) — FUNCIONAL

### Filosofía
Ligera. Para el ordenador que alguien estaba a punto de tirar.  
2008 es el año en que la gente empezó a tirar ordenadores que todavía funcionaban.  
Nayuki es para esos ordenadores. Y para las personas que los guardaron.  
Community-maintained — Nekki pone la base y se aparta.

### Live
- LightDM con autologin root — no TTY, no terminal en primer arranque
- LXQt desktop
- Hikaru GUI se abre automáticamente via autostart
- lxqt-powermanagement silenciado en máquinas sin batería (inteligente — en portátiles funciona normal)

### Sistema instalado
- LightDM + lightdm-gtk-greeter
- Xsession ejecuta startlxqt
- gvfs instalado — Computer y Network funcionan en pcmanfm-qt
- wagashi-firstrun ejecuta xdg-user-dirs-update al primer login
- Easter eggs en .zshrc

### Hikaru GUI (Nayuki)
- Paleta **Clannad · Dango Family** — crema cálida, dango pink, marrón oscuro (contraste corregido)
- "✦ connected." con fondo surface y accent_dark — legible y con presencia
- Countdown 10s en pantalla final (timer en showEvent, no en __init__ — bug crítico)
- Disco mostrado como "32 GB — Samsung SSD" en vez de /dev/vda
- Ushio en resumen: solo sí/no, descripción como nota pequeña debajo
- Purpose y layout traducidos en el resumen
- Alineado dinámico según longitud de claves del idioma activo
- Barra de progreso sin porcentaje
- Botón final: "reboot / reiniciar / リブート (10)"

### i18n — tres idiomas (EN / ES / JA)
- `hikaru_strings.py` — diccionario unificado, un archivo para CLI y GUI
- Selector de idioma como primera pantalla — tres botones, sin título, sin instrucciones
- Japonés con `font-family: 'Noto Sans CJK JP'` explícito — sin él, tofu boxes
- noto-fonts-cjk en `packages.x86_64` raíz (no en airootfs — ahí no lo coge mkarchiso)
- Teclado y timezone preseleccionados según idioma (jp106 + Asia para japonés)
- Hikaru habla en femenino en español: "Encantada de conocerte."
- Kaori donde gana: "Hora de llamar al gorila." / "Antes, necesito hablar con internet."
- Títulos traducidos: Connection. / Conexión. / 接続。
- Security traducido: Security. / Hora de llamar al gorila. / 守りを固めましょう。
- Botones de navegación traducidos: back/atrás/戻る, Continue/Continuar/次へ, begin/comenzar/始める
- locale correcto instalado: en_US.UTF-8 / es_ES.UTF-8 / ja_JP.UTF-8
- La ISO de Nayuki se compiló con "My Song (Yui Ver.)" de Girls Dead Monster sonando de fondo. El universo tenía opiniones.

### Hikaru CLI (Nayuki)
- Mismo CLI que otras ediciones, adaptado para LXQt/LightDM
- Selector de idioma al inicio — 1/2/3, sin texto alrededor
- `hikaru_strings.py` importado, todos los strings via T["KEY"]
- "はい" aceptado como respuesta afirmativa en japonés
- locale correcto instalado según idioma

### Wallpaper
- Pendiente — usando wallpaper por defecto de LXQt
- Ricing pendiente: tema claro Clannad·Dango Family, tema oscuro Clannad·Firefly

---

## Hikaru — estado actual

### CLI (Mishio / Nayuki)
- Todo centrado con padding calculado por ancho de terminal
- Paleta ANSI: blanco roto, grises, coral
- Respiración real — espacios en blanco con peso
- Whispers para lo secundario, coral para lo importante
- /etc/hosts escrito con hostname correcto
- Easter eggs en .zshrc del usuario
- chown al final — permisos correctos out of the box

### GUI (Ayu / Sayuri / Nayuki)
- Un solo archivo — detecta edición vía `/etc/os-release`
- Paleta Ayu: dorados cálidos, fondo azul oscuro, Noto Serif
- Paleta Sayuri: negro puro, coral únicamente, Bitstream Vera Sans
- Paleta Nayuki: Dango Family — crema, dango pink, marrón oscuro
- i18n completo — `hikaru_strings.py`, selector de idioma como primera pantalla
- Todo centrado en columna 640px
- Progresbar de 2px sin porcentaje — discreta, presente
- Resumen legible — disco con tamaño/modelo, purpose y layout traducidos, Ushio sí/no
- Countdown 10s en pantalla final, botón en idioma elegido
- chown al final de todo

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
- ✅ Ramas renombradas: `Ayu-KDE`, `Mishio-Nostalgia`, `Sayuri-Monochrome`, `Nayuki-LXQt`
- ✅ profiledef.sh actualizado en TODAS las ramas
- ✅ Hikaru GUI reescrito — detección automática de edición, paletas Ayu/Sayuri diferenciadas
- ✅ VISION.md reescrito — filosofía completa, Ana documentada, ediciones actualizadas
- ✅ wagashi-firstrun con dbus-wait para wallpaper fiable
- ✅ Hikaru GUI propagado a root autostart para live

### 2 de junio
- ✅ Wagashi Nayuki (LXQt) — primera versión funcional
- ✅ mirrorlist global CDN en TODAS las ramas — worldwide speed
- ✅ Nayuki: LightDM con autologin, PAM configurado, Xsession inteligente
- ✅ Nayuki: lxqt-powermanagement silenciado en máquinas sin batería
- ✅ Nayuki: Hikaru CLI y GUI adaptados — LXQt, LightDM, paleta Dango Family
- ✅ Nayuki: gvfs instalado — pcmanfm-qt funciona out of the box
- ✅ Nayuki: /etc/hosts, easter eggs, wagashi-firstrun, chown al final
- ✅ Hikaru GUI: countdown 10s en pantalla final (timer corregido — arranca al mostrar)
- ✅ Hikaru GUI: disco legible en resumen (tamaño y modelo)
- ✅ Hikaru GUI: Ushio explicado en resumen
- ✅ Hikaru GUI: "Keep Wagashi up to date automatically"
- ✅ Hikaru GUI: "✦ connected." con pastilla surface en Nayuki
- ✅ Ediciones con años asignados: Mishio 1996, Nayuki 2008, Ayu 2026, Sayuri 2077
- ✅ VISION.md y todos los READMEs actualizados con años, ramas nuevas, estado real
- ✅ i18n completo — `hikaru_strings.py` con EN/ES/JA
- ✅ Hikaru GUI: selector de idioma como primera pantalla
- ✅ Hikaru GUI: todos los strings traducidos — títulos, botones, navegación, resumen
- ✅ Hikaru CLI: selector de idioma 1/2/3 antes del splash
- ✅ noto-fonts-cjk en packages.x86_64 raíz — japonés se renderiza en el live
- ✅ Kaori oficial: "Hora de llamar al gorila." / "Antes, necesito hablar con internet." / "Encantada de conocerte."
- ✅ Hikaru habla en femenino en español
- ✅ Resumen: purpose y layout traducidos, alineado dinámico, Ushio sí/no
- ✅ Botón final: reboot / reiniciar / リブート con countdown
- ✅ Teclado y timezone preseleccionados según idioma
- ✅ **Monster-ception documentado para la posteridad:**
  - Monster ISO compilándose (1.3GB+)
  - Girls Dead Monster sonando de fondo ("My Song", Yui Ver.)
  - Monster Energy en mano
  - Girls Dead Monster en la biblioteca musical de la ISO
  - "Hora de llamar al gorila." como título de la pantalla de seguridad
  - Un gorila vigilando el perímetro de Wagashi mientras Yui toca la guitarra
  - Commit message sugerido: `"Monster-ception"` — rechazado por ser demasiado preciso

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
16. **Git paréntesis en nombres de rama**: Git no acepta paréntesis. Usar guión: `Ayu-KDE`, no `Ayu (KDE)`.
17. **QTimer en PyQt6**: Nunca arrancar un timer en `__init__` si la pantalla se crea antes de mostrarse. Arrancarlo en `showEvent`. El countdown de reboot reiniciaba el sistema durante la instalación.
18. **chown al final**: Siempre usar `arch-chroot /mnt chown -R user:user /home/user` — el chown fuera del chroot no garantiza que los archivos creados por Python queden con los permisos correctos. Lección aprendida con `.config` perteneciendo a root.
19. **lxqt-powermanagement en airootfs**: No crear el .desktop en airootfs — conflicto con el paquete. Usar Xsession para detectar batería y silenciarlo dinámicamente.
20. **gvfs**: Necesario para que pcmanfm-qt pueda montar Computer y Network. Sin él, "Operation not supported".
21. **noto-fonts-cjk en packages.x86_64**: Debe estar en el `packages.x86_64` de la raíz del repo, NO en `airootfs/packages.x86_64` — ese archivo no existe. mkarchiso solo lee el de la raíz.
22. **PyQt6 y fuentes CJK**: Especificar `font-family: 'Noto Sans CJK JP'` explícitamente en el widget. Sin esto, PyQt6 no encuentra la fuente aunque esté instalada y muestra tofu boxes (□□□).
23. **write_file en InstallWorker**: Siempre envolver en try/except con os.makedirs. Sin esto, una excepción Python en el thread mata la instalación silenciosamente sin mostrar error.
24. **Labels en PyQt6 con i18n**: Los QLabel creados en `__init__` con strings del constructor se crean antes de que el usuario elija idioma. Crearlos vacíos y rellenarlos en `showEvent`.
25. **pcmanfm-qt --set-wallpaper**: No usar en autostart — falla si el escritorio no está listo. Escribir el wallpaper directamente en `~/.config/pcmanfm-qt/lxqt/settings.conf` antes del primer arranque.
26. **Contraseña de root**: El installer debe hacer `chpasswd` para root con la misma contraseña del usuario. Sin esto, `su -` falla y no hay salida de emergencia si sudo deja de funcionar.

---

## Pendiente inmediato

- ✅ Nayuki: wallpaper propio — `Nayuki.png` (torii, atardecer, dangos en la linterna)
- ✅ Verificar instalación completa Nayuki out of the box con i18n

## A largo plazo — ricing

- [ ] Sayuri — tema Plasma propio Wagashi Monochrome, iconos monocromáticos, Conky, SDDM con vídeo
- [ ] Ayu — tema Plasma con identidad visual propia, SDDM ricing, Conky opcional
- [ ] Nayuki — tema claro Clannad·Dango Family + tema oscuro Clannad·Firefly, iconos escritorio
- [ ] Mishio — dockapps (wmclock, wmmon/wmcpuload, wmnet, wmix, wmbattery)

## A largo plazo — proyecto

- ✅ Propagar hikaru-gui con i18n a Ayu, Mishio y Sayuri
- [ ] i18n en dango — detectar LANG del sistema
- [ ] i18n en Yasashii Protocol — mensajes del sistema en tres idiomas
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
> "The years aren't release dates. They're feelings."  
> "Encantada de conocerte."  
> "お帰りなさい。"  
> "ここが、あなたの居場所になりますように。"  
> "Hora de llamar al gorila."

---

## Afterword

Si estás leyendo esto, significa que Wagashi ha arrancado.

Puede parecer una tontería decirlo, pero hubo un tiempo en el que eso no era una certeza.

Year Zero comenzó como una idea sencilla: construir algo que se sintiera diferente. No más rápido. No más moderno. No más revolucionario. Sólo diferente.

Un sistema que recordara que la tecnología también puede tener personalidad.

Durante meses hemos escrito código, roto instalaciones, reconstruido paquetes, discutido colores imposibles, cambiado fondos de pantalla demasiadas veces y perseguido pequeños detalles que probablemente nadie notará.

Y sin embargo, ahí están.

En algún lugar entre una ventana, una fuente, una pantalla de bienvenida o una canción sonando de fondo, hay cientos de decisiones tomadas con cariño.

Year Zero no es el final de Wagashi.  
Es el principio.  
La primera piedra.  
La versión que nos permitió descubrir qué clase de proyecto queríamos construir.

Algunas cosas cambiarán.  
Otras desaparecerán.  
Y muchas de las decisiones tomadas aquí serán reemplazadas por ideas mejores.

Eso está bien.

Porque Year Zero nunca trató de ser perfecto.  
Trató de existir.  
Y ahora existe.

Gracias por dedicarle un poco de tu tiempo.  
Esperamos que encuentres algo que te haga sonreír.  
Aunque sea una sola vez.

Y si algún día rescatas un ordenador que alguien daba por perdido,  
si ayudas a alguien a dar sus primeros pasos en Linux,
o si consigues que la tecnología se sienta un poco más humana...

entonces Wagashi habrá cumplido su propósito.

Year Zero termina aquí.  
Lo que venga después ya es otra historia.

*— See you again.*  
*お帰りなさい。*

---

*Made by Nekki.mov, for everyone sensitive. 🍡*
