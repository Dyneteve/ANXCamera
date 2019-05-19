package com.android.camera2;

import android.annotation.TargetApi;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.CaptureResult.Key;
import android.hardware.camera2.marshal.MarshalRegistry;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera2.AECFrameControl.MarshalQueryableAECFrameControl;
import com.android.camera2.AFFrameControl.MarshalQueryableAFFrameControl;
import com.android.camera2.AWBFrameControl.MarshalQueryableAWBFrameControl;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

@TargetApi(21)
public class CaptureResultParser {
    private static final float AECGAIN_THRESHOLD = 2.0f;
    private static final Key<byte[]> AEC_FRAME = new Key<>(VENDOR_TAG_AEC_FRAME_CONTROL, byte[].class);
    private static final Key<AECFrameControl> AEC_FRAME_CONTROL = genResultKey(VENDOR_TAG_AEC_FRAME_CONTROL, AECFrameControl.class);
    private static final Key<AFFrameControl> AF_FRAME_CONTROL = genResultKey(VENDOR_TAG_AF_FRAME_CONTROL, AFFrameControl.class);
    private static final Key<Byte> AI_HDR_DETECTED = genByteRequestKey(VENDOR_TAG_HDR_DETECTED_MODES);
    private static final Key<Integer> AI_SCENE_DETECTED = genIntegerResultKey(VENDOR_TAG_ASD_DETECTED_MODES);
    private static final Key<Byte> AI_SCENE_ENABLE = genByteRequestKey(VENDOR_TAG_ASD_ENABLE);
    private static final Key<AWBFrameControl> AWB_FRAME_CONTROL = genResultKey(VENDOR_TAG_AWB_FRAME_CONTROL, AWBFrameControl.class);
    private static final Key<Integer> BEAUTY_BODY_SLIM_COUNT = genIntegerResultKey(VENDOR_TAG_BEAUTY_BODY_SLIM_COUNT);
    public static final Key<Byte> FAST_ZOOM_RESULT = genByteRequestKey(VENDOR_TAG_FAST_ZOOM_RESULT);
    private static final Key<Boolean> IS_SR_ENABLE = genResultKey(VENDOR_TAG_SUPER_RESOLUTION_ENABLED, Boolean.class);
    public static final Key<Byte[]> KEY_HDR_CHECKTER_EV_VALUES = genResultKey(VENDOR_TAG_HDR_CHECKER, Byte[].class);
    private static final Key<Integer> LENS_DIRTY_DETECTED = genIntegerResultKey(VENDOR_TAG_LENS_DIRTY_DETECTED);
    private static final Key<Integer> MULTIFRAME_INPUTNUM = genIntegerResultKey(VENDOR_TAG_MULTIFRAME_INPUTNUM);
    private static final String TAG = CaptureResultParser.class.getSimpleName();
    public static final Key<Integer> ULTR_WIDE_RECOMMENDED_RESULT = genIntegerResultKey(VENDOR_TAG_ULTRA_WIDE_RECOMMENDED);
    public static final String VENDOR_TAG_AEC_FRAME_CONTROL = "org.quic.camera2.statsconfigs.AECFrameControl";
    public static final String VENDOR_TAG_AF_FRAME_CONTROL = "org.quic.camera2.statsconfigs.AFFrameControl";
    public static final String VENDOR_TAG_ASD_DETECTED_MODES = "xiaomi.ai.asd.sceneDetected";
    public static final String VENDOR_TAG_ASD_ENABLE = "xiaomi.ai.asd.enabled";
    public static final String VENDOR_TAG_AWB_FRAME_CONTROL = "org.quic.camera2.statsconfigs.AWBFrameControl";
    public static final String VENDOR_TAG_BEAUTY_BODY_SLIM_COUNT = "xiaomi.beauty.bodySlimCnt";
    public static final String VENDOR_TAG_FAST_ZOOM_RESULT = "xiaomi.smoothTransition.result";
    public static final String VENDOR_TAG_HDR_CHECKER = "xiaomi.hdr.hdrChecker";
    public static final String VENDOR_TAG_HDR_DETECTED_MODES = "xiaomi.hdr.hdrDetected";
    public static final String VENDOR_TAG_LENS_DIRTY_DETECTED = "xiaomi.ai.add.lensDirtyDetected";
    public static final String VENDOR_TAG_MULTIFRAME_INPUTNUM = "xiaomi.multiframe.inputNum";
    public static final String VENDOR_TAG_SUPER_RESOLUTION_ENABLED = "xiaomi.superResolution.enabled";
    public static final String VENDOR_TAG_ULTRA_WIDE_RECOMMENDED = "xiaomi.ai.misd.ultraWideRecommended";

