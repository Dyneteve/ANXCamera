# This script will be executed in late_start service mode
# More info in the main Magisk thread

if [ device_check "cepheus" ] || [ device_check "perseus" ];
	then 
		rm -rf $MODPATH/system/lib/
		rm -rf $MODPATH/system/lib64/
fi

killall -9 android.hardware.camera.provider@2.4-service