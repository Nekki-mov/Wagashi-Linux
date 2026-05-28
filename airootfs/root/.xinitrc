#!/bin/sh
export PATH=/usr/local/bin:/usr/bin:/bin
export DISPLAY=:0

# Inicializar xauth
touch /root/.Xauthority
xauth generate :0 . trusted

if [ ! -d ~/GNUstep ]; then
    /usr/bin/wmaker.inst --nodock
fi

/usr/bin/wmaker &
sleep 5
/usr/bin/sakura -e /usr/local/bin/hikaru &
wait
