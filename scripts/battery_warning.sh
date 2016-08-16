#!/bin/bash

grep "charging state:" /proc/acpi/battery/BAT0/state|grep discharging
[ $? == 1 ] && exit;
grep "capacity state:" /proc/acpi/battery/BAT0/state|grep ok
[ $? == 0 ] && exit;
notify-send -u critical -t 5000 -i '/home/xuer/Backup/48-png/48-laptop-battery.png' '警告' '电池电量即将用完,请及时充电。'
mplayer '/home/xuer/Backup/I-need-ammo.wav'  
