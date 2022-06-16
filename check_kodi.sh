#!/usr/bin/env bash

proc=$(ps ax | grep /usr/bin/kodi | grep -v grep | wc -l)
exe="/usr/bin/kodi"


#Check noROOT
if  [ "$(id -u)" = 0 ]
then
    echo "root privileges are not needed" >&2
    exit 1
fi

function checkKODI () {
if [ "$proc" -eq 0 ]; then
    echo "$(date +'%d.%m.%Y_%H.%M') kodi is not start" >> /home/$(whoami)/crash_kodi.log
    sleep 2 #delay
    $exe
fi
}
while [ true ]; do
    checkKODI
done
