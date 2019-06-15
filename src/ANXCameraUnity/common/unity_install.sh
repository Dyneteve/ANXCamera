
ROPRODEV=$(getprop ro.product.device)

ui_print "Your device is recognized as $ROPRODEV" 
ui_print "It should be one of below:" 
ui_print "  beryllium"
ui_print "  dipper"
ui_print "  polaris"
ui_print "  perseus"
ui_print "  cepheus"
ui_print "  lavender"
ui_print "  violet"
ui_print "  whyred"
ui_print "  equuleus"
ui_print "  raphael"
ui_print ""
ui_print "In decreasing order of support"
ui_print ""
ui_print ""

if device_check "cepheus"; then 
	rm -rf $TMPDIR/system/lib/
	rm -rf $TMPDIR/system/lib64/
	ui_print "cephy was here, it hates poco libs"
fi

if device_check "perseus"; then 
	rm -rf $TMPDIR/system/lib/
	rm -rf $TMPDIR/system/lib64/
	ui_print "persy was here, it hates poco libs"
fi
