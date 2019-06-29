# # This script will be executed in late_start service mode
# # More info in the main Magisk thread

sleep 4;
killall -9 android.hardware.camera.provider@2.4-service
ui_print "anx demands camserver sacrifice and rebirth"