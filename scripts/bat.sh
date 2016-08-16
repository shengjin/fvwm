#!/bin/bash
case "$1" in
"speak") echo "$[100*` awk '{print $1}' /sys/class/power_supply/BAT1/charge_now `/` awk '{print $1}' /sys/class/power_supply/BAT1/charge_full `]%" | esddsp festival --tts -b;;
*) echo $[100*`cat /sys/class/power_supply/BAT1/charge_now | awk {'print $1'}`/`cat /sys/class/power_supply/BAT1/charge_full | awk {'print $1'}`] ;;
esac

#grep "charging state:" /sys/class/power_supply/BAT0/status|grep Discharging
#[ $? == 1 ] && exit;
#grep "capacity state:" /sys/class/power_supply/BAT0/status|grep ok
#[ $? == 0 ] && exit;
#notify-send -u critical -t 5000 -i '警告' '电池电量即将用完,请及时充电。'
