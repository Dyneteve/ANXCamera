# # This script will be executed in late_start service mode
# # More info in the main Magisk thread

if device_check "violet"; then 
  ui_print "violety condemns camserver sacrifice"
elif [ -f /sdcard/.anxnosacrifice ]; then
  ui_print "user shows mercy on camserver sacrifice"
else
  sleep 4
  killall -9 android.hardware.camera.provider@2.4-service
  ui_print "anx demands camserver sacrifice and rebirth"
fi
