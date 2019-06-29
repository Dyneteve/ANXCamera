package com.android.camera2.compat;

import android.annotation.TargetApi;
import android.hardware.camera2.CameraCharacteristics.Key;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.params.StreamConfiguration;
import com.android.camera2.vendortag.CameraCharacteristicsVendorTags;
import com.android.camera2.vendortag.CaptureRequestVendorTags;
import com.android.camera2.vendortag.VendorTag;
import com.android.camera2.vendortag.VendorTagHelper;

@TargetApi(21)
class MiCameraCompatMtkImpl extends MiCameraCompatBaseImpl {
    MiCameraCompatMtkImpl() {
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

    public void applyFrontMirror(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.FRONT_MIRROR, Boolean.valueOf(z));
        VendorTagHelper.setValueQuietly(builder, CaptureRequestVendorTags.SANPSHOT_FLIP_MODE, Integer.valueOf(z ? 1 : 0));
    }

    public void applyHdrBracketMode(Builder builder, byte b) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.HDR_BRACKET_MODE, Byte.valueOf(b));
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
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.RECORDING_END_STREAM, Byte.valueOf(z ^ true ? (byte) 1 : 0));
    }

    public VendorTag<Key<StreamConfiguration[]>> getDefaultSteamConfigurationsTag() {
        return CameraCharacteristicsVendorTags.SCALER_AVAILABLE_STREAM_CONFIGURATIONS;
    }
}
