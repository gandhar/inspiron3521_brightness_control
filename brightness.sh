#!/bin/bash
#max brightness is 4882
brightness_value=$( zenity --list --radiolist\
  --title="Brightness"\
  --column="pick" --column="% brightness"\
  --height=350\
    FALSE 10\
    TRUE 20\
    FALSE 30\
    FALSE 40\
    FALSE 50\
    FALSE 60\
    FALSE 70\
    FALSE 80\
    FALSE 90\
    FALSE 100
)
if [ "$brightness_value" != "" ]; then
	brightness_actual=`expr $brightness_value \\* 48`
	echo "actual value $brightness_actual"
	echo " " | sudo -S su -c "echo $brightness_actual > /sys/class/backlight/intel_backlight/brightness"
	notify-send -t 3000 " Screen Brightness now $brightness_value %"
fi
