# On ubuntu the brightness setting is not sticky across reboot,
# there is a way to do this by setting a file
# note that intel_backlight may be vendor specific (in this case, a Lenovo) 
#
MAX_BRIGHTNESS=/sys/class/backlight/intel_backlight/max_brightness
BRIGHTNESS_SETTING=/sys/class/backlight/intel_backlight/brightness
 
if [ -e "$MAX_BRIGHTNESS" ]
then
	MAX=`cat $MAX_BRIGHTNESS`
	echo "Max brightness of this machine is $MAX."
	HALF=`expr $MAX / 2`
	echo "Setting it to half ($HALF)."
	sudo echo $HALF > $BRIGHTNESS_SETTING
fi
