package com.android.camera2.compat;

import android.annotation.TargetApi;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.log.Log;
import com.android.camera2.vendortag.CaptureRequestVendorTags;
import com.android.camera2.vendortag.VendorTagHelper;

@TargetApi(21)
class MiCameraCompatQcomImpl extends MiCameraCompatBaseImpl {
    MiCameraCompatQcomImpl() {
    }

    public void applyContrast(Builder builder, int i) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.CONTRAST_LEVEL, Integer.valueOf(i + 1));
    }

    public void applyCustomWB(Builder builder, int i) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.USE_CUSTOM_WB, Integer.valueOf(i));
    }

    public void applyExposureMeteringMode(Builder builder, int i) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.EXPOSURE_METERING, Integer.valueOf(i));
    }

    public void applyExposureTime(Builder builder, long j) {
        Long l = (Long) VendorTagHelper.getValue(builder, CaptureRequestVendorTags.ISO_EXP);
        if ((l == null || l.longValue() == 0) && j > 0) {
            VendorTagHelper.setValue(builder, CaptureRequestVendorTags.SELECT_PRIORITY, Integer.valueOf(1));
            if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                VendorTagHelper.setValue(builder, CaptureRequestVendorTags.ISO_EXP, Long.valueOf(j));
            }
            builder.set(CaptureRequest.SENSOR_SENSITIVITY, null);
        }
        super.applyExposureTime(builder, j);
    }

    public void applyHdrBracketMode(Builder builder, byte b) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.HDR_BRACKET_MODE, Byte.valueOf(b));
    }

    public void applyISO(Builder builder, int i) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.SELECT_PRIORITY, Integer.valueOf(0));
        if (i == 0) {
            VendorTagHelper.setValue(builder, CaptureRequestVendorTags.ISO_EXP, Long.valueOf(0));
        } else if (i == 100) {
            VendorTagHelper.setValue(builder, CaptureRequestVendorTags.ISO_EXP, Long.valueOf(2));
        } else if (i == 200) {
            VendorTagHelper.setValue(builder, CaptureRequestVendorTags.ISO_EXP, Long.valueOf(3));
        } else if (i == 400) {
            VendorTagHelper.setValue(builder, CaptureRequestVendorTags.ISO_EXP, Long.valueOf(4));
        } else if (i == 800) {
            VendorTagHelper.setValue(builder, CaptureRequestVendorTags.ISO_EXP, Long.valueOf(5));
        } else if (i == 1600) {
            VendorTagHelper.setValue(builder, CaptureRequestVendorTags.ISO_EXP, Long.valueOf(6));
        } else if (i != 3200) {
            StringBuilder sb = new StringBuilder();
            sb.append("applyISO(): set manual absolute iso value to ");
            sb.append(i);
            Log.d("MiCamera2", sb.toString());
            VendorTagHelper.setValue(builder, CaptureRequestVendorTags.ISO_EXP, Long.valueOf(8));
            VendorTagHelper.setValue(builder, CaptureRequestVendorTags.USE_ISO_VALUE, Integer.valueOf(i));
        } else {
            VendorTagHelper.setValue(builder, CaptureRequestVendorTags.ISO_EXP, Long.valueOf(7));
        }
    }

    public void applySaturation(Builder builder, int i) {
        int i2 = 0;
        switch (i) {
            case 1:
                i2 = 2;
                break;
            case 2:
                i2 = 4;
                break;
            case 3:
                i2 = 5;
                break;
            case 4:
                i2 = 6;
                break;
            case 5:
                i2 = 8;
                break;
            case 6:
                i2 = 10;
                break;
        }
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.SATURATION, Integer.valueOf(i2));
    }

    public void applySharpness(Builder builder, int i) {
        int i2 = 0;
        switch (i) {
            case 1:
                i2 = 1;
                break;
            case 2:
                i2 = 2;
                break;
            case 3:
                i2 = 3;
                break;
            case 4:
                i2 = 4;
                break;
            case 5:
                i2 = 5;
                break;
            case 6:
                i2 = 6;
                break;
        }
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.SHARPNESS_CONTROL, Integer.valueOf(i2));
    }

    public void applyVideoStreamState(Builder builder, boolean z) {
        String str = "MiCameraCompat";
        StringBuilder sb = new StringBuilder();
        sb.append("recordingEndOfStream: ");
        sb.append(z ? "0x0" : "0x1");
        Log.d(str, sb.toString());
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.RECORDING_END_STREAM, Byte.valueOf(z ^ true ? (byte) 1 : 0));
    }
}