    static {
        MarshalRegistry.registerMarshalQueryable(new MarshalQueryableAWBFrameControl());
        if (Util.isShowPreviewDebugInfo()) {
            MarshalRegistry.registerMarshalQueryable(new MarshalQueryableAECFrameControl());
            MarshalRegistry.registerMarshalQueryable(new MarshalQueryableAFFrameControl());
        }
    }

    static Key<Byte> genByteRequestKey(String str) {
        return genResultKey(str, Byte.class);
    }

    static Key<Integer> genIntegerResultKey(String str) {
        return genResultKey(str, Integer.class);
    }

    static <T> Key<T> genResultKey(String str, Class<T> cls) {
        return new Key<>(str, cls);
    }

    public static AECFrameControl getAECFrameControl(CaptureResult captureResult) {
        return (AECFrameControl) captureResult.get(AEC_FRAME_CONTROL);
    }

    public static AFFrameControl getAFFrameControl(CaptureResult captureResult) {
        return (AFFrameControl) captureResult.get(AF_FRAME_CONTROL);
    }

    public static AWBFrameControl getAWBFrameControl(CaptureResult captureResult) {
        return (AWBFrameControl) captureResult.get(AWB_FRAME_CONTROL);
    }

    public static int getAsdDetectedModes(CaptureResult captureResult) {
        Integer num = (Integer) captureResult.get(AI_SCENE_DETECTED);
        if (num != null) {
            return num.intValue();
        }
        return 0;
    }

    public static int getBeautyBodySlimCountResult(CaptureResult captureResult) {
        try {
            Integer num = (Integer) captureResult.get(BEAUTY_BODY_SLIM_COUNT);
            if (num != null) {
                return num.intValue();
            }
            return 0;
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Could not find tag for key ");
            sb.append(BEAUTY_BODY_SLIM_COUNT);
            Log.e(str, sb.toString());
            return -1;
        }
    }

    public static boolean getFastZoomResult(CaptureResult captureResult) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("FAST_ZOOM_RESULT = ");
        sb.append(captureResult.get(FAST_ZOOM_RESULT));
        Log.d(str, sb.toString());
        Byte b = (Byte) captureResult.get(FAST_ZOOM_RESULT);
        return b != null && b.byteValue() == 1;
    }

    public static int getHDRDetectedScene(CaptureResult captureResult) {
        Byte b = (Byte) captureResult.get(AI_HDR_DETECTED);
        if (b != null) {
            return b.byteValue();
        }
        return 0;
    }

    public static Byte[] getHdrCheckerValues(CaptureResult captureResult) {
        return (Byte[]) captureResult.get(KEY_HDR_CHECKTER_EV_VALUES);
    }

    public static int getUltraWideDetectedResult(CaptureResult captureResult) {
        Integer num;
        try {
            num = (Integer) captureResult.get(ULTR_WIDE_RECOMMENDED_RESULT);
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Could not find tag for key ");
            sb.append(ULTR_WIDE_RECOMMENDED_RESULT);
            Log.e(str, sb.toString());
            num = null;
        }
        if (num != null) {
            return num.intValue();
        }
        return 0;
    }

    public static boolean isASDEnable(CaptureResult captureResult) {
        Byte b = (Byte) captureResult.get(AI_SCENE_ENABLE);
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
        Integer num = (Integer) captureResult.get(LENS_DIRTY_DETECTED);
        boolean z = false;
        if (num == null) {
            return false;
        }
        if (num.intValue() == 1) {
            z = true;
        }
        return z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:8:0x005d  */
    /* JADX WARNING: Removed duplicated region for block: B:9:0x005f  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean isQuadCfaRunning(CaptureResult captureResult) {
        float f;
        boolean gu = DataRepository.dataItemFeature().gu();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isQuadCfaRunning: support=");
        sb.append(gu);
        Log.d(str, sb.toString());
        if (gu) {
            byte[] bArr = (byte[]) captureResult.get(AEC_FRAME);
            if (bArr != null) {
                ByteBuffer order = ByteBuffer.wrap(bArr).order(ByteOrder.nativeOrder());
                order.getLong();
                f = order.getFloat();
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

    public static boolean isSREnable(CaptureResult captureResult) {
        Boolean bool = (Boolean) captureResult.get(IS_SR_ENABLE);
        if (bool != null) {
            return bool.booleanValue();
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isSREnable: No CaptureResult key found:");
        sb.append(IS_SR_ENABLE.getName());
        Log.d(str, sb.toString());
        return false;
    }
}
