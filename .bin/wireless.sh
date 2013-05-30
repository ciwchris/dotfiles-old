#!/bin/sh

/usr/sbin/iwconfig wlp3s0 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

essid=`/usr/bin/iwconfig wlp3s0 | awk -F '"' '/ESSID/ {print $2}'`
stngth=`/usr/bin/iwconfig wlp3s0 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`

battery=`acpi -b | awk -F ',' '/Discharging/ {print $2}'`
if [ ${battery%?} -lt 5 ]; then
	`zenity --notification --window-icon '/usr/share/zenity/zenity-notification.png'  --text "Battery at $battery" --timeout 1`
fi

#bars=`expr $stngth / 10`
#
#case $bars in
#  0)     bar='[-----]' ;;
#  1|2)   bar='[/----]' ;;
#  3|4)   bar='[//---]' ;;
#  5|6)   bar='[///--]' ;;
#  7|8)   bar='[////-]' ;;
#  9|10)  bar='[/////]' ;;
#  *)     bar='[--!--]' ;;
#esac

echo $essid $stngth%

exit 0
