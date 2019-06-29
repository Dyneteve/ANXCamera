package com.android.camera2;

import android.annotation.TargetApi;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.marshal.MarshalRegistry;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera2.vendortag.CaptureResultVendorTags;
import com.android.camera2.vendortag.VendorTagHelper;
import com.android.camera2.vendortag.struct.AECFrameControl;
import com.android.camera2.vendortag.struct.AECFrameControl.MarshalQueryableAECFrameControl;
import com.android.camera2.vendortag.struct.AFFrameControl;
import com.android.camera2.vendortag.struct.AFFrameControl.MarshalQueryableAFFrameControl;
import com.android.camera2.vendortag.struct.AWBFrameControl;
import com.android.camera2.vendortag.struct.AWBFrameControl.MarshalQueryableAWBFrameControl;

@TargetApi(21)
public class CaptureResultParser {
    private static final float AECGAIN_THRESHOLD = 2.0f;
    private static final String TAG = CaptureResultParser.class.getSimpleName();

    static {
        MarshalRegistry.registerMarshalQueryable(new MarshalQueryableAWBFrameControl());
        MarshalRegistry.registerMarshalQueryable(new MarshalQueryableAECFrameControl());
        MarshalRegistry.registerMarshalQueryable(new MarshalQueryableAFFrameControl());
    }

    public static AECFrameControl getAECFrameControl(CaptureResult captureResult) {
        return (AECFrameControl) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.AEC_FRAME_CONTROL);
    }

    public static AFFrameControl getAFFrameControl(CaptureResult captureResult) {
        return (AFFrameControl) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.AF_FRAME_CONTROL);
    }

    public static AWBFrameControl getAWBFrameControl(CaptureResult captureResult) {
        return (AWBFrameControl) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.AWB_FRAME_CONTROL);
    }

    public static float getAecLux(CaptureResult captureResult) {
        Float f = (Float) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.AEC_LUX);
        if (f == null) {
            return 0.0f;
        }
        return f.floatValue();
    }

    public static int getAsdDetectedModes(CaptureResult captureResult) {
        Integer num = (Integer) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.AI_SCENE_DETECTED);
        if (num != null) {
            return num.intValue();
        }
        return 0;
    }

    public static int getBeautyBodySlimCountResult(CaptureResult captureResult) {
        Integer num = (Integer) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.BEAUTY_BODY_SLIM_COUNT);
        if (num != null) {
            return num.intValue();
        }
        return 0;
    }

    public static boolean getFastZoomResult(CaptureResult captureResult) {
        Byte b = (Byte) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.FAST_ZOOM_RESULT);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("FAST_ZOOM_RESULT = ");
        sb.append(b);
        Log.d(str, sb.toString());
        return b != null && b.byteValue() == 1;
    }

    public static int getHDRDetectedScene(CaptureResult captureResult) {
        Byte b = (Byte) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.AI_HDR_DETECTED);
        if (b != null) {
            return b.byteValue();
        }
        return 0;
    }

    public static byte[] getHdrCheckerValues(CaptureResult captureResult) {
        return (byte[]) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.HDR_CHECKTER_EV_VALUES);
    }

    public static int getUltraWideDetectedResult(CaptureResult captureResult) {
        Integer num = (Integer) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.ULTRA_WIDE_RECOMMENDED_RESULT);
        if (num != null) {
            return num.intValue();
        }
        return 0;
    }

    public static boolean isASDEnable(CaptureResult captureResult) {
        Byte b = (Byte) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.AI_SCENE_ENABLE);
        boolean z = false;
        if (b == null) {
            return false;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isASDEnable: ");
        sb.append(b);
        Log.d(str, sb.toString());
        if (b.byteValue() == 1) {
            z = true;
        }
        return z;
    }

    public static boolean isLensDirtyDetected(CaptureResult captureResult) {
        Integer num = (Integer) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.LENS_DIRTY_DETECTED);
        boolean z = false;
        if (num == null) {
            return false;
        }
        if (num.intValue() == 1) {
            z = true;
        }
        return z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x0062  */
    /* JADX WARNING: Removed duplicated region for block: B:14:? A[RETURN, SYNTHETIC] */
    public static boolean isQuadCfaRunning(CaptureResult captureResult) {
        float f;
        boolean hb = DataRepository.dataItemFeature().hb();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isQuadCfaRunning: support=");
        sb.append(hb);
        Log.d(str, sb.toString());
        if (hb) {
            AECFrameControl aECFrameControl = (AECFrameControl) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.AEC_FRAME_CONTROL);
            if (!(aECFrameControl == null || aECFrameControl.getAecExposureDatas() == null || aECFrameControl.getAecExposureDatas().length <= 0)) {
                f = aECFrameControl.getAecExposureDatas()[0].getLinearGain();
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("isQuadCfaRunning: gain=");
                sb2.append(f);
                Log.d(str2, sb2.toString());
                return f >= 2.0f;
            }
        }
        f = 3.0f;
        String str22 = TAG;
        StringBuilder sb22 = new StringBuilder();
        sb22.append("isQuadCfaRunning: gain=");
        sb22.append(f);
        Log.d(str22, sb22.toString());
        if (f >= 2.0f) {
        }
    }

    public static boolean isRemosaicDetected(CaptureResult captureResult) {
        Boolean bool = (Boolean) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.REMOSAIC_DETECTED);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isRemosaicDetected: ");
        sb.append(bool);
        Log.d(str, sb.toString());
        return bool != null && bool.booleanValue();
    }

    public static boolean isSREnable(CaptureResult captureResult) {
        Boolean bool = (Boolean) VendorTagHelper.getValueQuietly(captureResult, CaptureResultVendorTags.IS_SR_ENABLE);
        return bool != null && bool.booleanValue();
    }
}
