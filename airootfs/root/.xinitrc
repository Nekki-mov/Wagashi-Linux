#!/bin/sh
export PATH=/usr/local/bin:/usr/bin:/bin
export DISPLAY=:0

touch /root/.Xauthority
xauth generate :0 . trusted

if [ ! -d ~/GNUstep ]; then
    /usr/bin/wmaker.inst --nodock
fi

WP_DIR="/usr/share/wagashi/wallpapers"
RATIO=$(python3 -c "
import subprocess, re
out = subprocess.check_output(['xrandr']).decode()
m = re.search(r'(\d+)x(\d+)\+', out)
if m:
    w, h = int(m.group(1)), int(m.group(2))
    r = w/h
    if abs(r - 4/3) < 0.1: print('4-3')
    elif abs(r - 16/10) < 0.1: print('16-10')
    else: print('16-9')
else: print('16-9')
")
wmsetbg -s "${WP_DIR}/Hikaru_${RATIO}.png" 2>/dev/null

/usr/bin/wmaker &
sleep 5
/usr/bin/sakura -e /usr/local/bin/hikaru-live &
wait
