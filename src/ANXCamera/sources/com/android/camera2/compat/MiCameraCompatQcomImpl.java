package com.android.camera2.compat;

import android.annotation.TargetApi;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureRequest.Key;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.constant.MiCameraCharacteristics;
import com.android.camera.log.Log;
import java.util.HashSet;

@TargetApi(21)
class MiCameraCompatQcomImpl extends MiCameraCompatBaseImpl {
    private static final Key<Integer> CONTRAST_LEVEL = genIntegerRequestKey("org.codeaurora.qcamera3.contrast.level");
    private static final Key<Integer> EXPOSURE_METERING = genIntegerRequestKey("org.codeaurora.qcamera3.exposure_metering.exposure_metering_mode");
    private static final int EXP_TIME_PRIORITY = 1;
    private static final Key<Long> ISO_EXP = genRequestKey("org.codeaurora.qcamera3.iso_exp_priority.use_iso_exp_priority", Long.class);
    private static final int ISO_PRIORITY = 0;
    private static final Key<Byte> KEY_HDR_BRACKET_MODE = genByteRequestKey("org.codeaurora.qcamera3.ae_bracket.mode");
    private static final Key<Byte> RECORDING_END_STREAM = genByteRequestKey("org.quic.camera.recording.endOfStream");
    private static final Key<Integer> SATURATION = genIntegerRequestKey("org.codeaurora.qcamera3.saturation.use_saturation");
    private static final Key<Integer> SELECT_PRIORITY = genIntegerRequestKey("org.codeaurora.qcamera3.iso_exp_priority.select_priority");
    private static final Key<Integer> SHARPNESS_CONTROL = genIntegerRequestKey("org.codeaurora.qcamera3.sharpness.strength");
    private static final Key<Integer> USE_CUSTOM_WB = genIntegerRequestKey("com.qti.stats.awbwrapper.AWBCCT");
    private static final Key<Integer> USE_ISO_VALUE = genIntegerRequestKey("org.codeaurora.qcamera3.iso_exp_priority.use_iso_value");

    MiCameraCompatQcomImpl() {
    }

    public void applyContrast(Builder builder, int i) {
        builder.set(CONTRAST_LEVEL, Integer.valueOf(i + 1));
    }

    public void applyCustomWB(Builder builder, int i) {
        builder.set(USE_CUSTOM_WB, Integer.valueOf(i));
    }

    public void applyExposureMeteringMode(Builder builder, int i) {
        builder.set(EXPOSURE_METERING, Integer.valueOf(i));
    }

    public void applyExposureTime(Builder builder, long j) {
        Long l = (Long) builder.get(ISO_EXP);
        if ((l == null || l.longValue() == 0) && j > 0) {
            builder.set(SELECT_PRIORITY, Integer.valueOf(1));
            if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                builder.set(ISO_EXP, Long.valueOf(j));
            }
            builder.set(CaptureRequest.SENSOR_SENSITIVITY, null);
        }
        super.applyExposureTime(builder, j);
    }

    public void applyHdrBracketMode(Builder builder, byte b) {
        builder.set(KEY_HDR_BRACKET_MODE, Byte.valueOf(b));
    }

    public void applyISO(Builder builder, int i) {
        builder.set(SELECT_PRIORITY, Integer.valueOf(0));
        if (i == 0) {
            builder.set(ISO_EXP, Long.valueOf(0));
        } else if (i == 100) {
            builder.set(ISO_EXP, Long.valueOf(2));
        } else if (i == 200) {
            builder.set(ISO_EXP, Long.valueOf(3));
        } else if (i == 400) {
            builder.set(ISO_EXP, Long.valueOf(4));
        } else if (i == 800) {
            builder.set(ISO_EXP, Long.valueOf(5));
        } else if (i == 1600) {
            builder.set(ISO_EXP, Long.valueOf(6));
        } else if (i != 3200) {
            StringBuilder sb = new StringBuilder();
            sb.append("applyISO(): set manual absolute iso value to ");
            sb.append(i);
            Log.d("MiCamera2", sb.toString());
            builder.set(ISO_EXP, Long.valueOf(8));
            builder.set(USE_ISO_VALUE, Integer.valueOf(i));
        } else {
            builder.set(ISO_EXP, Long.valueOf(7));
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
        builder.set(SATURATION, Integer.valueOf(i2));
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
        builder.set(SHARPNESS_CONTROL, Integer.valueOf(i2));
    }

    public void applyVideoStreamState(Builder builder, boolean z) {
        String str = "MiCameraCompat";
        StringBuilder sb = new StringBuilder();
        sb.append("recordingEndOfStream: ");
        sb.append(z ? "0x0" : "0x1");
        Log.d(str, sb.toString());
        builder.set(RECORDING_END_STREAM, Byte.valueOf(z ^ true ? (byte) 1 : 0));
    }

    public boolean supportContrast(HashSet<String> hashSet) {
        return hashSet.contains(CONTRAST_LEVEL.getName());
    }

    public boolean supportExtraHighSpeedVideoConfiguration(HashSet<String> hashSet) {
        return hashSet != null && hashSet.contains(MiCameraCharacteristics.EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS.getName()) && hashSet.contains(MiCameraCharacteristics.EXTRA_HIGH_SPEED_VIDEO_NUMBER.getName());
    }
}
